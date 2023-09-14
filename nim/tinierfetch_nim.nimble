# Package

version       = "0.1.0"
author        = "xTrayambak"
description   = "Tinierfetch, written in the Nim programming language"
license       = "MIT"
srcDir        = "src"
bin           = @["tinierfetch_nim"]


# Dependencies

requires "nim >= 1.6.14"

task speed, "Built with all optimization flags*":
  exec "nim c -o:../bin/tinierfetch-nim -d:color -d:danger -d:release -d:quick src/tinierfetch_nim.nim"
