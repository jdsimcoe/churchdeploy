module.exports = function (grunt) {
  'use strict';

  // Load local NPM tasks automagically
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

  // Custom variables
  var globalConfig = {
    client: 'atheycreek',
    password: '@th3yCr33k'
  };

  grunt.initConfig({
     globalConfig: globalConfig,

    // JS Hint
    // =====================================================

    jshint : {
      all: [
        'workspace/assets/js/main.js'
      ]
    },

    // LESS
    // =====================================================

    less: {
      main: {
        options: {
          compress: true
        },
        files: {
          'workspace/assets/css/main.css': 'workspace/assets/less/main.less'
        }
      }
    },

    // Concatenation
    // =====================================================

    concat: {
      options: {
        separator: ';'
      },
      dist: {
        src : [
          'workspace/assets/js/jquery.js',
          'workspace/assets/bootstrap/dist/js/bootstrap.min.js',
          'workspace/assets/js/responsimage.js',
          // 'workspace/assets/js/fitvids.js',
          'workspace/assets/js/main.js'],
        dest: 'workspace/assets/js/application.js'
      }
    },

    // Uglify.js
    // =====================================================

    uglify: {
      options: {
        mangle: false
      },
      bootstrap: {
        files: {
          'workspace/assets/js/application.min.js': ['workspace/assets/js/application.js']
        }
      }
    },

    // Notifications
    // =====================================================

    notify: {
      main: {
        options: {
          title: '<%= globalConfig.client  %>.dev',
          message: 'LESS and JS were compiled',
        }
      }
    },

    // Clean
    // =====================================================

    // clean: [ "manifest/cache/*.jpg" ],

    // Watch
    // =====================================================

    watch: {
      main: {
        files: ['**/*.less','**/*.js','!**/node_modules/**'],
        tasks: ['core', 'notify'],
        options: {
          livereload: true,
        }
      }
    },

    // Deployments
    // =====================================================

    deployments: {
      options: {
        "backups_dir": "sql"
      },
      local: {
        "title": "Local",
        "database": "<%= globalConfig.client  %>",
        "user": "root",
        "pass": "",
        "host": "127.0.0.1",
        "url": ""
      },
      production: {
        "title": "Production",
        "database": "<%= globalConfig.client  %>",
        "user": "<%= globalConfig.client  %>",
        "pass": "<%= globalConfig.password  %>",
        "host": "localhost",
        "ssh_host": "simko@192.241.202.190",
        "ssh_port": "45454",
        "url": ""
      }
    }


});

// Main task
grunt.registerTask('core', ['jshint', 'concat', 'uglify:bootstrap', 'less:main']);
grunt.registerTask('build', ['core', 'notify']);
grunt.registerTask('default', ['build', 'watch'])};
