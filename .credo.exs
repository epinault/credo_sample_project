%{
  configs: [
    %{
      name: "default",
      requires: ["./lib/my_project/checks/**/*.ex"],
      checks: [
        {Credo.Check.Warning.IExPry, false},
        {MyProject.Checks.MyIExPry, [excluded: ["lib/my_project.ex"]]},
        {MyProject.Checks.SpaceInParentheses, []}
      ],
      plugins: [
        {CredoDemoPlugin, []}
      ]
    }
  ]
}
