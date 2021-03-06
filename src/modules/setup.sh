OS="UNKNOW"
if test -e /etc/redhat-release  ; then

    CONTENT=`cat /etc/redhat-release`
    if test  "$CONTENT" = "CentOS release 5.4 (Final)" ; then
        OS="centos-5.4"
    fi
    if test  "$CONTENT" = "CentOS release 6.2 (Final)" ; then
        OS="centos-6.2"
    fi
    if test  "$CONTENT" = "CentOS release 6.6 (Final)" ; then
        OS="centos-6.6"
    fi

fi
if test "$OS" = "UNKNOW"  ;  then
    echo "unknow this os ,
    setup exit!"
    exit;
fi
adirname() { odir=`pwd`; cd `dirname $1`; pwd; cd "${odir}"; }
MYDIR=`dirname "$0"`
cd $MYDIR
cd $OS
cp -u ./libpylon_smasher*.so /usr/local/lib/
function deploy_phpext ()
{
    VER=$1
    DST=/usr/local/php-$VER/extensions
    if test -d $DST ; then
        cp -u ./$VER/pylon*.so $DST
    fi

}
deploy_phpext 5.3
deploy_phpext 5.6
/sbin/ldconfig
