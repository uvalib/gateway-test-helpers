#
#
#

#set -x

DEST_DIR=/aws-lib-content-21

if [ ! -d $DEST_DIR ]; then
   sudo mkdir $DEST_DIR
fi

#sudo mount -t nfs -o nolock,hard storagegateway-staging.internal.lib.virginia.edu:/lib-content-21 $DEST_DIR
#sudo mount -t nfs -o nolock,intr,bg,soft,timeo=5,retrans=5,actimeo=10,retry=5 storagegateway-staging.internal.lib.virginia.edu:/lib-content-21 $DEST_DIR
sudo mount -t nfs -o nolock,intr,bg,soft,timeo=10,retrans=10,actimeo=10,retry=5 storagegateway-staging.internal.lib.virginia.edu:/lib-content-21 $DEST_DIR
res=$?

echo "exiting with status $res"
exit $res

#
# end of file
#
