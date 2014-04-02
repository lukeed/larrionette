module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    bower:
      install:
        options:
          targetDir: "app/assets/vendor/components"
          cleanTargetDir: true
          cleanBowerDir: true
          install: true
          copy: true
          layout: "byComponent"
      cleanup:
        options:
          cleanTargetDir: true
          cleanBowerDir: true
          install: false
          copy: false
    
    sass:
      dist:
        options:
          style: 'compressed'
        files:
          # destination : source
          'public/css/frontend.css': 'app/assets/scss/frontend.scss'
          'public/css/backend.css': 'app/assets/scss/backend.scss'

    concat:
      structure:
        src: [
          'app/assets/vendor/components/jquery/**/*.js'
          'app/assets/vendor/components/underscore/**/*.js'
          'app/assets/vendor/components/backbone/**/*.js'
          'app/assets/vendor/components/backbone.marionette/**/*.js'
          'app/assets/vendor/components/backbone.picky/**/*.js'
          'app/assets/vendor/components/spin.js/*.js'
          'app/assets/vendor/templates.js'
        ]
        dest: 'public/js/structure.js'

    uglify:
      options:
        mangle: false  # Use if you want the names of your functions and variables unchanged
      frontend:
        files:
          'public/js/structure.js': 'public/js/structure.js',
      backend:
        files:
          'public/js/app.js': 'public/js/app.js',

    coffee:
      compileWithMaps:
        options:
          sourceMap: true
          bare: true
        files:
          "public/js/app.js": [
            "app/assets/coffee/config/**/*.coffee",
            "app/assets/coffee/app.coffee",
            "app/assets/coffee/entities/_base/*.coffee",
            "app/assets/coffee/entities/**/*.coffee",
            "app/assets/coffee/controllers/**/*.coffee",
            "app/assets/coffee/views/**/*.coffee",
            "app/assets/coffee/**/*.coffee",
          ]

    eco:
      options:
        basePath: "app/assets/coffee/"
      app:
        src: ['app/assets/coffee/**/*.eco']
        dest: 'app/assets/vendor/templates.js'

    watch:
      coffee:
        files: 'app/assets/coffee/**/*.coffee'
        tasks: ["coffee"]
        options:
          livereload: true
          interrupt: true
      eco:
        files: 'app/assets/coffee/**/*.eco'
        tasks: ["eco", "concat"]
        options:
          livereload: true
          interrupt: true
      structure:
        files: 'app/assets/vendor/**/*.js'
        tasks: ["concat"]
        options:
          livereload: true
          interrupt: true
      sass:
        files: 'app/assets/scss/*.scss'
        tasks: ["sass"]
        options:
          livereload: true                     


  # Load the tasks
  grunt.loadNpmTasks "grunt-bower-task"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-eco"
  grunt.loadNpmTasks "grunt-contrib-watch"

  # Default task(s).
  grunt.registerTask "default", ["eco", "bower", "concat", "coffee", "sass"]