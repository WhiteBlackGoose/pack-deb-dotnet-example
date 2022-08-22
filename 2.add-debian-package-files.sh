#!/bin/bash
export EMAIL="wbg@angouri.org"

cd output/src

rm -r debian
rm -r hello-world
mkdir debian
dch --create -v 1.0 --package hello-world

# compat
echo "10" > ./debian/compat

# control
printf "Source: hello-world\n" > ./debian/control
printf "Maintainer: WhiteBlackGoose <wbg@angouri.org>\n" >> ./debian/control
printf "Section: misc\n" >> ./debian/control
printf "Priority: optional\n" >> ./debian/control
printf "Standards-Version: 3.9.2\n" >> ./debian/control
# printf "Build-Depends: dotnet6\n" >> ./debian/control
printf "Build-Depends: debhelper (>= 9)\n" >> ./debian/control
printf "\n" >> ./debian/control
printf "Package: hello-world\n" >> ./debian/control
printf "Architecture: any\n" >> ./debian/control
printf "Description: hello world" >> ./debian/control

# copyright
printf "Files: *\n" > ./debian/copyright
printf "Copyright: 2022 WhiteBlackGoose\n" >> ./debian/copyright
printf "License: CC0" >> ./debian/copyright

# rules
printf "#!/usr/bin/make -f\n" > ./debian/rules
echo '%:' >> ./debian/rules
echo '	dh $@' >> ./debian/rules
printf "\n" >> ./debian/rules
printf "override_dh_auto_install:\n" >> ./debian/rules
echo '	$(MAKE) DESTDIR=$$(pwd)/debian/hello-world prefix=/usr install' >> ./debian/rules

# hello-world.dirs
echo 'usr/bin' > ./debian/hello-world.dirs

# source/format
mkdir ./debian/source
printf "3.0 (quilt)" > ./debian/source/format
