#
#
#

# source common stuff
SCRIPT_DIR=$(dirname $0)
. $SCRIPT_DIR/common.ksh

TMPFILE=/tmp/files.$$

echo "creating file list..."
sudo find $SRC_DIR -type f | sort > $TMPFILE

for file in $(<$TMPFILE); do

   FILE=${file/#$SRC_DIR}

   echo "copying $FILE..."
   sudo cp --parents $SRC_DIR/$FILE $DEST_DIR
   res=$?
   if [ $res -ne 0 ]; then
      echo "exiting with status $res"
      exit $res
   fi

done

echo "exiting with status $res"
exit $res

#
# end of file
#
