#
#
#

# source common stuff
SCRIPT_DIR=$(dirname $0)
. $SCRIPT_DIR/common.ksh

if [ $# -ne 1 ]; then
   echo "use: $(basename $0) <file count (in thousands)>"
   exit 1
fi

COUNT=$1
FILES_PER=1000

BLOCKSIZE=102400
COUNT=100

for dir in $(seq $COUNT); do

   # make the directory
   DIRNAME=$DEST_DIR/dir-$dir
   sudo mkdir -p $DIRNAME
   res=$?
   if [ $res -ne 0 ]; then
      echo "Error creating $DIRNAME, exiting with status $res"
      exit $res
   fi

   sudo chmod 777 $DIRNAME

   for file in $(seq $FILES_PER); do

      FILENAME=$DIRNAME/file-$file
      echo "creating $FILENAME..."
      dd if=/dev/zero of=$FILENAME bs=$BLOCKSIZE count=$COUNT
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
