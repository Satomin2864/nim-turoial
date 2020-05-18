# Package

version       = "0.1.0"
author        = "Anonymous"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"



# Dependencies

requires "nim >= 1.2.0"
requires "jester >= 0.2.0"

# build dir
srcDir = "src"
binDir = "bin"
bin = @["nim_jester"]

# task
task serverstart, "start jester server":
  rmDir "bin"
  mkDir "bin/resources/conf"
  exec "cp -rf src/resources/conf bin/resources/"
  exec "nimble build"
  exec "bin/nim_jester"
