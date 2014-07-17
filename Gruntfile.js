module.exports = function( grunt ) {
  "use strict";

  grunt.initConfig({
    jscs: {
      options: {
        config: ".jscsrc",
        reporter: "text"
      },
      all: {
        src: "test.js"
      }
    },
    watch: {
      jscs: {
        files: "test.js",
        tasks: [ "jscs" ]
      }
    }
  });

  grunt.event.on('watch', function (action, filepath) {
    grunt.config('jscs.all.src', filepath);
  });

  grunt.loadNpmTasks( "grunt-jscs-checker" );
  grunt.loadNpmTasks( "grunt-contrib-watch" );
};
