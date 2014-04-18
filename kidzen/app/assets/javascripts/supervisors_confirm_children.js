/****************************************************
 * Creates an AJAX request.                         *
 * Always uses a put request.                       *
 * url - where to send                              *
 * data - payload is converted to json              *
 * callback - function to be called when ready      *
 * with params responseJSON, XMLHttpRequest object. *
 * Authors: Ahmed H. Ismail                         *
 ****************************************************/
function create_ajax_request (url, data, callback) {
  var xhr = new XMLHttpRequest();
  xhr.open('PUT', url, true);
  xhr.setRequestHeader('Content-Type', 'application/json');
  xhr.addEventListener('load', function() {
    xhr.responseJSON = JSON.parse( xhr.responeText );
    callback(xhr.responseJSON,  xhr);
  });
  xhr.send( JSON.stringify(data) );
  return xhr;
}
// add removeElement function to DOM
Element.prototype.remove = function() {
  this.parentElement.removeChild(this);
};


function verify_child (childUserName) {
  var url = [location.hostname, 'supervisor', 'accept_child'].join('/');
  var callback = function(responseJSON, xhr) {
    document.getElementById(childUserName).remove();
  }
  create_ajax_request(url, {child_username: childUserName}, callback);
}

function reject_child (childUserName) {
  var url = [location.hostanme, 'supervisor', 'reject_child'].join('/');
  var callback = function (responseJSON, xhr) {
    document.getElementById(childUserName).remove();
  }
  create_ajax_request(url, {child_username: childUserName}, callback);
}