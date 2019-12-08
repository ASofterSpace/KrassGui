#!/bin/bash

echo "Re-building with target Java 7 (such that the compiled .class files will be compatible with as many JVMs as possible)..."

cd src

# build build build!
javac -encoding utf8 -d ../bin -bootclasspath ../other/java7_rt.jar -source 1.7 -target 1.7 @sourcefiles.list

cd ..



echo "Creating the release file KrassGui.zip..."

mkdir release

cd release

mkdir KrassGui

# copy the main files
cp -R ../bin KrassGui
cp ../UNLICENSE KrassGui
cp ../README.md KrassGui
cp ../run.sh KrassGui
cp ../run.bat KrassGui

# convert \n to \r\n for the Windows files!
cd KrassGui
awk 1 ORS='\r\n' run.bat > rn
mv rn run.bat
cd ..

# create a version tag right in the zip file
cd KrassGui
version=$(./run.sh --version_for_zip)
echo "$version" > "$version"
cd ..

# zip it all up
zip -rq KrassGui.zip KrassGui

mv KrassGui.zip ..

cd ..
rm -rf release

echo "The file KrassGui.zip has been created in $(pwd)"
