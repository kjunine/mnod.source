#!/usr/bin/env bash

VERSION=0.1.0

npm install
bower install
read -p "Press enter to build."

rm -rf dist
mkdir dist
grunt build
read -p "Press enter to publish."

cd dist
echo -e "node_modules\n.tmp\nnewrelic_agent*" > .gitignore
chmod +x *.sh
find public -type f -exec dos2unix {} \;

git init
git checkout --orphan release
git add --all
git ci -m "$VERSION"
git remote add origin git@github.com:kjunine/mnod.release.git
git push origin release --force
git checkout -b $VERSION
git push origin $VERSION
cd ..
