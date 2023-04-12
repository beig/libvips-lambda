#!/bin/sh

fetchSource expat https://github.com/libexpat/libexpat/releases/download/R_2_5_0/expat-2.5.0.tar.bz2
export JSON_VERSIONS="${JSON_VERSIONS}, \"${DEP_NAME}\": \"${VERSION_EXPAT}\""

if [ ! -f "configured.sts" ]; then
    printf "\tConfiguring\n"
    ./configure  \
        --prefix=${TARGET} \
        --enable-shared \
	--without-docbook \
        --disable-static >> ${BUILD_LOGS}/${DEP_NAME}.config.log 2>&1
    touch configured.sts
else
    printf "\tAlready Configured\n"
fi
if [ ! -f "made.sts" ]; then
    printf "\tBuilding\n"
    {
        make
        make install
    } >> ${BUILD_LOGS}/${DEP_NAME}.make.log 2>&1
    touch made.sts
else
	printf "\tAlready Built\n"
fi
