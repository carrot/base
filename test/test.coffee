rimraf = require 'rimraf'
path   = require 'path'
fs     = require 'fs'
Roots  = require 'roots'
Promise  = require 'bluebird'
shell = require('shelljs')

test_template_path = path.resolve(_path, '../../')
test_path          = path.join(_path, 'tmp')
tpl                = 'test-sprout-roots-base'
opts =
  config: path.join(_path, 'locals.json')

before (done) ->
  sprout.add(tpl, test_template_path)
    .then -> rimraf.sync(test_path)
    .then -> sprout.init(tpl, test_path, opts)
    .then -> h.project.install_dependencies('*', done)

after -> sprout.remove(tpl)

describe 'sprout', ->
  it 'inits the project properly', (done) ->
    if fs.existsSync(path.join(test_path, 'views'))
      tgt = path.join(test_path, 'views/index.jade')
    else
      tgt = path.join(test_path, 'index.jade')

    fs.existsSync(tgt).should.be.ok
    done()

  it 'properly includes roots-yaml extension', (done) ->
    tgt = path.join(test_path, 'app.coffee')
    fs.existsSync(tgt).should.be.true

    contents = fs.readFileSync(tgt, 'utf8')
    contents.should.match /yaml()/
    done()

describe 'roots.compile', ->
  before -> h.project.compile(Roots, 'tmp')

  it 'compiles the roots project properly', (done) ->
    tgt = path.join(test_path, 'public', 'index.html')
    fs.existsSync(tgt).should.be.ok
    done()

describe 'base', ->
  before -> h.project.compile(Roots, 'tmp')

  it 'should pass all tests', (done) ->
    shell.cd test_path
    exec = Promise.method shell.exec
    exec 'npm test'
      .then (res) ->
        res.code.should.equal(0)
        (res.output.indexOf('failing') < 0).should.be.true
      .then done()
