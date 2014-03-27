module.exports = function(grunt) {

    "use strict";

    grunt.initConfig({ 
    
        clean: ["externs", "js"],
    
        "purescript-make": {
            lib: {
                src:
                    [ "src/**/*.purs.hs"
                    , "bower_components/purescript-*/src/**/*.purs"
                    ]
            }
        }
        
    });

    grunt.loadNpmTasks("grunt-purescript");
    grunt.loadNpmTasks("grunt-contrib-clean");

    grunt.registerTask("default", ["purescript-make:lib"]);
};