/*
 * This is JavaScript file that handles all the actions that happen
 * in The drag and drop game.
 * Author : Hussien M. Eloy
*/ 
var matched = 0;
var gameScore = 0;
var canShare = false;

$( init );

/*
 * This function is used to start the game and reset all the variables
 * and set all the object needs to be set according to its role in the game.
 * Parameters : None.
 * Returns : None.
 * Approach : Just assigning the variables to zeros, 
 * And assign the objects present in in game view that is needed to be
 * used in the game in the game to their roles.
 * Author : Hussien M. Eloy
*/ 
function init() {
    matched = 0;
    gameScore = 0;
    canShare = false;
    $('.triangle').data('shape',1).draggable({
        containment: '.contentn',
        cursor: 'move',
        snap: '.contentn'
    });
    $('#square').data('shape',2).draggable({
        containment: '.contentn',
        cursor: 'move',
        snap: '.contentn'
    });
    $('#circle').data('shape',3).draggable({
        containment: '.contentn',
        cursor: 'move',
        snap: '.contentn'
    });
    $('#square-slot').data('shape',2).droppable({
        drop: playGame
    });
    $('#triangular-slot').data('shape',1).droppable({
        drop: playGame
    });
    $('#circular-slot').data('shape',3).droppable({
        drop: playGame
    });  
}

/****************************************************
* Creates an AJAX request. *
* Always uses a put request. *
* url - where to send *
* data - payload is converted to json *
* callback - function to be called when ready *
* with params responseJSON, XMLHttpRequest object. *
* Authors: Ahmed H. Ismail, Hussien M. Eloy *
****************************************************/
function create_ajax_request (url, data, callback) { 
    var xhr = new XMLHttpRequest(); 
    xhr.open('PUT', url, true); 
    xhr.setRequestHeader('Content-Type', 'application/json'); 
    xhr.setRequestHeader('Accept', 'application/json'); 
    xhr.responseType = "json"; xhr.addEventListener('load', function() { 
    xhr.responseJSON = xhr.response; console.log(xhr.responseJSON); 
    callback(xhr.responseJSON, xhr); }); 
    xhr.send( JSON.stringify(data) ); 
    return xhr; 
}

/*
 * This method is basically the engine of the game as it keeps
 * track of actions taken so far, as well as score accomplished during
 * the game, At the end it should send ajax request to the controller
 * to insert the score of the last game in its table.
 * Parameters : * event - (dropping draggable object in droppable one).
 *              * ui - draggable object.
 * Returns : None
 * Author : Hussien M. Eloy
*/
function playGame(event, ui) {
    matched++;
    var draggable = ui.draggable;
    var slotId = $(this).data('shape')
    var shapeId = draggable.data('shape')
    if (slotId == shapeId) 
        gameScore++;
    draggable.hide();
    if (matched == 3) {
        alert('Your Score: ' + gameScore);
        canShare = true;
        var url = ['http://' + location.host
            , 'drag_and_drops', gameId].join('/');
        var callback = function(responseJSON, xhr) {}
        create_ajax_request(url, {score: gameScore}, callback);
    }
}
/*
 * This method is used to make the user able to share
 * his/her progress in the current game by sending a post
 * containing the last score achieved by the user.
 * Parameters : None.
 * Returns : None.
 * Approach : If the user can share score (i.e That he/she
 * has already finished some game, A PUT request will be sent to the controller
 * holding an automated messages as post title and content, They change only
 * as they hold game (id - name) and score, The message carried with this
 * request will be sent to DragAndDropsController to be inserted in post table.
 * Author : Hussien M. Eloy   
*/
function shareScore() {
    if (canShare) {
    var url = ['http://' + location.host, 'drag_and_drops'
        , gameID].join('/');
    var gameUrl = ['http://' + location.host, 'drag_and_drops'
        , gameId].join('/');
    var head = 'My progress at '+ gameName +'game';
    var post = 'I have scored '+gameScore+' points at '+gameName.link(gameUrl);
    var callback = function(responseJSON, xhr) {}
    create_ajax_request(url,{title: head, body: post},callback);
    alert('Successfully Shared :)');
  }
  else {
    alert('You have to Play first!');
  }
} 
