# Building site

PUBLIC="../public"
INC="../inc"
ARCH="../arch"
EXP="../exp"
IMG="../img"
CSS="../css"
JS="../js"
FONTS="../fonts"


# make website folder
rm -r $PUBLIC
mkdir -p $PUBLIC


# copy in assets
cp -r $IMG $PUBLIC/img
cp -r $CSS $PUBLIC/css
cp -r $JS $PUBLIC/js
cp -r $FONTS $PUBLIC/fonts


# build index
./build_index.sh $PUBLIC/index.html $ARCH $INC/head.html $INC/scripts.html ../index.md

# build curriculum vitae
./build_cv.sh $PUBLIC/cv.html $INC/cv_head.html $INC/scripts.html $EXP


