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
  xhr.setRequestHeader('Accept', 'application/json'); // I want JSON 
  xhr.responseType = "json";
  xhr.addEventListener('load', function() {
    xhr.responseJSON =  xhr.response;
    console.log(xhr.responseJSON);
    callback(xhr.responseJSON,  xhr);
  });
  xhr.send( JSON.stringify(data) );
  return xhr;
}

/********************************************
 * onclick handler for verify child button. *
 * on confirm_children view                 *
 * childUserName - The child's user name.   *
 * Authors: Ahmed H. Ismail.                *
 ********************************************/
function verify_child (childUserName) {
  var url = ['http://' + location.host, 'supervisors', 'accept_child'].join('/');
  var callback = function(responseJSON, xhr) {
    document.getElementById(childUserName).remove();
  }
  create_ajax_request(url, {child_username: childUserName}, callback);
}

/********************************************
 * onclick handler for reject child button. *
 * on confirm_children view                 *
 * childUserName - The child's user name.   *
 * Authors: Ahmed H. Ismail.                *
 ********************************************/
function reject_child (childUserName) {
  var url = ['http://' + location.host, 'supervisors', 'reject_child'].join('/');
  var callback = function (responseJSON, xhr) {
    document.getElementById(childUserName).remove();
  }
  create_ajax_request(url, {child_username: childUserName}, callback);
}