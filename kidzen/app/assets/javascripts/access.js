/* This function creates an AJAX request where the paramaters are the url which is specifing
the controller and the action, the data which is specifing the data to be sent to the 
controller, and a callback function.
Authors: Mohamed Khaled AbdelMeguid. */
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

/* This function change a child option when the checkbox is pressed with a true or false value
in the DB through an AJAX request.
Authors: Mohamed Khaled AbdelMeguid. */
function deleteInfo (toBeDeleted, childName) {
    Element.prototype.remove = function() {
        this.parentElement.removeChild(this);
    };
    var x = document.getElementById(toBeDeleted);
    x.remove();
    var url = ['http://' + location.host, 'access_page', 'delete_tag'].join('/');
    var callback = function(responseJSON, xhr) {
    }
    create_ajax_request(url, {tag: toBeDeleted, child: childName}, callback);
  }
  
/* This functions submits a word to be banned for a child.
Authors:- Mohamed Khaled AbdelMeguid. */
function ban(childName) {
    var banned = document.getElementById("submitTags").value
    prompt(banned + " is now banned for your child, Please refresh the page to view all of the tags to be able to delete them. Thanks !");
    var url = ['http://' + location.host, 'access_page', 'add'].join('/');
    var callback = function(responseJSON, xhr) {
    }
    create_ajax_request(url, {ban: banned, child: childName}, callback);
  }
