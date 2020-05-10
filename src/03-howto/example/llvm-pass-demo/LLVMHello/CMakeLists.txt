add_llvm_library(MyHelloPass MODULE
  Hello.cpp

  PLUGIN_TOOL
  opt
  )

if(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
  set_property(TARGET MyHelloPass APPEND_STRING PROPERTY
    LINK_FLAGS " -undefined dynamic_lookup")
endif()

set_property(TARGET MyHelloPass PROPERTY CXX_STANDARD 11)
set_property(TARGET MyHelloPass PROPERTY CXX_STANDARD_REQUIRED ON)
