#
#
#

# source common stuff
SCRIPT_DIR=$(dirname $0)
. $SCRIPT_DIR/common.ksh

if [ $# -ne 2 ]; then
   echo "use: $(basename $0) <start dir> <file count (in thousands)>"
   exit 1
fi

START=$1
COUNT=$2
FILES_PER=1000

END=$(echo "$START + $COUNT" | bc)

for dir in $(seq $START 1 $END); do

   # make the directory
   DIRNAME=$DEST_DIR/dir-$dir
   mkdir -p $DIRNAME
   res=$?
   if [ $res -ne 0 ]; then
      echo "Error creating $DIRNAME, exiting with status $res"
      exit $res
   fi

   chmod 777 $DIRNAME

   for file in $(seq $FILES_PER); do

      FILENAME=$DIRNAME/file-$file
      echo "creating $FILENAME..."
      dd if=/dev/zero of=$FILENAME bs=$BLOCKSIZE count=$BLOCKCOUNT
      res=$?
      if [ $res -ne 0 ]; then
         echo "Error creating $FILENAME, exiting with status $res"
         exit $res
      fi

   done
done

res=0
echo "exiting with status $res"
exit $res

#
# end of file
#
