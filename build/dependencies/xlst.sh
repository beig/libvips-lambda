#!/bin/sh


fetchSource xslt http://xmlsoft.org/sources/libxslt-${VERSION_XLST}.tar.gz

if [ ! -f "configured.sts" ]; then
    echo "\tConfiguring"
    ./configure  \
        --prefix=${TARGET} \
        --with-sysroot=${TARGET} \
        --disable-static > config.log
    touch configured.sts
else
    echo "\tAlready Configured"
fi
if [ ! -f "made.sts" ]; then
    echo "\tBuilding"
    make install-strip   > make.log
    touch made.sts
else
	echo "\tAlready Built"
fi