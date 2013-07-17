module.exports = function (grunt) {
  'use strict';

  // Load local NPM tasks
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-growl');


  grunt.initConfig({

    jshint : {
      all: [
        'workspace/themes/active/js/main.js'
      ]
    },

    sass: {
      dev: {
        options: {
          style: 'expanded'
        },
        files: {
          'workspace/themes/active/css/main.css': [
          'workspace/themes/active/scss/main.scss'
          ]
        }
      },
      prod: {
        options: {
          style: 'compressed'
        },
        files: {
          'workspace/themes/active/css/main.css': [
          'workspace/themes/active/scss/main.scss'
          ]
        }
      }
    },

    watch: {
      cssdev: {
        files: '**/*.scss',
        tasks: 'sass:dev'
      },
      cssprod: {
        files: '<config:watch.cssdev.files>',
        tasks: 'sass:prod'
      }
    },

    concat: {
      options: {
        separator: ';'
      },
      dist: {
        src : [
          'workspace/foundation/js/foundation/foundation.js',
          'workspace/foundation/js/foundation/foundation.interchange.js',
          'workspace/foundation/js/foundation/foundation.dropdown.js',
          'workspace/foundation/js/foundation/foundation.placeholder.js',
          'workspace/foundation/js/foundation/foundation.forms.js',
          'workspace/foundation/js/foundation/foundation.alerts.js',
          'workspace/foundation/js/foundation/foundation.magellan.js',
          'workspace/foundation/js/foundation/foundation.reveal.js',
          'workspace/foundation/js/foundation/foundation.tooltips.js',
          'workspace/foundation/js/foundation/foundation.clearing.js',
          'workspace/foundation/js/foundation/foundation.cookie.js',
          'workspace/foundation/js/foundation/foundation.joyride.js',
          'workspace/foundation/js/foundation/foundation.orbit.js',
          'workspace/foundation/js/foundation/foundation.section.js',
          'workspace/foundation/js/foundation/foundation.topbar.js',
          '<config:lint.all>'],
        dest: 'workspace/themes/active/js/foundation.js'
      }
    },

    uglify: {
      options: {
        mangle: false
      },
      foundation: {
        files: {
          'workspace/themes/active/js/foundation.min.js': ['workspace/themes/active/js/foundation.js']
        }
      },
      zepto: {
        files: {
          'workspace/themes/active/js/zepto.min.js': ['workspace/foundation/js/vendor/zepto.js']
        }
      },
      jquery: {
        files: {
          'workspace/themes/active/js/jquery.min.js': ['workspace/foundation/js/vendor/jquery.js']
        }
      }
    },

    growl : {
      main : {
        title : 'Grunt.js',
        message : 'Grunt was run successfully!'
      },
      watch : {
        title : 'Grunt.js',
        message : 'Grunt is watching your files...'
      }
    }

});

// Main task
grunt.registerTask('cssdev', ['sass:dev', 'growl:watch']);
grunt.registerTask('cssprod', ['sass:prod', 'growl:watch']);
grunt.registerTask('jsprod', ['jshint', 'concat', 'uglify:foundation', 'uglify:zepto', 'uglify:jquery']);
grunt.registerTask('zepto', ['uglify:zepto']);
grunt.registerTask('default', ['jshint', 'concat', 'uglify:foundation', 'uglify:zepto', 'uglify:jquery', 'sass:prod', 'growl:main'])};
