#
#
#

# source common stuff
SCRIPT_DIR=$(dirname $0)
. $SCRIPT_DIR/common.ksh

TMPFILE=/tmp/files.$$

echo "creating file list..."
find $SRC_DIR -type f | sort > $TMPFILE

for file in $(<$TMPFILE); do

   #FILE=${file#$SRC_DIR}

   if [ ! -f $DEST_DIR/$file ]; then
      echo "copying $file"
      cp --parents $file $DEST_DIR
      res=$?
      if [ $res -ne 0 ]; then
         echo "exiting with status $res"
         exit $res
      fi
   else
      echo "$file already exists, skipping..."
   fi

done

rm $TMPFILE
res=0
echo "exiting with status $res"
exit $res

#
# end of file
#
