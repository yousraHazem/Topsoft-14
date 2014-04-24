/**************************************************
 * Web Worker for fetching pending notifications. *
 * Authors: Ahmed H. Ismail.                      *
 **************************************************/


var interval = null; // for periodic execution
/***************************************************
 * Responds to a message from the worker's parent. *
 * Message - the MessageEvent sent by parent.      *
 * Authors: Ahmed H. Ismail.                       *
 ***************************************************/
onmessage = function (message) {
  switch(message.data){
    case "start":
      if(interval != null) {
        clearInterval(interval);
      }
      interval = setInterval(fetch_pending_notifications, 10000); // update every 10 seconds
      break;
    case "stop":
      clearInterval(interval);
      break;
  } 
};

/***************************************
 * Sends a synchronous get request,    *
 * to fetch the pending notifications. *
 * Authors: Ahmed H. Ismail.           *
 ***************************************/
function fetch_pending_notifications () {
  var xhr = new XMLHttpRequest();
  hostname = "http://"+ location.host;
  url = [hostname, 'notifications', 'pending'].join('/');
  xhr.open('GET', url , false); // do not execute asynchronously
  xhr.setRequestHeader('Accept', 'text/html'); // we want html !
  xhr.send(); // blocks
  if(xhr.status == 200)  {
    // HTTP OK
    postMessage(xhr.responseText); 
  }
  // TODO: How about delta compression?
}