/* 
 used to remove fields
 Parameters : *link : the remove link that follow what i want to delete.
 Returns : None.
 Author : Ahmad Bassiouny.
*/
function remove_fields(link) {
  $(link).prevAll("input[type=hidden]").first().val("1");
  $(link).closest(".fields").hide();
}

/* 
 used to add fields
 Parameters : *link : the add link that user will see.
              *association : the object i want to add.
              *content : type of the object i want to add
 Returns : None.
 Author : Ahmad Bassiouny.
*/
function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().before(content.replace(regexp, new_id));
}

/* 
 * Creates an AJAX request.                         
 * Always uses a put request.                       
 * Parameters : *url : where to send                              
 *              *data : payload is converted to json              
 *              *callback : function to be called when ready with params 
 *                          responseJSON, XMLHttpRequest object. 
 * Authors: Ahmed H. Ismail. 
*/
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

/* 
 used to put all the selcted values in an array an send it to the controller
 Parameters : None.
 Returns : None.
 Author : Ahmad Bassiouny.
*/
function submit(){
  var SelectedValue = [];
  var name = 0;
  var radios = document.getElementsByTagName("input");
  for(var i=0; i<radios.length; i++) {
    if(radios[i].checked){
      var valueSelected = radios[i].value;
      SelectedValue.push(valueSelected)
   }
  }
  var url = ['http://' + location.host, 'new_surveys', 'submit'].join('/');
  var callback = function(responseJSON, xhr) {}
  create_ajax_request(url, {arrays: SelectedValue}, callback);
}

/* 
 used to update the value of the range
 Parameters : *newValue : the return value of the HTML rang.
 Returns : None.
 Author : Ahmad Bassiouny.
*/
function showValue(newValue){
  document.getElementById("range").innerHTML=newValue;
}

/* 
 used to hide the links of AddPic , AddRange and AddRank
 Parameters : None.
 Returns : None.
 Author : Ahmad Bassiouny.
*/
function enableAns() {
  var elements = document.getElementsByClassName("AddPic");
  for(var i=0; i<elements.length; i++) {
    if (i==(elements.length - 1)){
      elements[i].style.display='none';
    };
  }
  var elements = document.getElementsByClassName("AddRange");
  for(var i=0; i<elements.length; i++) {
    if (i==(elements.length - 1)){
    elements[i].style.display='none';
    };
  }
  var elements = document.getElementsByClassName("AddRank");
  for(var i=0; i<elements.length; i++) {
    if (i==(elements.length - 1)){
      elements[i].style.display='none';
    };
  }
}
    
/* 
used to hide the links of AddAns , AddRange and AddRank
Parameters : None.
Returns : None.
Author : Ahmad Bassiouny.
*/
function enablePic() {
  var elements = document.getElementsByClassName("AddAns");
  for(var i=0; i<elements.length; i++) {
    if (i==(elements.length - 1)){
      elements[i].style.display='none';
    };
  }
  var elements = document.getElementsByClassName("AddRange");
  for(var i=0; i<elements.length; i++) {
    if (i==(elements.length - 1)){
      elements[i].style.display='none';
    };
  }
  var elements = document.getElementsByClassName("AddRank");
  for(var i=0; i<elements.length; i++) {
    if (i==(elements.length - 1)){
      elements[i].style.display='none';
    };
  }
}

/* 
used to hide the links of AddAns , AddPic and AddRank
Parameters : None.
Returns : None.
Author : Ahmad Bassiouny.
*/
function enableRang() {
  var elements = document.getElementsByClassName("AddAns");
  for(var i=0; i<elements.length; i++) {
    if (i==(elements.length - 1)){
      elements[i].style.display='none';
    };
  }
  var elements = document.getElementsByClassName("AddPic");
  for(var i=0; i<elements.length; i++) {
    if (i==(elements.length - 1)){
      elements[i].style.display='none';
    };
  }
  var elements = document.getElementsByClassName("AddRank");
  for(var i=0; i<elements.length; i++) {
    if (i==(elements.length - 1)){
    elements[i].style.display='none';
    };
  }
}

/* 
used to redirect to new surveys index
Parameters : None.
Returns : None.
Author : Ahmad Bassiouny.
*/
function RedirectTo(){
   window.location.href='http://localhost:3000/new_surveys';
}