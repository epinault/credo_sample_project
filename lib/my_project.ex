defmodule MyProject do
  @moduledoc """
  Documentation for MyProject.
  """

  def add(a, b) do
    c = a + b
    require IEx
    IEx.pry()
  end
end
