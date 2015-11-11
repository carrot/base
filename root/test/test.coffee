rimraf = require 'rimraf'
path   = require 'path'
fs     = require 'fs'
Roots  = require 'roots'

project_path = path.join __dirname, '..'
compile_project = (done) ->
  h.project.compile(Roots, project_path).then -> done()

before (done) -> h.project.install_dependencies('*',done)
after -> h.project.remove_folders('**/public')

describe 'roots.compile', ->
  before (done) -> compile_project(done)

  it 'compiles the roots project properly', (done) ->
    tgt = path.join(project_path, 'public/index.html')
    fs.existsSync(tgt).should.be.ok
    done()
