# Build CV

# includes
. ./build_page.sh --source-only


# args
FILE=$1
ARCH=$2
HEADER=$3
FOOTER=$4
EXP=$5
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
echo '</br>' >> $FILE
echo '<pre class="figlet pub-title">' >> $FILE
cat $TXT/pub.txt >> $FILE
echo '</pre>' >> $FILE


# small waves horizontal line
echo '</br>' >> $FILE
echo '<pre class="figlet small-waves">' >> $FILE
cat $TXT/small_waves.txt >> $FILE
echo '</pre>' >> $FILE


#  ══════════════════════════════════════════════════════════════════════════
#  publications
#  ══════════════════════════════════════════════════════════════════════════
#
YML="$EXP/articles.yml"
FIELD=.articles

#  ──────────────────────────────────────────────────────────────────────────
echo "<h1>Peer-Reviewed</h1>" >> $FILE

readarray tmp < <(yq "$FIELD |= sort_by(.year)" $YML | yq "$FIELD | reverse" - | yq -o=j -I=0 '.[]' -)

echo "<ol>" >> $FILE

for i in "${tmp[@]}"; do

    authors=`echo $i | yq -p=json '.authors' -`
    year=`echo $i | yq -p=json '.year' -`
    title=`echo $i | yq -p=json '.title' -`
    journal=`echo $i | yq -p=json '.journal' -`
    volume=`echo $i | yq -p=json '.volume' -`
    issue=`echo $i | yq -p=json '.issue' -`
    pages=`echo $i | yq -p=json '.pages' -`
    doi=`echo $i | yq -p=json '.doi' -`
    first_author=`echo $i | yq -p=json '.first_author' -`

    if [ "$first_author" = true ]; then
        echo "<li id="first_author">$authors ($year) \"$title,\" <b>$journal</b>, $volume($issue), $pages, <a href=$doi>$doi</a></li>" >> $FILE
    else
        echo "<li>$authors ($year) \"$title,\" <b>$journal</b>, $volume($issue), $pages, <a href=$doi>$doi</a></li>" >> $FILE
    fi

done

echo "</ol>" >> $FILE


#  ──────────────────────────────────────────────────────────────────────────
FIELD=.review
echo "<h2>In Review</h2>" >> $FILE

readarray tmp < <(yq "$FIELD |= sort_by(.year)" $YML | yq "$FIELD | reverse" - | yq -o=j -I=0 '.[]' -)

echo "<ol>" >> $FILE

for i in "${tmp[@]}"; do

    authors=`echo $i | yq -p=json '.authors' -`
    year=`echo $i | yq -p=json '.year' -`
    title=`echo $i | yq -p=json '.title' -`
    journal=`echo $i | yq -p=json '.journal' -`

    echo "<li>$authors ($year) \"$title,\" <b>$journal</b></li>" >> $FILE

done

echo "</ol>" >> $FILE


#  ──────────────────────────────────────────────────────────────────────────
FIELD=.submitted
echo "<h2>Submitted</h2>" >> $FILE

readarray tmp < <(yq "$FIELD |= sort_by(.year)" $YML | yq "$FIELD | reverse" - | yq -o=j -I=0 '.[]' -)

echo "<ol>" >> $FILE

for i in "${tmp[@]}"; do

    authors=`echo $i | yq -p=json '.authors' -`
    year=`echo $i | yq -p=json '.year' -`
    title=`echo $i | yq -p=json '.title' -`
    journal=`echo $i | yq -p=json '.journal' -`

    echo "<li>$authors ($year) \"$title,\" <b>$journal</b></li>" >> $FILE

done

echo "</ol>" >> $FILE


#  ──────────────────────────────────────────────────────────────────────────
#  conference proceedings
#
YML="$EXP/articles.yml"
FIELD=.proceedings

echo "<h1>Conference Proceedings</h1>" >> $FILE

readarray tmp < <(yq "$FIELD |= sort_by(.year)" $YML | yq "$FIELD | reverse" - | yq -o=j -I=0 '.[]' -)

echo "<ol>" >> $FILE

