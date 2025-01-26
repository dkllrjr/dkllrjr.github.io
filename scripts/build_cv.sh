# Build CV

# includes
. ./build_page.sh --source-only


# args
FILE=$1
HEADER=$2
FOOTER=$3
EXP=$4


# create file
touch $FILE


# header
build_header $FILE $HEADER


# body
echo "<body>" >> $FILE

echo '<div class="container">' >> $FILE


# prefix
echo '<div class="cv">' >> $FILE

echo '<div class="fancy-bar">' >> $FILE
echo '<div class="row">' >> $FILE

echo '<div class="col">Curriculum Vitae</div>' >> $FILE
echo '<div class="col" style="text-align: right;">Douglas KELLER JR, PhD</div>' >> $FILE

echo '</div>' >> $FILE
echo '</div>' >> $FILE

#  ══════════════════════════════════════════════════════════════════════════
# bio
#  ══════════════════════════════════════════════════════════════════════════
#
YML=$EXP/bio.yml

# start row
echo '<div class="row">' >> $FILE

# left
echo '<div class="col-8">' >> $FILE

echo '<div class="spacer"></div>' >> $FILE

name=`yq '.name' $YML`
title=`yq '.title' $YML`
institute=`yq '.institute' $YML`
location=`yq '.location' $YML`
email=`yq '.email' $YML`
website=`yq '.website' $YML`

echo "<h1>$name</h1>" >> $FILE
echo "<h2>$title</h2>" >> $FILE
echo "<b>$institute</b>" >> $FILE
echo "</br>" >> $FILE
echo "<i>$location</i>" >> $FILE
echo "</br>" >> $FILE
echo "$email" >> $FILE
echo "</br>" >> $FILE
echo "<a href=$website>$website</a>" >> $FILE
echo "</br>" >> $FILE
echo "</br>" >> $FILE

# other affiliations
echo "<h4>Additional Affiliations</h4>" >> $FILE

FIELD='.affiliations[]'
readarray tmp < <( yq -o=j -I=0 $FIELD $YML )

echo '<ul>' >> $FILE

for i in "${tmp[@]}"; do

    title=`echo $i | yq -p=json '.title' -`
    institute=`echo $i | yq -p=json '.institute' -`
    location=`echo $i | yq -p=json '.location' -`

    echo "<li><b>$title</b>, $institute, <i>$location</i></li>" >> $FILE

done

echo '</ul>' >> $FILE

echo '</div>' >> $FILE

# right; image
echo '<div class="col" style="text-align: center;">' >> $FILE

echo '<div class="big-spacer"></div>' >> $FILE
echo '<img src="img/images/me_postdoc_round.png">' >> $FILE

echo '</div>' >> $FILE

# complete row
echo '</div>' >> $FILE
echo "</br>" >> $FILE


#  ══════════════════════════════════════════════════════════════════════════
#  education
#  ══════════════════════════════════════════════════════════════════════════
#
YML="$EXP/education.yml"
FIELD='.education[]'

echo "<h2>Education</h2>" >> $FILE

readarray tmp < <( yq -o=j -I=0 $FIELD $YML )

for i in "${tmp[@]}"; do

    degree=`echo $i | yq -p=json '.type' -`
    name=`echo $i | yq -p=json '.name' -`
    institute=`echo $i | yq -p=json '.institute' -`
    date=`echo $i | yq -p=json '.date' -`
    thesis=`echo $i | yq -p=json '.thesis' -`

    echo "<h3>$degree</h3>" >> $FILE
    echo "<b>$name</b>, $institute" >> $FILE
    echo "</br>" >> $FILE
    echo "<i>$date</i>" >> $FILE
    echo "</br>" >> $FILE
    echo "$thesis" >> $FILE
    echo "<div class="spacer"></div>" >> $FILE

done


echo "<hr>" >> $FILE


#  ══════════════════════════════════════════════════════════════════════════
#  research
#  ══════════════════════════════════════════════════════════════════════════
#
YML="$EXP/research.yml"
FIELD='.research[]'

echo "<h2>Research</h2>" >> $FILE

readarray tmp < <( yq -o=j -I=0 $FIELD $YML )

