#!/bin/bash -ue

PROJECTS=(ocp-build ocp-indent ocp-index ocplib-endian ocaml-top operf-micro)

FILES=sources/*.page.html
DEFINE=sources/define.h

echo > $DEFINE
for project in ${PROJECTS[*]}; do
  macro=`echo $project | tr '[:lower:]' '[:upper:]' | tr -d '-'`
  echo $macro
  version=`opam info $project -f version`
  echo "#define $macro $version" >> $DEFINE
done

for src in $FILES; do
  dst=`basename $src .page.html`.html;
  echo Generating www/$dst
  cpp -P $src > www/$dst;
done
