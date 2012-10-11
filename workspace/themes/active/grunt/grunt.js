module.exports = function (grunt) {
  'use strict';

  grunt.initConfig({

    lint : {
      all: ['../js/common.js', '../js/alertManager.js']
    },

    minify : {
      all: [
        '../less/common.less',
        '../coffee/*.coffee'
      ]
    },

    recess: {
      dist: {
        src: [
        '../less/common.less'
        ],
        dest: '../css/common.2.3.2.css',
        options: {
            compile: true,
            compress: true
        }
      }
    },

    coffee: {
      app: {
        src: ['../coffee/*.coffee'],
        dest: '../js/'
      }
    },

    watch : {
      scripts: {
        files: '<config:minify.all>',
        tasks: 'coffee concat recess:dist growl:watch'
      }
    },

    concat : {
      dist: {
        src : [
          '../../../bootstrap/docs/assets/js/jquery.js',
          '../../../js/lodash.min.js',
          '../../../bootstrap/docs/assets/js/bootstrap.min.js',
          '../../../js/responsimage.js',
          '../../../js/jquery.cookie.js',
          '../js/audio.min.js',
          '../js/reftagger.js',
          '<config:lint.all>'],
        dest: '../js/common-ck.2.3.2.js'
      }
    },

    growl : {
      compile : {
        message : "Grunt was run successfully",
        title : "Grunt.js"
      },
      watch: {
        message : "Grunt is watching your files",
        title : "Grunt.js"
      }
    }

  });

// Load local NPM tasks
grunt.loadNpmTasks('grunt-recess');
grunt.loadNpmTasks('grunt-coffee');
grunt.loadNpmTasks('grunt-growl');

// Main task
grunt.registerTask('default', 'coffee concat recess:dist growl:compile')};