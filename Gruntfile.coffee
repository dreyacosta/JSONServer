module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    mochaTest:
      test:
        options:
          reporter: 'spec'
          require: 'coffee-script/register'
        src: 'specs/**/*'

    grunt.loadNpmTasks 'grunt-mocha-test'

    grunt.registerTask 'test', ['mochaTest']