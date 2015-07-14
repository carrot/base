rimraf = require 'rimraf'
path   = require 'path'
fs     = require 'fs'
Roots  = require 'roots'

test_template_path = path.resolve(_path, '../..')
test_path          = path.join(__dirname, 'tmp')
tpl = 'test-sprout-roots-base'
opts =
  config: path.join(_path, 'locals.json')

before (done) ->
  sprout.add(tpl, test_template_path)
  .then -> rimraf.sync(test_path)
  .then -> sprout.init(tpl, test_path, opts)
  .then -> h.project.install_dependencies('*', done)

after ->
  sprout.remove(tpl)

describe 'sprout.init', ->

  it 'properly creates the project from locals', (done) ->
    tgt = path.join(test_path, 'readme.md')
    fs.existsSync(tgt).should.be.true

    contents = fs.readFileSync(tgt, 'utf8')
    contents.should.match /# project x/
    done()

  it 'properly includes grid plugin', (done) ->
    tgt = path.join(test_path, 'assets', 'css','master.styl')
    fs.existsSync(tgt).should.be.true

    contents = fs.readFileSync(tgt, 'utf8')
    contents.should.match /@import 'jeet'/
    done()

  it 'properly includes roots-yaml extension', (done) ->
    tgt = path.join(test_path, 'app.coffee')
    fs.existsSync(tgt).should.be.true

    contents = fs.readFileSync(tgt, 'utf8')
    contents.should.match /yaml()/
    done()

describe 'roots.compile', ->
  before -> h.project.compile(Roots, 'site')

  it 'compiles the roots project, properly', (done) ->
    tgt = path.join(test_path, 'public', 'index.html')
    fs.existsSync(tgt).should.be.ok
    done()
