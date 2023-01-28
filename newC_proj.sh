#!/bin/bash


if [ $# -eq 1 ]; then
	dir_name=$1

	text="#include <stdio.h>\n\n\nint main() {\n\n    return 0;\n}"

	mkdir $dir_name
	file_name=$dir_name".c"

	echo -e $text > $dir_name/$file_name
	exit
fi

echo "Too many/few arguments, exiting..."