for i in "${tmp[@]}"; do

    authors=`echo $i | yq -p=json '.authors' -`
    year=`echo $i | yq -p=json '.year' -`
    title=`echo $i | yq -p=json '.title' -`
    conference=`echo $i | yq -p=json '.conference' -`
    volume=`echo $i | yq -p=json '.volume' -`
    issue=`echo $i | yq -p=json '.issue' -`
    pages=`echo $i | yq -p=json '.pages' -`
    location=`echo $i | yq -p=json '.location' -`
    date=`echo $i | yq -p=json '.date_time' -`
    doi=`echo $i | yq -p=json '.doi' -`

    echo "<li>$authors ($year) \"$title,\" <b>$conference</b>, $volume($issue), $pages, <i>$location</i>, $date, <a href=$doi>$doi</a></li>" >> $FILE

done

echo "</ol>" >> $FILE

#  ──────────────────────────────────────────────────────────────────────────
#  seminars
#
YML="$EXP/seminars.yml"
FIELD=.seminars

echo "<h1>Seminars</h1>" >> $FILE

readarray tmp < <(yq "$FIELD |= sort_by(.year)" $YML | yq "$FIELD | reverse" - | yq -o=j -I=0 '.[]' -)

echo "<ol>" >> $FILE

for i in "${tmp[@]}"; do

    authors=`echo $i | yq -p=json '.authors' -`
    year=`echo $i | yq -p=json '.year' -`
    title=`echo $i | yq -p=json '.title' -`
    institute=`echo $i | yq -p=json '.institute' -`
    location=`echo $i | yq -p=json '.location' -`
    date=`echo $i | yq -p=json '.date_time' -`
    pdflink=`echo $i | yq -p=json '.link' -`

    echo "<li>($year) \"$title,\" <b>$institute</b>, <i>$location</i>, $date, <a href=$pdflink>pdf</a></li>" >> $FILE

done

echo "</ol>" >> $FILE

#  ──────────────────────────────────────────────────────────────────────────
#  talks
#
YML="$EXP/talks.yml"
FIELD=.talks

echo "<h1>Talks</h1>" >> $FILE

readarray tmp < <(yq "$FIELD |= sort_by(.year)" $YML | yq "$FIELD | reverse" - | yq -o=j -I=0 '.[]' -)

echo "<ol>" >> $FILE

for i in "${tmp[@]}"; do

    authors=`echo $i | yq -p=json '.authors' -`
    year=`echo $i | yq -p=json '.year' -`
    title=`echo $i | yq -p=json '.title' -`
    conference=`echo $i | yq -p=json '.conference' -`
    location=`echo $i | yq -p=json '.location' -`
    date=`echo $i | yq -p=json '.date_time' -`
    present=`echo $i | yq -p=json '.present' -`
    pdflink=`echo $i | yq -p=json '.link' -`

    if [ "$present" = true ]; then
        if [ -z $pdflink ]; then
            echo "<li>$authors ($year) \"$title,\" <b>$conference</b>, <i>$location</i>, $date</li>" >> $FILE
        else
            echo "<li>$authors ($year) \"$title,\" <b>$conference</b>, <i>$location</i>, $date, <a href=$pdflink>pdf</a></li>" >> $FILE
        fi
    fi

done

echo "</ol>" >> $FILE

#  ──────────────────────────────────────────────────────────────────────────
#  poster
#
YML="$EXP/posters.yml"
FIELD=.posters

echo "<h1>Posters</h1>" >> $FILE

readarray tmp < <(yq "$FIELD |= sort_by(.year)" $YML | yq "$FIELD | reverse" - | yq -o=j -I=0 '.[]' -)

echo "<ol>" >> $FILE

for i in "${tmp[@]}"; do

    authors=`echo $i | yq -p=json '.authors' -`
    year=`echo $i | yq -p=json '.year' -`
    title=`echo $i | yq -p=json '.title' -`
    conference=`echo $i | yq -p=json '.conference' -`
    location=`echo $i | yq -p=json '.location' -`
    date=`echo $i | yq -p=json '.date_time' -`
    pdflink=`echo $i | yq -p=json '.link' -`

    if [ -z $pdflink ]; then
        echo "<li>$authors ($year) \"$title,\" <b>$conference</b>, <i>$location</i>, $date</li>" >> $FILE
    else
        echo "<li>$authors ($year) \"$title,\" <b>$conference</b>, <i>$location</i>, $date, <a href=$pdflink>pdf</a></li>" >> $FILE
    fi

done

echo "</ol>" >> $FILE


# end body
echo "</body>" >> $FILE


# footer
build_footer $FILE $FOOTER
