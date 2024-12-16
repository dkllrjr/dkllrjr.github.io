# Build CV

# includes
. ./build_page.sh --source-only


# args
FILE=$1
ARCH=$2
HEADER=$3
FOOTER=$4
BODY=$5


# create file
touch $FILE


# header
build_header $FILE $HEADER


# body
build_body $FILE $ARCH $BODY


# footer
build_footer $FILE $FOOTER
