#!/bin/bash

SCRIPTS="$( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd )"

("$SCRIPTS/internal-update-dependencies.js" "./package.json" $1) > .package.json.out

if [ $? -eq 99 ]
then
  echo "Nothing to do."
  exit 0
fi

if [ $? -ne 0 ]
then
  exit $?
fi

cat .package.json.out

echo ""
if [ -z "$LEGION_UPDATE_FAST" ]; then
  read -p "Review new package.json. Press enter to continue. Note: this package's own version field will be updated later when we run 'npm version'."
fi
echo ""

npm install rimraf && npm run clean
cp "$SCRIPTS/.travis.yml" .
cp "$SCRIPTS/.eslintrc.json" .
cp "$SCRIPTS/LICENSE" .
mv .package.json.out package.json
npm install || exit 1                               # now do a clean build
npm test || exit 1
npm run clean || exit 1

echo ""
if [ -z "$LEGION_UPDATE_FAST" ]; then
  read -p "Review test results. Press enter to continue."
fi
echo ""

git status

echo ""
if [ -z "$LEGION_UPDATE_FAST" ]; then
  read -p "Review changes. Press enter to continue."
fi
echo ""

git commit -a
npm version $1 || exit 1

echo ""
if [ -z "$LEGION_UPDATE_FAST" ]; then
  read -p "Last chance to abort before git push && git push --tags."
fi
echo ""

git push && git push --tags
