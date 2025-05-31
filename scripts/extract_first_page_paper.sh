pdfseparate -f 1 -l 1 "$1" /tmp/tmp.pdf
magick -density 300 /tmp/tmp.pdf -background white -alpha remove "$2"
