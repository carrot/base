<% stylus_exts = ''; yaml_ext = ''; postcss_exts = ''; -%>
<%
  if (grid == true) { stylus_exts = 'grid(), '; postcss_exts = 'lost(), '; }
  if (yaml == true) { roots_exts = 'yaml(),'; }
-%>
axis         = require 'axis'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
poststylus   = require 'poststylus'
rupture      = require 'rupture'
<% if (grid == true) { %>
grid         = require 'jeet'
lost         = require 'lost'
<% } %>
<% if (yaml == true) { %>
yaml         = require 'roots-yaml'
<% } %>
<% if (postcssPlugins["rucksack"] && postcssPlugins["rucksack"].checked) { %>
<% postcss_exts += 'rucksack(), '; -%>
rucksack     = require 'rucksack-css'
<% } %>
<% if (postcssPlugins["cssnext"] && postcssPlugins["cssnext"].checked) { %>
<% postcss_exts += 'cssnext(), '; -%>
cssnext      = require 'cssnext'
<% } %>
<% if (postcssPlugins["system"] && postcssPlugins["system"].checked) { %>
<% postcss_exts += 'system.postcss(), '; -%>
system       = require 'postcss-system'
<% } %>
<% if (postcssPlugins["postcss font pack"] && postcssPlugins["postcss font pack"].checked) { %>
<% postcss_exts += 'fontPack(), '; -%>
fontPack     = require 'postcss-font-pack'
<% } %>
<% if (postcssPlugins["postcss import"] && postcssPlugins["postcss import"].checked) { %>
<% postcss_exts += 'atImport(), '; -%>
atImport     = require 'postcss-import'
<% } %>

module.exports =
  ignores: [
    'readme.md'
    '.DS_Store'
    '.travis.yml'
    '**/layout.*'
    '**/_*'
    '**/*.swp'
    '.gitignore'
    '.git'
    '.editorconfig'
    'test/**'
  ]

  extensions: [
    <%= roots_exts %>
    js_pipeline(
      files: 'assets/js/*.coffee'
      out: 'js/build.js'
      minify: true
      hash: true
    ),
    css_pipeline(
      files: 'assets/css/*.styl'
      out: 'css/build.css'
      minify: true
      hash: true
    )
  ]

  stylus:
    use: [axis(), rupture(), <%= stylus_exts %> poststylus(<%= postcss_exts %>), autoprefixer()]
