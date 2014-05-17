#!/usr/bin/env node
'use strict';

require('coffee-script/register');
var argv = require('minimist')(process.argv.slice(2));
require('./lib/jsonserver').init(argv);