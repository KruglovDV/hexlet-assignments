process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')

module.exports = environment.toWebpackConfig()
const erb = require('./loaders/erb')
environment.loaders.append('erb', erb)
