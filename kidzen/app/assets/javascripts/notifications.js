/*************************************************
 * WebSocketRails dispatcher. For notifications. *
 * Authors: Ahmed H. Ismail.                     *
 *************************************************/

var notifications_connection = new WebSocketRails(location.host + "/websocket");
notifications_connection.bind("notifications.pending", pending_event);
notifications_connection.bind("notifications.new", new_notification);


/******************************************
 * Handles notifications.pending event.   *
 * notifications - pending notifications. *
 * Authors: Ahmed H. Ismail.              *
 ******************************************/
function pending_event (notifications) {
    notifications.forEach(new_notification);
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

    var notificiations_list = document.getElementById('actual_notifications');
    var li = document.createElement('li');
    li.appendChild(notification_pretty_printer(notification));
    notificiations_list.appendChild(li);

    if(notification.custom_view_url != null) {
        li.onclick = function() {
            window.open(notification.custom_view_url); 
        }

        li.classList.add('clickable_notification');
    }
}


/***********************************************************
 * Returns an HTML element that represents a notification. *
 *                                                         *
 ***********************************************************/
function notification_pretty_printer(notification) {
    var div = document.createElement('div');
    var title = document.createTextNode(notification.title);
    var title_p = document.createElement('p');
    title_p.appendChild(title);
    title_p.classList.add('title');
    var short_desc = document.createTextNode(notification.short_desc);
    var sd_p = document.createElement('p');
    sd_p.appendChild(short_desc);
    sd_p.classList.add('short_desc');

    var long_desc = document.createTextNode(notification.long_desc);
    var ld_p = document.createElement('p');
    ld_p.appendChild(long_desc);
    ld_p.classList.add('long_desc');
    div.appendChild(title_p);
    div.appendChild(sd_p);
    div.appendChild(ld_p);

    div.classList.add('notification');
    return div;
}



/************************************
 * Initializes notificiations list. *
 * Authors: Ahmed H. Ismail.        *
 ************************************/
function init_notification_list() {
    //add on click event
    $('#notifications_list').find('li:has(ul)')
      .click( function(event) {
        if (this == event.target) {
            $(this).toggleClass('expanded');
            $(this).children('ul').toggle('medium');
        }
        return false;
      }).addClass('collapsed')
      .children('ul').hide();
}

$(document).ready(function() {
    init_notification_list();
    notifications_connection.trigger("notifications.pending"); // grab notifications
});