/************************************************** 
 * This function send the request by AJax.        *
 * url -  path to action.                         *
 * data - data needed to be passed to the action. *
 * Authors: Shary Beshara.                        *
 *************************************************/

  function send_by_ajax (url, data, callback) {
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

  /********************************************************************* 
 * This function sends the topic needed to be banned and the specified *
 * child to the action by AJAX.                                        *
 * topic -  topic needed to banned passed by the view.                 *
 * childName - the child user name.                                    *
 * Authors: Shary Beshara.                                             *
 **********************************************************************/

function banTopic(elem, topic , childName) {
    elem.remove();
    var url = ['http://' + location.host, 'access_page', 'ban_topic'].join('/');
    var callback = function(responseJSON, xhr) {
    }
    send_by_ajax(url, {topic: topic, child: childName}, callback);
    var topics_div = document.getElementById('topics');
    var button = document.createElement('button');
    button.onclick = function () {
      deleteTopic(topic, childName);
    };
    button.appendChild(document.createTextNode('X'));
    var button_div = document.createElement('div');
    button_div.id = topic;
    button_div.appendChild(document.createTextNode(topic));
    button_div.appendChild(button)
    topics_div.appendChild(button_div);
  }

  /*********************************************************************** 
 * This function sends the topic needed to be unbanned and the specified *
 * child to the action by AJAX.                                          *
 * toBeDeleted -  topic needed to unbanned passed by the view.           *
 * childName - the child user name.                                      *
 * Authors: Shary Beshara.                                               *
 ************************************************************************/


  function deleteTopic (toBeDeleted, childName) {

    var button = document.createElement('button');
    button.appendChild(document.createTextNode(toBeDeleted));
    button.onclick = function(){
      banTopic(button , toBeDeleted, childName);
    };
    var div = document.getElementById("list_of_activities");
    div.appendChild(button);
    var x = document.getElementById(toBeDeleted);
    x.remove();

    var url = ['http://' + location.host, 'access_page', 'delete_topic'].join('/');
    var callback = function(responseJSON, xhr) {
    }
    send_by_ajax(url, {topic: toBeDeleted, child: childName}, callback);

  }