#
#
#

#set -x

# source common stuff
SCRIPT_DIR=$(dirname $0)
. $SCRIPT_DIR/common.ksh

TMPFILE=/tmp/files.$$

if [ $# -ge 1 ]; then

   TMPFILE=$1
   if [ ! -f $TMPFILE ]; then
      echo "ERROR: $TMPFILE does not exist or is not readable"
      exit 1
   fi

else
   echo "creating file list..."
   find $DEST_DIR -maxdepth 2 -type f -name file-* | sort > $TMPFILE
fi

for file in $(<$TMPFILE); do

   echo "$file"

   dd if=$file of=/dev/null bs=$BLOCKSIZE count=$BLOCKCOUNT
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
