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
    xhr.responseJSON = JSON.parse( xhr.responseText );
    callback(xhr.responseJSON,  xhr);
  });
  xhr.send( JSON.stringify(data) );
  return xhr;
}


function verify_child (childUserName) {
  var url = ['http://' + location.host, 'supervisors', 'accept_child'].join('/');
  var callback = function(responseJSON, xhr) {
    document.getElementById(childUserName).remove();
  }
  create_ajax_request(url, {child_username: childUserName}, callback);
}

function reject_child (childUserName) {
  var url = ['http://' + location.host, 'supervisors', 'reject_child'].join('/');
  var callback = function (responseJSON, xhr) {
    document.getElementById(childUserName).remove();
  }
  create_ajax_request(url, {child_username: childUserName}, callback);
}