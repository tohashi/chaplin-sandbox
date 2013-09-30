module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        expand: true
        cwd: 'coffee'
        src: '*.coffee'
        dest: 'js'
        ext: '.js'

    connect:
      server:
        options:
          bare: false
          port: 3000

    watch:
      coffee:
        files: ['coffee/*.coffee']
        tasks: ['coffee']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['coffee', 'connect', 'watch']
