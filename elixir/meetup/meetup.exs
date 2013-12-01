defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday :: :monday | :tuesday | :wednesday | :thursday | :friday |
    :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    range = day_of_month_range(year, month, schedule)
    day_of_week = day_number(weekday)
    day = Enum.find range, &(:calendar.day_of_the_week(year, month, &1) == day_of_week)
    { year, month, day }
  end

  defp day_number(weekday) do
    case weekday do
      :monday -> 1
      :tuesday -> 2
      :wednesday -> 3
      :thursday -> 4
      :friday -> 5
      :saturday -> 6
      :sunday -> 7
    end
  end

  defp day_of_month_range(year, month, schedule) do
    case schedule do
      :first -> 1..7
      :second -> 8..14
      :third -> 15..21
      :fourth -> 22..28
      :teenth -> 13..19
      :last ->
        last_day = :calendar.last_day_of_the_month(year, month)
        (last_day - 6)..last_day
    end
  end

end
