import jester, posix, json, asyncdispatch, htmlgen, os, osproc, logging

let config_file_name = "bin/resources/conf/conf.json"

let conf = parseFile(config_file_name)
# Traditional logging to file. To use the more featureful journald you might
# use https://github.com/FedericoCeratto/nim-morelogging
let fl = newFileLogger(conf["log_fname"].str, fmtStr = "$datetime $levelname ")
fl.addHandler

# the "debug" and "info" macros from the logging module are not flushing the buffer
proc log_debug(args: varargs[string, `$`]) =
  debug args
  fl.file.flushFile()

proc log_info(args: varargs[string, `$`]) =
  info args
  fl.file.flushFile()

include "resources/templates/base.tmpl"
include "resources/templates/home.tmpl"

routes:
  get "/":
    resp base_page(generate_home_page())
  get "/hello":
    resp h1("Hello world test")

# ifじゃなくてwehn使うのか？
when isMainModule:
  log_info "starting"
  # asyncdispatch のやつらしい
  # 複数インスタンスを構えれるのかな？？
  runForever()