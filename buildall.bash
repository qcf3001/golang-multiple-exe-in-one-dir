#!/bin/bash

function cleandots
{
  for dd in .tmp-*
  do
    if [[ "$dd" != ".tmp-*" ]]; then
      (cd "$dd" && rm -f *.go)
      rmdir "$dd"
    fi
  done
}

function setuplinks()
{
  for ff in *.go
  do
      exename=$(head -1 "$ff" | sed -e "s|.*//[ \t]*+main-\(.*\)[ \t]*$|\\1|")
      if [[ "$exename" != "" ]]; then
	  dd=".tmp-$exename"
	  mkdir -p "$dd"
	  (cd "$dd" && ln -s ../"$ff")
      fi
  done
}

function buildall
{
  for dd in .tmp-*
  do
    if [[ "$dd" != ".tmp-*" ]]; then
      exename=${dd#.tmp-}
      if [[ "$exename" != "" ]]; then
        (cd "$dd"; go build -o ../$exename)
      fi
    fi
  done
}

cleandots
setuplinks
buildall
cleandots

./foo1
./foo2

exit 0
