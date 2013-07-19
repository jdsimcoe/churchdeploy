module.exports = function (grunt) {
  'use strict';

  // Load local NPM tasks
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-growl');


  grunt.initConfig({

    jshint : {
      all: [
        'workspace/themes/active/js/main.js'
      ]
    },

    less: {
      dev: {
        files: {
          "workspace/themes/active/css/main.css": "workspace/themes/active/less/main.less"
        }
      },
      prod: {
        options: {
          yuicompress: true
        },
        files: {
          "workspace/themes/active/css/main.css": "workspace/themes/active/less/main.less"
        }
      }
    },

    concat: {
      options: {
        separator: ';'
      },
      dist: {
        src : [
          'workspace/bootstrap/js/transition.js',
          'workspace/bootstrap/js/alert.js',
          'workspace/bootstrap/js/modal.js',
          'workspace/bootstrap/js/dropdown.js',
          // 'workspace/bootstrap/js/scrollspy.js',
          'workspace/bootstrap/js/tab.js',
          'workspace/bootstrap/js/tooltip.js',
          'workspace/bootstrap/js/button.js',
          'workspace/bootstrap/js/collapse.js',
          'workspace/bootstrap/js/carousel.js',
          // 'workspace/bootstrap/js/typeahead.js',
          // 'workspace/bootstrap/js/affix.js',
          'workspace/js/responsimage.js',
          '<config:jshint.all.files>'],
        dest: 'workspace/themes/active/js/application.js'
      }
    },

    uglify: {
      options: {
        mangle: false
      },
      bootstrap: {
        files: {
          'workspace/themes/active/js/application.min.js': ['workspace/themes/active/js/application.js']
        }
      },
      jquery: {
        files: {
          'workspace/themes/active/js/jquery.min.js': ['workspace/bootstrap/assets/js/jquery.js']
        }
      }
    },

    watch: {
      cssdev: {
        files: '**/*.less',
        tasks: 'less:dev'
      },
      cssprod: {
        files: '<config:watch.cssdev.files>',
        tasks: 'less:prod'
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
grunt.registerTask('cssdev', ['less:dev', 'growl:watch']);
grunt.registerTask('cssprod', ['less:prod', 'growl:watch']);
grunt.registerTask('jsprod', ['jshint', 'concat', 'uglify:bootstrap', 'uglify:jquery']);
grunt.registerTask('default', ['jshint', 'concat', 'uglify:bootstrap', 'uglify:jquery', 'less:prod', 'growl:main'])};
