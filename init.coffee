exports.configure = [
  {
    name: 'name'
    message: "Your project's name"
  },
  {
    name: 'description'
    message: "A brief description of your project"
  },
  {
    type: 'confirm'
    name: 'netlify'
    message: 'Do you need netlify hosting?'
  },
  {
    type: 'confirm'
    name: 'grid'
    message: 'Do you require a grid framework?'
  }
]

exports.after = (utils, config) ->
  if config.netlify
    utils.exec('npm install')
    .then -> utils.exec('./node_modules/.bin/netlify init')