for i in "${tmp[@]}"; do

    title=`echo $i | yq -p=json '.title' -`
    institute=`echo $i | yq -p=json '.institute' -`
    location=`echo $i | yq -p=json '.location' -`
    date=`echo $i | yq -p=json '.date' -`
    desc=`echo $i | yq -p=json '.description' -`

    echo "<h3>$title</h3>" >> $FILE
    echo "<b>$institute</b>, $location" >> $FILE
    echo "</br>" >> $FILE
    echo "<i>$date</i>" >> $FILE
    echo "</br>" >> $FILE
    echo "$desc" >> $FILE

    # highlights
    echo "<ul>" >> $FILE
    readarray highlights < <( echo $i | yq -o=j -I=0 '.highlights[]' - )

    for j in "${highlights[@]}"; do
        item=`echo $j | yq -p=json '.item' -`
        echo "<li>$item</li>" >> $FILE
    done

    echo "</ul>" >> $FILE

    echo "<div class="spacer"></div>" >> $FILE

done


echo "<hr>" >> $FILE


#  ══════════════════════════════════════════════════════════════════════════
#  work/vocation
#  ══════════════════════════════════════════════════════════════════════════
#
YML="$EXP/vocation.yml"
FIELD='.vocation[]'

echo "<h2>Vocation</h2>" >> $FILE

readarray tmp < <( yq -o=j -I=0 $FIELD $YML )

for i in "${tmp[@]}"; do

    title=`echo $i | yq -p=json '.title' -`
    institute=`echo $i | yq -p=json '.institute' -`
    location=`echo $i | yq -p=json '.location' -`

    echo "<h3>$title</h3>" >> $FILE
    echo "<b>$institute</b>, $location" >> $FILE
    echo "</br>" >> $FILE

    # tasks
    readarray tasks < <( echo $i | yq -o=j -I=0 '.tasks[]' - )

    for j in "${tasks[@]}"; do

        task_date=`echo $j | yq -p=json '.date' -`
        task_desc=`echo $j | yq -p=json '.description' -`
        echo "<i>$task_date</i>" >> $FILE
        echo "</br>" >> $FILE
        echo "$task_desc" >> $FILE
        echo "</br>" >> $FILE

        # highlights
        echo "<ul>" >> $FILE
        readarray highlights < <( echo $j | yq -o=j -I=0 '.highlights[]' - )

        for k in "${highlights[@]}"; do

            item=`echo $k | yq -p=json '.item' -`
            echo "<li>$item</li>" >> $FILE

        done

        echo "</ul>" >> $FILE

    done

    echo "<div class="spacer"></div>" >> $FILE

done


echo "<hr>" >> $FILE


#  ══════════════════════════════════════════════════════════════════════════
#  teaching
#  ══════════════════════════════════════════════════════════════════════════
#
YML="$EXP/teaching.yml"
FIELD='.teaching[]'

echo "<h2>Teaching</h2>" >> $FILE

readarray tmp < <( yq -o=j -I=0 $FIELD $YML )

for i in "${tmp[@]}"; do

    course=`echo $i | yq -p=json '.course' -`
    subtitle=`echo $i | yq -p=json '.subtitle' -`
    institute=`echo $i | yq -p=json '.institute' -`
    date=`echo $i | yq -p=json '.date' -`

    echo "<h3>$course</h3>" >> $FILE
    echo "<h5>$subtitle</h5>" >> $FILE
    echo "$institute" >> $FILE
    echo "</br>" >> $FILE
    echo "<i>$date</i>" >> $FILE
    echo "</br>" >> $FILE

    echo "<div class="medium-spacer"></div>" >> $FILE

done


echo "<hr>" >> $FILE


#  ══════════════════════════════════════════════════════════════════════════
#  mentorship
#  ══════════════════════════════════════════════════════════════════════════
#
student() {
    FILE=$1
    FIELD=$2
    YML=$3

    readarray tmp < <( yq -o=j -I=0 $FIELD $YML )

    for i in "${tmp[@]}"; do

        name=`echo $i | yq -p=json '.name' -`
        institute=`echo $i | yq -p=json '.institute' -`
        location=`echo $i | yq -p=json '.location' -`
        date=`echo $i | yq -p=json '.date' -`
        desc=`echo $i | yq -p=json '.description' -`

        echo "<h4>$name</h4>" >> $FILE
        echo "<b>$institute</b>, $location" >> $FILE
        echo "</br>" >> $FILE
        echo "<i>$date</i>" >> $FILE
        echo "</br>" >> $FILE
        echo "$desc" >> $FILE

        # highlights
        echo "<ul>" >> $FILE

        readarray highlights < <( echo $i | yq -o=j -I=0 '.highlights[]' - )

        for j in "${highlights[@]}"; do

            item=`echo $j | yq -p=json '.item' -`
            echo "<li>$item</li>" >> $FILE

        done

        echo "</ul>" >> $FILE

        echo "<div class="spacer"></div>" >> $FILE

    done
}

