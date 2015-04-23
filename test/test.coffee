rimraf = require 'rimraf'
path   = require 'path'
fs     = require 'fs'
locals = require './fixtures/locals.json'

test_template_path = path.resolve(_path, '../..')
test_path          = path.join(__dirname, 'tmp')
tpl = 'test-sprout-android-reader'
opts =
  config: path.join(_path, 'locals.json')

before ->
  sprout.add(tpl, test_template_path, {verbose: true})
  .then -> rimraf.sync(test_path)
  .then -> sprout.init(tpl, test_path, opts)
after ->
  sprout.remove(tpl)
  .then -> rimraf.sync(test_path)


describe 'sprout.init', ->

  it 'properly creates the project from locals', (done) ->
    tgt = path.join(test_path, 'readme.md')
    fs.existsSync(tgt).should.be.true

    contents = fs.readFileSync(tgt, 'utf8')
    contents.should.match /# project x/
    done()
