module.exports = function (grunt) {
  'use strict';

  grunt.initConfig({

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

    lint : {
      all: ['themes/active/js/common.js', 'themes/active/js/alertManager.js']
    },

    watch : {
      scripts: {
        files: '<config:lint.all>',
        tasks: 'concat'
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

// Default task.
grunt.loadNpmTasks('grunt-recess');
grunt.loadNpmTasks('grunt-coffee');
grunt.registerTask('default', 'coffee concat recess:dist')};