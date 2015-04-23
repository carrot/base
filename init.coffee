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
  }
]

exports.after = (utils, config) ->
  if config.netlify
    utils.exec('npm install')
    .then -> utils.exec('./node_modules/.bin/netlify init')
