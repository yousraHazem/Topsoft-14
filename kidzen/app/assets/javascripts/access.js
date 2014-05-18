
/*This function creates an AJAX request where the paramaters are the url which is specifing
the controller and the action, the data which is specifing the data to be sent to the 
controller, and a callback function.
=======
/* This function creates an AJAX request where the paramaters are the url which is specifing
the controller and the action, the data which is specifing the data to be sent to the 
controller, and a callback function. 
>>>>>>> d41a4c87760f2d6dad8b0e8c17fed413d6c55f5c
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

function changeCreateRooms(childId) {
    var checkBox = document.getElementById("can create public chat rooms");
    var valueUpdate = checkBox.checked;
    var url = ['http://' + location.host, 'access_page', 'update_create_rooms'].join('/');

function changeMutualRooms(childId) {
    var checkBox = document.getElementById("mutual friends rooms only");
    var valueUpdate = checkBox.checked;
    prompt(valueUpdate);
    var url = ['http://' + location.host, 'access_page', 'update_mutual_rooms'].join('/');

    var callback = function(responseJSON, xhr) {
    }
create_ajax_request(url, {value: valueUpdate, child: childId}, callback);
}
