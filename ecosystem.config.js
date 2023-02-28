module.exports = {
    apps: [
      {
        name: 'Deepturing',
        exec_mode: 'cluster',
        instances: '4',
        script: './.output/server/index.mjs',
        args: 'start'
      }
    ]
  }