rimraf = require 'rimraf'
path   = require 'path'
fs     = require 'fs'
Roots  = require 'roots'

test_path = path.join(__dirname, '..')
project = new Roots(test_path)

describe 'roots.compile', ->
  before ->
    h.project.compile(project, __dirname)

  after -> rimraf.sync(path.join(test_path, 'public'))

  it 'compiles the roots project properly', (done) ->
    tgt = path.join(test_path, 'public', 'index.html')
    fs.existsSync(tgt).should.be.ok
    done()
