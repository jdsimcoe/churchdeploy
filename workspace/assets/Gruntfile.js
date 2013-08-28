module.exports = function (grunt) {
  'use strict';

  // Load local NPM tasks
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-notify');


  grunt.initConfig({

    less: {
      admin: {
        options: {
          yuicompress: true
        },
        files: {
          "css/admin-override.css": "less/admin.less"
        }
      },
      debug: {
        options: {
          yuicompress: true
        },
        files: {
          "css/devkit-override.css": "less/debug.less"
        }
      }
    },

    watch: {
      less: {
        files: 'less/*.less',
        tasks: ['less:admin', 'less:debug']
      }
    }

});

// Main task
grunt.registerTask('default', ['less:admin', 'less:debug'])};
