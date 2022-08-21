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
printf "\n" >> ./debian/control
printf "Package: hello-world\n" >> ./debian/control
printf "Architecture: any\n" >> ./debian/control
printf "Description: hello world" >> ./debian/control

# copyright
printf "Files: *\n" > ./debian/copyright
printf "Copyright: 2022 WhiteBlackGoose\n" >> ./debian/copyright
printf "License: CC0" >> ./debian/copyright

# rules
printf "#!/bin/bash\n" > ./debian/rules
printf "dotnet publish -o=. -c release -r linux-x64 -p:SelfContained=true -p:PublishSingleFile=true -p:PublishTrimmed=true -p:TrimMode=link\n" >> ./debian/rules
printf "mv HelloWorld hello-world\n" >> ./debian/rules
printf "rm HelloWorld.pdb\n" >> ./debian/rules
printf "rm -r ./bin\n" >> ./debian/rules
printf "rm -r ./obj\n" >> ./debian/rules

# source/format
mkdir ./debian/source
printf "3.0 (quilt)" > ./debian/source/format
