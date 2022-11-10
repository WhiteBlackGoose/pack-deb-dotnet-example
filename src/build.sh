#!/bin/bash
rm -r bin
rm -r obj

/home/goose/programs/dotnet-folder/dotnet publish \
-o=$1 \
-r linux-x64 \
-c release \
-p:SelfContained=true \
-p:PublishAot=true \
-p:PublishTrimmed=true \
-p:TrimMode=full \
-p:IlcInvariantGlobalization=true \
-p:IlcOptimizationPreference=Speed \
-p:StripSymbols=true

mv HelloWorld hello-world
