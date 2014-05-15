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

function banTopic(elem, activity , childName) {
 

    elem.remove();
    var url = ['http://' + location.host, 'access_page', 'ban_topic'].join('/');
    var callback = function(responseJSON, xhr) {
    }
    send_by_ajax(url, {topic: activity, child: childName}, callback);
    var topics_div = document.getElementById('topics');
    var button = document.createElement('button');
    button.onclick = function () {
      deleteTopic(activity, childName);
    };
    button.appendChild(document.createTextNode('X'));
    var button_div = document.createElement('div');
    button_div.id = activity;
    button_div.appendChild(document.createTextNode(activity));
    button_div.appendChild(button)
    topics_div.appendChild(button_div);
  }

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