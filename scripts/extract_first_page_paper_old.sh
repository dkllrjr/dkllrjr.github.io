pdfseparate -f 1 -l 1 "$1" /tmp/tmp.pdf
#magick -density 200 -background white /tmp/tmp.pdf /tmp/tmp.png
#magick /tmp/tmp.png -crop x800+0+0 +repage "$2"
#magick /tmp/tmp.pdf -crop x400+0+0 -density 150 "$2"
pdfcompress -i /tmp/tmp.pdf -o "$2" -l ebook

