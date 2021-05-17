#!/bin/bash -ue

PROJECT=$1
shift || (echo "Arguments: <project> [dir]"; exit 2)

if [ $# -gt 0 ]; then
    DIR=$1
elif [ $# -eq 0 ]; then
    DIR=/tmp/typerex-fromsource/$PROJECT
    trap "rm -rf $DIR" EXIT
    opam source --dev-repo $PROJECT --dir $DIR
else
    echo "Arguments: <project> [dir]"
    exit 2
fi

mkhtml () {
    cat <<EOF
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
#include "head.include"
   <title>TypeRex: $PROJECT</title>
</head>
<body>

#include "body.header.include"
EOF

    omd $DIR/doc/$PROJECT.md

    cat <<"EOF"
#include "body.trailer.include"

</body>
</html>
EOF
}

mkhtml > sources/$PROJECT.page.html
echo "sources/$PROJECT.page.html generated"
