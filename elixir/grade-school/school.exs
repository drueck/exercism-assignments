defmodule School do

  def add(roster, student, grade) do
    HashDict.update(roster, grade, [student], &1 ++ [student])
  end

  def grade(roster, grade) do
    roster[grade] || []
  end

  def sort(roster) do
    Enum.to_list(roster)
      |> Enum.map(fn { grade, students } -> { grade, Enum.sort(students) } end)
      |> HashDict.new
  end

end
