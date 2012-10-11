module.exports = function (grunt) {
  'use strict';

  grunt.initConfig({

    lint : {
      all: ['themes/active/js/common.js', 'themes/active/js/alertManager.js']
    },

    minify : {
      all: [
        'themes/active/less/common.less',
        'themes/active/coffee/*.coffee'
      ]
    },

    recess: {
      dist: {
        src: [
        'themes/active/less/common.less'
        ],
        dest: 'themes/active/css/common.2.3.2.css',
        options: {
            compile: true,
            compress: true
        }
      }
    },

    coffee: {
      app: {
        src: ['themes/active/coffee/*.coffee'],
        dest: 'themes/active/js/'
      }
    },

    watch : {
      scripts: {
        files: '<config:minify.all>',
        tasks: 'coffee concat recess:dist'
      }
    },

    concat : {
      dist: {
        src : [
          'bootstrap/docs/assets/js/jquery.js',
          'js/lodash.min.js',
          'bootstrap/docs/assets/js/bootstrap.min.js',
          'js/responsimage.js',
          'js/jquery.cookie.js',
          'themes/active/js/audio.min.js',
          'themes/active/js/reftagger.js',
          '<config:lint.all>'],
        dest: 'themes/active/js/common-ck.2.3.2.js'
      }
    }
  });

// Load local NPM tasks
grunt.loadNpmTasks('grunt-recess');
grunt.loadNpmTasks('grunt-coffee');

// Main task
grunt.registerTask('default', 'coffee concat recess:dist')};