YML="$EXP/mentorship.yml"

echo "<h2>Mentorship</h2>" >> $FILE

#  ──────────────────────────────────────────────────────────────────────────
#  doctoral
#
echo "<h3>Doctoral Students</h3>" >> $FILE

FIELD='.doctoral[]'
student $FILE $FIELD $YML

#  ──────────────────────────────────────────────────────────────────────────
#  master
#
echo "<h3>Master Students</h3>" >> $FILE

FIELD='.master[]'
student $FILE $FIELD $YML

#  ──────────────────────────────────────────────────────────────────────────
#  bachelor
#
echo "<h3>Bachelor Students</h3>" >> $FILE

FIELD='.bachelor[]'
student $FILE $FIELD $YML


echo "<hr>" >> $FILE


#  ══════════════════════════════════════════════════════════════════════════
#  service
#  ══════════════════════════════════════════════════════════════════════════
#
YML="$EXP/service.yml"
FIELD='.service[]'

echo "<h2>Service</h2>" >> $FILE

readarray tmp < <( yq -o=j -I=0 $FIELD $YML )

for i in "${tmp[@]}"; do

    title=`echo $i | yq -p=json '.title' -`
    institute=`echo $i | yq -p=json '.institute' -`
    location=`echo $i | yq -p=json '.location' -`
    date=`echo $i | yq -p=json '.date' -`
    desc=`echo $i | yq -p=json '.description' -`

    echo "<h3>$title</h3>" >> $FILE
    echo "<b>$institute</b>, $location" >> $FILE
    echo "</br>" >> $FILE
    echo "<i>$date</i>" >> $FILE
    echo "</br>" >> $FILE
    echo "$desc" >> $FILE

    echo "<div class="spacer"></div>" >> $FILE

done


echo "<hr>" >> $FILE


#  ══════════════════════════════════════════════════════════════════════════
#  publications
#  ══════════════════════════════════════════════════════════════════════════
#
YML="$EXP/articles.yml"
FIELD=.articles

echo "<h2>Publications</h2>" >> $FILE

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

    echo "<li>$authors ($year) \"$title,\" <b>$journal</b>, $volume($issue), $pages, <a href=$doi>$doi</a></li>" >> $FILE

done

echo "</ol>" >> $FILE

#  ──────────────────────────────────────────────────────────────────────────
#  conference proceedings
#
YML="$EXP/articles.yml"
FIELD=.proceedings

echo "<h3>Conference Proceedings</h3>" >> $FILE

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

echo "<h3>Seminars</h3>" >> $FILE

readarray tmp < <(yq "$FIELD |= sort_by(.year)" $YML | yq "$FIELD | reverse" - | yq -o=j -I=0 '.[]' -)

echo "<ol>" >> $FILE

for i in "${tmp[@]}"; do

    year=`echo $i | yq -p=json '.year' -`
    title=`echo $i | yq -p=json '.title' -`
    institute=`echo $i | yq -p=json '.institute' -`
    location=`echo $i | yq -p=json '.location' -`
    date=`echo $i | yq -p=json '.date_time' -`

    echo "<li>($year) \"$title,\" <b>$institute</b>, <i>$location</i>, $date</li>" >> $FILE

done

echo "</ol>" >> $FILE

#  ──────────────────────────────────────────────────────────────────────────
#  talks
#
YML="$EXP/talks.yml"
FIELD=.talks

echo "<h3>Talks</h3>" >> $FILE

readarray tmp < <(yq "$FIELD |= sort_by(.year)" $YML | yq "$FIELD | reverse" - | yq -o=j -I=0 '.[]' -)

echo "<ol>" >> $FILE

for i in "${tmp[@]}"; do

    authors=`echo $i | yq -p=json '.authors' -`
    year=`echo $i | yq -p=json '.year' -`
    title=`echo $i | yq -p=json '.title' -`
    conference=`echo $i | yq -p=json '.conference' -`
    location=`echo $i | yq -p=json '.location' -`
    date=`echo $i | yq -p=json '.date_time' -`

    echo "<li>$authors ($year) \"$title,\" <b>$conference</b>, <i>$location</i>, $date</li>" >> $FILE

