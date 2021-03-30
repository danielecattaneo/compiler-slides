add_llvm_library(MyHelloPass MODULE
  Hello.cpp

  PLUGIN_TOOL
  opt
  )

