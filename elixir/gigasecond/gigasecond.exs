defmodule Gigasecond do

  @one_gigasecond 1_000_000_000

	@doc """
	Calculate a date one billion seconds after an input date.
	"""
	@spec from({pos_integer, pos_integer, pos_integer}) :: :calendar.date

	def from({year, month, day}) do
    base_seconds = date_to_gregorian_seconds({year, month, day})
    gregorian_seconds_to_date(base_seconds + @one_gigasecond)
	end

  defp date_to_gregorian_seconds(date) do
    :calendar.datetime_to_gregorian_seconds({date, {0,0,0}})
  end

  defp gregorian_seconds_to_date(seconds) do
    { date, _time } = :calendar.gregorian_seconds_to_datetime(seconds)
    date
  end

end
