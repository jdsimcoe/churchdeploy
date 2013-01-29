
/*

grunt watch:jsdev & grunt watch:cssdev

*/

var theme_directory = "workspace/themes/active";

module.exports = function(grunt) {
  grunt.loadNpmTasks("grunt-coffee");
  grunt.loadNpmTasks("grunt-coffeelint");
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks("grunt-css");
  grunt.loadNpmTasks("grunt-growl");
  grunt.loadNpmTasks("grunt-recess");
  grunt.initConfig({
    clean: {
      all: {
        src: [
          "grunt-temp"
        ]
      }
    },
    coffee: {
      core_coffee: {
        src: [
          "grunt-temp/core_coffee.coffee"
        ],
        dest: "grunt-temp",
        preserve_dirs: false,
        options: {
          bare: false
        }
      },
      features_coffee: {
        src: [
          "grunt-temp/features_coffee.coffee"
        ],
        dest: "grunt-temp",
        preserve_dirs: false,
        options: {
          bare: false
        }
      },
      theme_coffee: {
        src: [
          "grunt-temp/theme_coffee.coffee"
        ],
        dest: "grunt-temp",
        preserve_dirs: false,
        options: {
          bare: false
        }
      }
    },
    coffeelint: {
      all: {
        src: [
          "<config:concat.core_coffee.src>",
          "<config:concat.features_coffee.src>",
          "<config:concat.theme_coffee.src>"
        ]
      }
    },
    coffeelintOptions: {
      max_line_length: {
        value: 1000,
        level: "error"
      }
    },
    concat: {
      all_to_theme: {
        src: [
          "grunt-temp/core_js.js",
          "grunt-temp/core_coffee.js",
          "grunt-temp/features_js.js",
          "grunt-temp/features_coffee.js",
          "grunt-temp/theme_js.js",
          "grunt-temp/theme_coffee.js"
        ],
        dest: theme_directory + "/export/combined.js"
      },
      all_to_temp: {
        src: [
          "<config:concat.all_to_theme.src>"
        ],
        dest: "grunt-temp/combined.js"
      },
      core_coffee: {
        src: [
          "workspace/coffee/**/*.coffee"
        ],
        dest: "grunt-temp/core_coffee.coffee"
      },
      features_coffee: {
        src: [
          "workspace/features/**/*.coffee"
        ],
        dest: "grunt-temp/features_coffee.coffee"
      },
      theme_coffee: {
        src: [
          theme_directory + "/coffee/**/*.coffee"
        ],
        dest: "grunt-temp/theme_coffee.coffee"
      },
      core_js: {
        src: [
          "workspace/js/jquery.js",
          "workspace/js/jquery.cookie.js",
          "workspace/js/json2.js",
          "workspace/js/lodash.js",
          "workspace/js/audio.js",
          "workspace/js/mediaelement.js",
          "workspace/js/responsimage.js",
          "<config:concat.bootstrap_js.src>"
        ],
        dest: "grunt-temp/core_js.js"
      },
      features_js: {
        src: [
          "workspace/features/**/*.js"
        ],
        dest: "grunt-temp/features_js.js"
      },
      theme_js: {
        src: [
          theme_directory + "/js/**/*.js"
        ],
        dest: "grunt-temp/theme_js.js"
      },
      bootstrap_js: {
        src: [
          "workspace/bootstrap/js/bootstrap-transition.js",
          "workspace/bootstrap/js/bootstrap-alert.js",
          "workspace/bootstrap/js/bootstrap-button.js",
          "workspace/bootstrap/js/bootstrap-carousel.js",
          "workspace/bootstrap/js/bootstrap-collapse.js",
          "workspace/bootstrap/js/bootstrap-dropdown.js",
          "workspace/bootstrap/js/bootstrap-modal.js",
          "workspace/bootstrap/js/bootstrap-tooltip.js",
          "workspace/bootstrap/js/bootstrap-popover.js",
          "workspace/bootstrap/js/bootstrap-scrollspy.js",
          "workspace/bootstrap/js/bootstrap-tab.js",
          "workspace/bootstrap/js/bootstrap-typeahead.js",
          "workspace/bootstrap/js/bootstrap-affix.js"
        ],
        dest: "grunt-temp/bootstrap_js.js"
      }
    },
    min: {
      all: {
        src: "grunt-temp/combined.js",
        dest: theme_directory + "/export/combined.js"
      }
    },
    recess: {
      dev: {
        src: [
          theme_directory + "/less/common.less"
        ],
        dest: theme_directory + "/css/common.css",
        options: {
          compile: true
        }
      },
      prod: {
        src: [
            theme_directory + "/less/common.less"
        ],
        dest: theme_directory + "/css/common.css",
        options: {
          compile: true,
          compress: true
        }
      }
    },
    watch: {
      cssdev: {
        files: [
          //"**/*.css",
          "**/*.less"
        ],
        tasks: "cssdev"
      },
      cssprod: {
        files: "<config:watch.cssdev.files>",
        tasks: "cssprod"
      },
      jsdev: {
        files: [
          //"**/*.js",
          "**/*.coffee"
        ],
        tasks: "jsdev"
      },
      jsprod: {
        files: "<config:watch.jsdev.files>",
        tasks: "jsprod"
      }
    },
    growl : {
      cssdev : {
        title : "cssdev",
        message : "success"
      },
      cssprod : {
        title : "cssprod",
        message : "success"
      },
      jsdev : {
        title : "jsdev",
        message : "success"
      },
      jsprod : {
        title : "jsprod",
        message : "success"
      }
    }
  });
  grunt.registerTask("cssdev",
    "recess:dev" +
    " growl:cssdev"
  );
  grunt.registerTask("cssprod",
    "recess:prod" +
    " growl:cssprod"
  );
  var jsTaskPrefix = "" +
    "coffeelint" +
    " concat:core_coffee" +
    " coffee:core_coffee" +
    " concat:features_coffee" +
    " coffee:features_coffee" +
    " concat:theme_coffee" +
    " coffee:theme_coffee" +
    " concat:core_js" +
    " concat:features_js" +
    " concat:theme_js";
  grunt.registerTask("jsdev",
    jsTaskPrefix +
    " concat:all_to_theme" +
    " clean" +
    " growl:jsdev"
  );
  grunt.registerTask("jsprod",
    jsTaskPrefix +
    " concat:all_to_temp" +
    " min" +
    " clean" +
    " growl:jsprod"
  );
};
