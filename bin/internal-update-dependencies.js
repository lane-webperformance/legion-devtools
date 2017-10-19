#!/usr/bin/env node
'use strict';

const fs = require('fs');
const process = require('process');

try {
  if( !/^0\.0\.\d+$/.test(process.argv[3]) )
    throw new Error('Not a valid version string: ' + process.argv[3]);

  const LEGION_DEPENDENCIES_ROOT = process.env.LEGION_DEPENDENCIES_ROOT || "https://github.com/lane-webperformance";

  const known_packages = ['legion', 'legion-capture', 'legion-core', 'legion-control', 'legion-io', 'legion-instrument', 'legion-metrics', 'legion-obstacle-course', 'legion-io-proxy', 'legion-selenium-webdriver', 'legion-io-fetch', 'legion-io-delay'];

  const package_json = JSON.parse(fs.readFileSync(process.argv[2], 'utf8'));

  function updateDependencies(dependencies) {
    for( const dep in dependencies ) {
      if( known_packages.includes(dep) )
        dependencies[dep] = LEGION_DEPENDENCIES_ROOT + '/' + dep + "#v" + process.argv[3];
      else if( dep.startsWith('legion') )
        throw new Error("Didn't recognize dependency: " + dep);
    }

    return dependencies;
  }

  if( package_json.version === process.argv[3] ) {
    console.error("Package already at version.");
    process.exitCode = 99;
  } else {
    updateDependencies(package_json.dependencies);
    updateDependencies(package_json.devDependencies);
    updateDependencies(package_json.optionalDependencies);

    console.log(JSON.stringify(package_json, null, 2));
  }
} catch(err) {
  console.log(err);
  process.exit(1);
}


