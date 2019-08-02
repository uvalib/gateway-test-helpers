#
#
#

SRC_DIR=/lib_content21
DEST_DIR=/aws-lib-content-21

if [ ! -d $SRC_DIR ]; then
   echo "$SRC_DIR does not exist, aborting"
   exit 1
fi

if [ ! -d $DEST_DIR ]; then
   echo "$DEST_DIR does not exist, aborting"
   exit 1
fi

#
# end of file
#
