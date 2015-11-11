var chai = require('chai'),
    chai_promise = require('chai-as-promised'),
    path = require('path'),
    Util = require('roots-util');

var should = chai.should(),
    _path = path.join(__dirname, '../..'),
    h = new Util.Helpers();

chai.use(chai_promise);

global.chai = chai;
global.should = should;
global.h = h;
global._path = _path;
