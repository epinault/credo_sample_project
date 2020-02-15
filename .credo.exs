%{
  configs: [
    %{
      name: "default",
      requires: ["./lib/my_project/checks/my_iex_pry.ex"],
      checks: [
        {Credo.Check.Warning.IExPry, false},
        {MyProject.Checks.MyIExPry, [excluded: ["lib/my_project.ex"]]}
      ],
      plugins: [
        {CredoDemoPlugin, []}
      ]
    }
  ]
}
