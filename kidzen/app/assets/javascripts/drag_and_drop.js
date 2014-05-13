  var matched = 0;
  var nscore = 0;
  var done = false;
$( init );
 
function init() {
   matched = 0;
   score = 0;
   done = false;
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
 $('#sqrdrop').data('shape',2).droppable({
    drop: handhide
  });
 $('#trdrop').data('shape',1).droppable({
    drop: handhide
  });
  $('#crdrop').data('shape',3).droppable({
    drop: handhide
  });  
}
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
 function handhide(event ,ui) {
  matched++;
  var draggable = ui.draggable;
  var contid = $(this).data('shape')
  var shid = draggable.data('shape')
  if(contid == shid) nscore++;
  draggable.hide();
  if(matched == 3) {
    alert('Your Score: '+nscore);
    done = true;
    var url = ['http://' + location.host, 'drag_and_drops',n].join('/');
    var callback = function(responseJSON, xhr) {}
    create_ajax_request(url,{score: nscore},callback);
}
}
function shareScore() {
  if(done) {
    var url = ['http://' + location.host, 'drag_and_drops','share_score'].join('/');
    var gurl = ['http://' + location.host, 'drag_and_drops',n].join('/');
    var head = 'My progress at '+ g +'game';
    var post = 'I have scored '+nscore+' points at ' +g.link(gurl);
    var callback = function(responseJSON, xhr) {}
    create_ajax_request(url,{title: head, body: post},callback);
    alert('Successfully Shared :)');
  }
  else {
    alert('You have to Play first!');
  }
} 