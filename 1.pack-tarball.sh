#!/bin/bash
cp -r ./src ./output/
cd output
tar czfv ./hello-world_1.0.orig.tar.gz --exclude="**/obj/**" --exclude="**/bin/**" --exclude="**/debian/**" ../src
