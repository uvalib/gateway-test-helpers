#
#
#

# source common stuff
SCRIPT_DIR=$(dirname $0)
. $SCRIPT_DIR/common.ksh

cp -Rv $SRC_DIR/ $DEST_DIR/
res=$?

echo "exiting with status $res"
exit $res

#
# end of file
#
