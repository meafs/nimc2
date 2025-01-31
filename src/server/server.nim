import asyncdispatch, asyncfutures
import types, logging, cli, ../utils

infoLog "initializing c2 server"

var commands: seq[Command] = @[]

importDirectory("src/server/commands/mainCommands", "commands/", "mainCommands")
importDirectory("src/server/commands/interactCommands", "commands/", "interactCommands")
loadCommands("src/server/commands/mainCommands")
loadCommands("src/server/commands/interactCommands")

let server = C2Server(
  cli: C2Cli(
    handlingClient: nil,
    mode: MainMode,
    commands: commands
  )
)

asyncCheck procStdin(server)

try:
  runForever()
except OSError: discard