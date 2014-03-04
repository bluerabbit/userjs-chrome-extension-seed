module.exports = (grunt) ->
  require('load-grunt-tasks')(grunt)

  grunt.initConfig
    bower_concat:
      all:
        dest: 'build/vendor.js'
        dependencies:
          'chai-jquery': ['jquery', 'chai']
        bowerOptions:
          relative: false

    browserify:
      app:
        files:
          'build/all.js': ['coffee/*.coffee']
        options:
          transform: ['coffeeify']

      test:
        files:
          'test/assets/test.js': ['test/*.coffee']
        options:
          transform: ['coffeeify']

    mocha_phantomjs:
      options:
        reporter: 'spec'
      all: ['test/assets/test.html']

    esteWatch:
      options:
        livereload: { enabled: false }
        dirs: ['coffee/**/', 'test/**/']
      coffee: (filepath) ->
        console.log "[#{new Date()}] #{filepath}"
        ['build', 'test']

  grunt.registerTask 'build',   ['bower_concat', 'browserify']
  grunt.registerTask 'default', ['build']
  grunt.registerTask 'test',    ['build', 'mocha_phantomjs']
  grunt.registerTask 'watch',   ['esteWatch']
