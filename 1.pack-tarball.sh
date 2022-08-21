#!/bin/bash
rm -r output
mkdir output
cp -r ./src ./output/src
cd output
tar czfv ./hello-world_1.0.orig.tar.gz --exclude="**/obj/**" --exclude="**/bin/**" --exclude="**/debian/**" ../src
