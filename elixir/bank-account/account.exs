defmodule BankAccount do
  use GenServer.Behaviour

  @moduledoc """
  A bank account that supports access from multiple processes.
  """

  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  @doc """
  Open the bank. Makes the account available.
  """
  @spec open_bank() :: account
  def open_bank() do
    { :ok, account } = :gen_server.start_link(__MODULE__, 0, [])
    account
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: none
  def close_bank(account) do
    :gen_server.cast(account, { :close })
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance(account) do
    :gen_server.call(account, { :balance })
  end

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any
  def update(account, amount) do
    :gen_server.cast(account, { :update, amount })
  end

  # GenServer API

  def init(balance) do
    { :ok, balance }
  end

  def handle_call({ :balance }, _from, balance) do
    { :reply, balance, balance }
  end

  def handle_cast({ :update, amount }, balance) do
    { :noreply, balance + amount }
  end

  def handle_cast({ :close }, balance) do
    { :stop, :normal, balance }
  end

end
