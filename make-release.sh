#! /bin/bash
# 2023 tiagobrait

relName=st
relVersion=0.9.1
releaseDir='release'
sourceFiles=( 'arg.h'
              'boxdraw.c'
              'boxdraw_data.h'
              'config.def.h'
              'config.mk'
              'LICENSE'
              'Makefile'
              'st.1'
              'st.c'
              'st.h'
              'st.info'
              'win.h'
              'x.c'
            )

if [ ! -d release ]; then
  mkdir release
fi

# note to self: RTFM!!
#tar vczf "${releaseDir}"/"${relName}"-"${relVersion}".tar.gz -C "${PWD%/*}" "${sourceFiles[@]/#/${PWD##*/}/}"

tar vczf "${releaseDir}"/"${relName}"-"${relVersion}".tar.gz "${sourceFiles[@]}" --transform=s%^%"${relName}"-"${relVersion}"/%S
