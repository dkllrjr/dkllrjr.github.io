# Build Teaching

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
echo '<pre class="figlet name">' >> $FILE
cat $TXT/teach.txt >> $FILE
echo '</pre>' >> $FILE
echo "<br>" >> $FILE


echo "CM = Cours Magistral (Lectures)" >> $FILE
echo "<br>TD = Travaux Dirigés (Recitation)" >> $FILE
echo "<br>TP = Travaux Pratiques (Laboratory Instruction)" >> $FILE
echo "<br>TA = Teaching Assistantship<br>" >> $FILE


# courses
YML="$EXP/teaching.yml"
FIELD=.teaching

readarray tmp < <(yq "$FIELD |= sort_by(.date)" $YML | yq "$FIELD | reverse" - | yq -o=j -I=0 '.[]' -)


echo "<div class=courses>" >> $FILE

for i in "${tmp[@]}"; do

    course=`echo $i | yq -p=json '.course' -`
    subtitle=`echo $i | yq -p=json '.subtitle' -`
    institute=`echo $i | yq -p=json '.institute' -`
    current=`echo $i | yq -p=json '.current' -`
    date=`echo $i | yq -p=json '.date' -`

    if [ "$current" = true ]; then
        echo "<h1>$course</h1>" >> $FILE
        echo "<h2>$subtitle</h2>" >> $FILE
        echo "$institute" >> $FILE
        echo "<br>$date" >> $FILE
    fi

done

# end courses
echo "</div>" >> $FILE


# end body
echo "</body>" >> $FILE


# footer
build_footer $FILE $FOOTER
