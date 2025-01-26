#  Building pages

build_header() {

    # args
    FILE=$1
    HEADER=$2

    # doctype
    echo '<!doctype html>' >> $FILE
    echo '<html lang="en">' >> $FILE

    # header
    cat $HEADER >> $FILE
}


build_footer() {

    # args
    FILE=$1
    FOOTER=$2

    # footer
    cat $FOOTER >> $FILE

    # closing doctype
    echo "</html>" >> $FILE
}


build_body() {

    # args
    FILE=$1
    ARCH=$2
    BODY=$3

    echo "<body>" >> $FILE

    # navbar
    build_nav $FILE $ARCH

    # body
    pandoc $BODY >> $FILE

    echo "</body>" >> $FILE
}


build_nav() {

    FILE=$1
    ARCH=$2

    echo '<nav class="navbar navbar-expand-sm navbar-light">' >> $FILE
    echo '<div class="container-fluid">' >> $FILE
    echo '<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">' >> $FILE
    echo '<span class="navbar-toggler-icon"></span>' >> $FILE
    echo '</button>' >> $FILE
    echo '<div class="collapse navbar-collapse justify-content-center" id="navbarNav">' >> $FILE

    echo '<ul class="navbar-nav">' >> $FILE

    # build array
    readarray tmp < <(yq -o=j -I=0 '.[]' $ARCH/navigation.yml)

    for i in "${tmp[@]}"; do

        name=`echo $i | yq -p=json '.name' -`
        link=`echo $i | yq -p=json '.link' -`

        echo "<li class='nav-item'><a class='nav-link' href=$link>$name</a></li>" >> $FILE

    done

    echo '</ul>' >> $FILE

    echo '</div>' >> $FILE
    echo '</div>' >> $FILE
    echo '</nav>' >> $FILE
}


build_page() {

    # args
    FILE=$1
    ARCH=$2
    HEADER=$3
    FOOTER=$4
    BODY=$5

    # header
    build_header $FILE $HEADER

    # body
    build_body $FILE $ARCH $BODY

    # footer
    build_footer $FILE $FOOTER
}



