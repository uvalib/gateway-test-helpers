#
#
#

#SRC_DIR=/lib_content21
SRC_DIR=/lib_content1
DEST_DIR=/aws-lib-content-21

if [ ! -d $SRC_DIR ]; then
   echo "$SRC_DIR does not exist, aborting"
   exit 1
fi

if [ ! -d $DEST_DIR ]; then
   echo "$DEST_DIR does not exist, aborting"
   exit 1
fi

# test file attributes
BLOCKSIZE=262144
BLOCKCOUNT=100

#
# end of file
#
