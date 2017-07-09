var expect = require('expect.js');
var mongoose = require('mongoose');

// lib classes
var zngoose = require('../src/zngoose');

// configuration file
var DBConnectionString = require('../conf').db;

module.exports.expect = expect;
module.exports.mongoose = mongoose;

module.exports.zng = zngoose;

module.exports.DBConnectionString = DBConnectionString;
