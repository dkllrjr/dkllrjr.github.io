# Build CV

# includes
. ./build_page.sh --source-only


# args
FILE=$1
ARCH=$2
HEADER=$3
FOOTER=$4
BODY=$5
TXT=$6


# create file
touch $FILE


# header
build_header $FILE $HEADER


# body
echo "<body>" >> $FILE


# nav
build_nav $FILE $ARCH


# title
echo '<div class="figlet">' >> $FILE
cat $TXT/name.txt >> $FILE
echo '</div>' >> $FILE


# body
pandoc $BODY >> $FILE


# end body
echo "</body>" >> $FILE


# footer
build_footer $FILE $FOOTER
