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

/* Next Section is for Notification workers */

var notification_worker = new Worker("http://"+ location.host + '/' + 'notification_worker.js'); // Notification Worker
notification_worker.postMessage("start");

/********************************************************************
 * Called when the notifications update web worker sends a message. *
 * Should update #notifications_container with new data.            *
 * Authors: Ahmed H. Ismail.                                        *
 ********************************************************************/
notification_worker.onmessage = function(message) {
  document.getElementById('notifications_container').innerHTML = message.data;
}