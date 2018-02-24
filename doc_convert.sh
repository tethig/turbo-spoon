#!/usr/bin/env bash

# Install pandoc if needed
command -v pandoc >/dev/null 2>&1 || { echo >&2 "I require pandoc so I will install."; brew install pandoc; }

# File name without extension
output="${1%.*}" # right strip to dot

# HTML header
header="<!DOCTYPE html>
<html>
<title>${output}</title>
<head>
<style type=\"text/css\">
@import \"http://fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic\";
html {
font-family: \"Noto Sans\", sans-serif;
font-size: 17px;
line-height: 1.5;
}
code {
border:1px solid black;
background-color:#EEEEFF;
white-space: pre-line;
padding:10px;
font-size:0.9em;
display: inline-block;
}
</style>
</head>
<body>"

# HTML footer
footer="</body>
</html>"

# Construct HTML
echo $header > ${output}.html
cat $1 | pandoc -f gfm >> ${output}.html # gfm = Github Flavoured Markdown
echo $footer >> ${output}.html
