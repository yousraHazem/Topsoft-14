/*************************************************
 * WebSocketRails dispatcher. For notifications. *
 * Authors: Ahmed H. Ismail.                     *
 *************************************************/

var notifications_connection = new WebSocketRails(location.host + "/websocket");
notifications_connection.bind("notifications.pending", pending_event);
notifications_connection.bend("notifications.new", new_notification);

/******************************************
 * Handles notifications.pending event.   *
 * notifications - pending notifications. *
 * Authors: Ahmed H. Ismail.              *
 ******************************************/
function pending_event (notifications) {
  console.log(notifications); // TODO: Implement.
}


/***********************************************
 * Unsubscribes from new notifications events. *
 * Authors: Ahmed H. Ismail.                   *
 ***********************************************/
function unsubscribe() {
  notifications_connection.trigger("notifications.unsubscribe");
}


/************************************
 * Subscribes to new notifications. *
 * Authors: Ahmed H. Ismail.        *
 ************************************/
function subscribe() {
  notifications_connection.trigger("notifications.subscribe");
}

/******************************
 * Handles new notifications. *
 * Authors: Ahmed H. Ismail.  *
 ******************************/
function new_notification(notification) {
  console.log(notification); // TODO: Implement
}
