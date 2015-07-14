var chai = require('chai'),
    chai_promise = require('chai-as-promised'),
    path = require('path'),
    Sprout = require('sprout'),
    Util = require('roots-util');

var should = chai.should(),
    _path = path.join(__dirname, '../fixtures'),
    sprout = new Sprout(path.join(__dirname, '../config')),
    h = new Util.Helpers({base: _path});

chai.use(chai_promise);

global.chai = chai;
global.sprout = sprout;
global.should = should;
global.h = h;
global._path = _path;
