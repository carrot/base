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
  },
  {
    type: 'confirm'
    name: 'yaml'
    message: 'Do you require roots yaml integration?'
  }
]

exports.after = (utils, config) ->
  if config.netlify
    utils.target.exec('npm install')
    .then -> utils.target.exec('./node_modules/.bin/netlify init')
    .catch console.error
