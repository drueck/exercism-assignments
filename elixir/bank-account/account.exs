defmodule BankAccount do

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
    spawn_link(__MODULE__, :start, [])
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: none
  def close_bank(account) do
    send(account, :close)
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance(account) do
    send(account, { :balance, self })
    receive do
      { :balance, balance } -> balance
    end
  end

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any
  def update(account, amount) do
    send(account, { :update, amount })
  end

  def start do
    await(0)
  end

  defp await(balance) do
    receive do
      { :balance, pid } ->
        send(pid, { :balance, balance })
        await(balance)
      { :update, new_balance } ->
        await(new_balance)
      :close ->
    end
  end

end
