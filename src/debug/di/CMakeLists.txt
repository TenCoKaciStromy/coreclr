if(CLR_CMAKE_PLATFORM_ARCH_AMD64)
  add_definitions(-D_TARGET_WIN64_=1)
  add_definitions(-DDBG_TARGET_64BIT)
  add_definitions(-DDBG_TARGET_WIN64=1)
  add_definitions(-DDBG_TARGET_AMD64=1)
elseif(CLR_CMAKE_PLATFORM_ARCH_ARM)
  add_definitions(-D_TARGET_WIN32_=1)
  add_definitions(-DDBG_TARGET_32BIT)
  add_definitions(-DDBG_TARGET_WIN32=1)
  add_definitions(-DDBG_TARGET_ARM=1)
elseif(CLR_CMAKE_PLATFORM_ARCH_ARM64)
  add_definitions(-D_TARGET_WIN64_=1)
  add_definitions(-DDBG_TARGET_64BIT)
  add_definitions(-DDBG_TARGET_WIN64=1)
  add_definitions(-DDBG_TARGET_ARM64=1)
else()
  message(FATAL_ERROR "Only ARM, ARM64 and AMD64 is supported")
endif()

add_definitions(-DFEATURE_METADATA_CUSTOM_DATA_SOURCE -DFEATURE_METADATA_DEBUGGEE_DATA_SOURCE -DFEATURE_NO_HOST -DFEATURE_METADATA_LOAD_TRUSTED_IMAGES)

set(CORDBDI_SOURCES
  shimprocess.cpp
  shimcallback.cpp
  shimevents.cpp
  shimdatatarget.cpp
  shimstackwalk.cpp
  breakpoint.cpp
  cordb.cpp
  divalue.cpp
  dbgtransportmanager.cpp
  hash.cpp
  module.cpp
  nativepipeline.cpp
  platformspecific.cpp
  process.cpp
  rsappdomain.cpp
  rsassembly.cpp
  rsclass.cpp
  rsfunction.cpp
  rsmain.cpp
  rsmda.cpp
  rsregsetcommon.cpp
  rsstackwalk.cpp
  rsthread.cpp
  rstype.cpp
  shared.cpp
  symbolinfo.cpp
  valuehome.cpp
)

if(WIN32)
    #use static crt
    add_definitions(-MT) 

    set(CORDBDI_SOURCES
      ${CORDBDI_SOURCES}
      amd64/floatconversion.asm
    )
elseif(CLR_CMAKE_PLATFORM_UNIX)
    add_compile_options(-fPIC)

    if(CLR_CMAKE_PLATFORM_ARCH_AMD64)
      set(CORDBDI_SOURCES
        ${CORDBDI_SOURCES}
        amd64/floatconversion.S
      )
    endif()

endif(WIN32)

add_precompiled_header(stdafx.h stdafx.cpp CORDBDI_SOURCES)

add_library(cordbdi STATIC ${CORDBDI_SOURCES})
