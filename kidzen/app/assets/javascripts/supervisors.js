//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require cocoon
//= require websocket_rails/main
//= require notifications.js

/*****************************************************************************
 * JavaScript file included with everything rendered with supervisor layout. *
 * Authors: Ahmed H. Ismail.                                                 *
 *****************************************************************************/
// add removeElement function to DOM
Element.prototype.remove = function() {
  this.parentElement.removeChild(this);
};


/********************************************
 * Handles collapsing and expanding fields. *
 * element - element that was clicked       *
 * Authors: Ahmed H. Ismail                 *
 ********************************************/
function collapse (element) {
  var checkBox = element.firstElementChild.firstElementChild;
  if(checkBox != null) {
    checkBox.checked = !checkBox.checked; // toggle
    var collapsableDiv = element.firstElementChild.nextElementSibling;
    if(collapsableDiv != null) {
      if(checkBox.checked) {
        // make visible
        collapsableDiv.style.visibility="visible";
      }else {
        collapsableDiv.style.visibility="hidden";
      }
    }else {
      console.log("Error in collapse function could not find collapsableDiv");
    }
    // console.log(checkBox);
  }else {
    console.log("Error in collapse function could not find checkBox");
  }
}





