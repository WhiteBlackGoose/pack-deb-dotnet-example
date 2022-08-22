#!/bin/bash
dotnet publish \
-o=$1 \
-c release \
-r linux-x64 \
-p:SelfContained=true \
-p:PublishSingleFile=true \
-p:PublishTrimmed=true \
-p:TrimMode=link
mv HelloWorld hello-world
# rm HelloWorld.pdb
# rm -r ./bin
# rm -r ./obj
