var glctxt;
var clear;

function glStart() {
    var canvas = document.getElementById("glcanvas");
    glctxt = glInit(canvas);
    if(glctxt) {
        glctxt.clearColor(0.0, 0.0, 0.0, 1.0);
        glctxt.enable(GL_DEPTH_TEST);
        glctxt.depthFunc(gl.LEQUAL);
        clear = glctxt.clear.bind(glctxt.COLOR_BUFFER_BIT | glctxt.DEPTH_BUFFER_BIT);
        clear();

    }
}


function glInit(canvas) {
    var gl = null;
    try {
        gl = canvas.getContext("webgl") || canvas.getContext("experimental-webgl");
    } catch (ex) {
        // totally ignore the exception
    }
    if(!gl) {
        console.log("Warning: Could not init GL context.");
    }
}