done

echo "</ol>" >> $FILE

#  ──────────────────────────────────────────────────────────────────────────
#  poster
#
YML="$EXP/posters.yml"
FIELD=.posters

echo "<h3>Posters</h3>" >> $FILE

readarray tmp < <(yq "$FIELD |= sort_by(.year)" $YML | yq "$FIELD | reverse" - | yq -o=j -I=0 '.[]' -)

echo "<ol>" >> $FILE

for i in "${tmp[@]}"; do

    authors=`echo $i | yq -p=json '.authors' -`
    year=`echo $i | yq -p=json '.year' -`
    title=`echo $i | yq -p=json '.title' -`
    conference=`echo $i | yq -p=json '.conference' -`
    location=`echo $i | yq -p=json '.location' -`
    date=`echo $i | yq -p=json '.date_time' -`

    echo "<li>$authors ($year) \"$title,\" <b>$conference</b>, <i>$location</i>, $date</li>" >> $FILE

done

echo "</ol>" >> $FILE


echo "<hr>" >> $FILE


#  ══════════════════════════════════════════════════════════════════════════
#  projects
#  ══════════════════════════════════════════════════════════════════════════
#
YML="$EXP/projects.yml"
FIELD='.projects[]'

echo "<h2>Projects</h2>" >> $FILE

readarray tmp < <( yq -o=j -I=0 $FIELD $YML )

for i in "${tmp[@]}"; do

    title=`echo $i | yq -p=json '.title' -`
    institute=`echo $i | yq -p=json '.institute' -`
    location=`echo $i | yq -p=json '.location' -`
    date=`echo $i | yq -p=json '.date' -`
    desc=`echo $i | yq -p=json '.description' -`

    echo "<h3>$title</h3>" >> $FILE
    echo "<b>$institute</b>, $location" >> $FILE
    echo "</br>" >> $FILE
    echo "<i>$date</i>" >> $FILE
    echo "</br>" >> $FILE
    echo "$desc" >> $FILE

    # highlights
    echo "<ul>" >> $FILE

    readarray highlights < <( echo $i | yq -o=j -I=0 '.highlights[]' - )

    for j in "${highlights[@]}"; do

        item=`echo $j | yq -p=json '.item' -`
        echo "<li>$item</li>" >> $FILE

    done

    echo "</ul>" >> $FILE

done


echo "<hr>" >> $FILE


#  ══════════════════════════════════════════════════════════════════════════
#  sports
#  ══════════════════════════════════════════════════════════════════════════
#
YML="$EXP/sports.yml"
FIELD='.sports[]'

echo "<h2>Athletics</h2>" >> $FILE

readarray tmp < <( yq -o=j -I=0 $FIELD $YML )

for i in "${tmp[@]}"; do

    title=`echo $i | yq -p=json '.title' -`
    institute=`echo $i | yq -p=json '.institute' -`
    location=`echo $i | yq -p=json '.location' -`
    date=`echo $i | yq -p=json '.date' -`
    desc=`echo $i | yq -p=json '.description' -`

    echo "<h3>$title</h3>" >> $FILE
    echo "<b>$institute</b>, $location" >> $FILE
    echo "</br>" >> $FILE
    echo "<i>$date</i>" >> $FILE
    echo "</br>" >> $FILE
    echo "$desc" >> $FILE

done


echo "<hr>" >> $FILE


#  ══════════════════════════════════════════════════════════════════════════
#  skills
#  ══════════════════════════════════════════════════════════════════════════
#
YML="$EXP/skills.yml"
FIELD='.skills[]'

echo "<h2>Skills</h2>" >> $FILE

readarray tmp < <( yq -o=j -I=0 $FIELD $YML )

for i in "${tmp[@]}"; do

    name=`echo $i | yq -p=json '.name' -`

    echo "<h3>$name</h3>" >> $FILE

    # list
    echo "<ul>" >> $FILE

    readarray list < <( echo $i | yq -o=j -I=0 '.list[]' - )

    for j in "${list[@]}"; do

        item=`echo $j | yq -p=json '.item' -`
        echo "<li>$item</li>" >> $FILE

    done

    echo "</ul>" >> $FILE

done


# end body
echo "</body>" >> $FILE


# footer
build_footer $FILE $FOOTER
