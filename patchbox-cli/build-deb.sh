#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $DIR

PACKAGE=patchbox-cli
VERSION=1.3.3

PKGFOLDER=${PACKAGE}-${VERSION}

mkdir -p ${PKGFOLDER}
cp -r src/* ${PKGFOLDER}
tar -czf ${PKGFOLDER}.tar.gz --exclude .git ${PKGFOLDER}

cd ${PKGFOLDER}

echo y | debuild -b -us -uc

