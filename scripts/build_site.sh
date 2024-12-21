# Building site

PUBLIC="../public"
INC="../inc"
ARCH="../arch"
EXP="../exp"
TXT="../text"
IMG="../img"
ICON="../icons"
CSS="../css"
JS="../js"
FONTS="../fonts"


# make website folder
rm -r $PUBLIC
mkdir -p $PUBLIC


# copy in assets
cp -r $IMG $PUBLIC/img
cp -r $ICON $PUBLIC/icons
cp -r $CSS $PUBLIC/css
cp -r $JS $PUBLIC/js
cp -r $FONTS $PUBLIC/fonts


# build index
echo "building index.html..."
./build_index.sh $PUBLIC/index.html $ARCH $INC/head.html $INC/scripts.html ../index.md $TXT
echo "built index.html"


# build publications
echo "building pub.html..."
./build_pub.sh $PUBLIC/pub.html $ARCH $INC/head.html $INC/scripts.html $EXP $TXT
echo "built pub.html"


# build curriculum vitae
echo "building cv.html..."
./build_cv.sh $PUBLIC/cv.html $INC/cv_head.html $INC/scripts.html $EXP
echo "built cv.html"

