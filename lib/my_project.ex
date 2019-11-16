defmodule MyProject do
  @moduledoc """
  Documentation for MyProject.
  """

  @doc """
  Hello world.

  ## Examples

      iex> MyProject.hello()
      :world

  """
  def hello do
    require IEx
    IEx.pry()
    :world
  end
end
