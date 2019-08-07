#
#
#

#set -x

# source common stuff
SCRIPT_DIR=$(dirname $0)
. $SCRIPT_DIR/common.ksh

TMPFILE=/tmp/files.$$

echo "creating file list..."
find $DEST_DIR -maxdepth 2 -type f -name file-* | sort > $TMPFILE

for file in $(<$TMPFILE); do

   #echo "$file"

   sha1sum $file
   res=$?
   if [ $res -ne 0 ]; then
      echo "exiting with status $res"
      exit $res
   fi

done

rm $TMPFILE
res=0
echo "exiting with status $res"
exit $res

#
# end of file
#
