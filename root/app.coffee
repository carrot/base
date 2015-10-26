<% stylus_extensions = ''; yaml_ext = ''; -%>
<%
  if (grid == true) { stylus_extensions = 'grid(), '; }
  if (yaml == true) { roots_extensions = 'yaml(),'; }
-%>
axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
<% if (grid == true) { %>grid         = require 'jeet'<%}%>
<% if (yaml == true) { %>yaml         = require 'roots-yaml'<%}%>

module.exports =
  ignores: [
    'readme.md',
    '.DS_Store',
    '.travis.yml'
    '**/layout.*'
    '**/_*'
    '.gitignore'
    '.git'
    '.editorconfig',
    'test/**'
  ]

  extensions: [
    <%= roots_extensions %>
    js_pipeline(files: 'assets/js/**'),
    css_pipeline(files: 'assets/css/**')
  ]

  stylus:
    use: [axis(), rupture(), <%= stylus_extensions %>autoprefixer()]
    sourcemap: true
    'include css': true

  'coffee-script':
    sourcemap: true

  jade:
    pretty: true

  server:
    clean_urls: true
