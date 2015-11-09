# Roots Base Template
This is the default template for [carrot](https://github.com/carrot) static site builds. It uses a base stack of [jade](https://github.com/visionmedia/jade), [stylus](https://github.com/learnboost/stylus), and [coffeescript](https://github.com/jashkenas/coffee-script), along with [axis](https://github.com/jenius/axis), [autoprefixer](https://github.com/jenius/autoprefixer-stylus), and [rupture](https://github.com/jenius/rupture) stylus plugins, along with postcss plugins, and [browserify](https://github.com/substack/node-browserify) compile and minify client-side js.

## optional features
- [jeet](http://jeet.gs) and [lost](http://corysimmons.github.io/lost) as grid frameworks
- [rucksack-css](https://simplaio.github.io/rucksack)
- [cssnext](http://cssnext.io)
- [postcss-system](https://github.com/declandewet/system)
- [postcss-import](https://github.com/postcss/postcss-import)
- [roots-yaml](https://github.com/carrot/roots-yaml)

## Installation
To install: `roots template add base` To make default: `roots template default base`

> **Note**: This template is installed by default with roots, so this is not necessary, just serves as an example for other roots templates here

## Usage
- if you've made this template your default simply, `roots new project-name`
- otherwise, `roots new project-name -t base`
