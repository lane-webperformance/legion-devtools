
Various scripts to help with software development.

./bin/clone.bash [REPO]
=================

git clones REPO.git, or all of the legion libraries if no parameter is provided.

./bin/build.bash
==========

Build all npm-packaged software in the current working directory.

./bin/clean.bash
==========

npm run clean all npm-packaged software in the current working directory.

./bin/forall.bash
=================

Run a command in each direct subdirectory that contains npm-packaged software.
(Direct means that we don't recursively dig into nested subdirectories.)

./bin/trash-all.bash
====================

Move all legion directories in the current working directory to a trash
directory (which also will be in the current working directory.
