import std/[os]

when defined(color):
  const COLORS: array[0..3, string] = [
    "31", "32", "33", "34"
  ]

proc main {.inline.} =
  for env in ["USER", "SHELL", "TERM", "LANG"]:
    when defined(color):
      echo("\033[0;m " & env & ":\033[0m " & getEnv(env) & "")
    else:
      echo(env & ": " & getEnv(env))

  echo("\x1B[35mcolors: \x1B[0m\x1B[41m \x1B[42m \x1B[43m \x1B[44m \x1B[45m \x1B[0m")

when isMainModule:
  main()
