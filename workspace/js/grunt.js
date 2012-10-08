module.exports = function (grunt) {

  grunt.initConfig({
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
        src : ['js/*.js',
          'bootstrap/docs/assets/js/bootstrap.min.js',
          'themes/active/js/audio.min.js', 
          '<config:lint.all>'],
        dest: 'themes/active/js/common-ck.js'
      }
    }
  });
  // Default task.
  grunt.registerTask('default', 'lint concat');
  
};
