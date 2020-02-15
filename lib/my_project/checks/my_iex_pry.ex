defmodule MyProject.Checks.MyIExPry do
  @moduledoc false

  @checkdoc """
  While calls to IEx.pry might appear in some parts of production code,
  most calls to this function are added during debugging sessions.

  This check warns about those calls, because they might have been committed
  in error.
  """
  @explanation [check: @checkdoc]

  use Credo.Check, base_priority: :high, category: :warning

  @default_params [excluded: []]
  def run(source_file, params \\ []) do
    excluded = Params.get(params, :excluded, @default_params)
    excluded_for_source_file? = Enum.any?(excluded, &(source_file.filename =~ &1))

    if excluded_for_source_file? do
      []
    else
      issue_meta = IssueMeta.for(source_file, params)

      Credo.Code.prewalk(source_file, &traverse(&1, &2, issue_meta))
    end
  end

  defp traverse(
         {
           {:., _, [{:__aliases__, _, [:IEx]}, :pry]},
           meta,
           _arguments
         } = ast,
         issues,
         issue_meta
       ) do
    {ast, [issue_for(meta[:line], issue_meta) | issues]}
  end

  defp traverse(ast, issues, _issue_meta) do
    {ast, issues}
  end

  defp issue_for(line_no, issue_meta) do
    format_issue(
      issue_meta,
      message: "There should be no calls to IEx.pry/0.",
      trigger: "IEx.pry",
      line_no: line_no
    )
  end
end
