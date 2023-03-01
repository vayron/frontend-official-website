module.exports = {
    apps: [
      {
        name: 'visionstory',
        exec_mode: 'cluster',
        instances: '8',
        script: './.output/server/index.mjs',
        args: 'start'
      }
    ]
  }