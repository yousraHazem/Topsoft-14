/************************************************ 
 * Handles notification actions on click event. *
 * Performs a put request.                      *
 * actionURL -  path to action                  *
 * notificationID - pretty obvious              *
 * Authors: Ahmed H. Ismail.                    *
 ************************************************/
function notification_action_click (actionURL, notificationID, data) {
  // note that we are not interested in response
  var xhr = new XMLHttpRequest();
  xhr.open('PUT', ['http://' + location.host , actionURL].join('/'), true);
  xhr.setRequestHeader('Content-Type', 'application/json');
  xhr.setRequestHeader('Accept', 'application/json'); // I want JSON 
  xhr.responseType = "json"; // even though we do nothing with it, for now...
  xhr.send( JSON.stringify(data) );
}