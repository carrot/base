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
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf']

  extensions: [
    <%= roots_extensions %>
    js_pipeline(files: 'assets/js/*.coffee'),
    css_pipeline(files: 'assets/css/*.styl')
  ]

  stylus:
    use: [axis(), rupture(), <%= stylus_extensions %>autoprefixer()]
    sourcemap: true

  'coffee-script':
    sourcemap: true

  jade:
    pretty: true

  server:
    clean_urls: true
