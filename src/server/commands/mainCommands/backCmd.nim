import asyncdispatch

import ../../types

proc execProc(args: seq[string], server: C2Server) {.async.} =
  if server.cli.mode == ShellMode:
    server.cli.mode = ClientInteractMode
  else:
    server.cli.mode = MainMode
    server.cli.handlingClient = nil

let cmd*: Command = Command(
  execProc: execProc,
  name: "back",
  argsLength: 1,
  usage: @["back"],
  description: "Go back to the main menu or exit shell mode",
  category: CCNavigation
)