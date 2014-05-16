
function remove_fields(link) {
        $(link).prevAll("input[type=hidden]").first().val("1");
        $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().before(content.replace(regexp, new_id));
}

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


function submit()
{
  var SelectedValue = [];
  var name = 0;
var radios = document.getElementsByTagName("input");
for(var i=0; i<radios.length; i++) {
  if(radios[i].checked)
      {
        var valueSelected = radios[i].value;
        SelectedValue.push(valueSelected)
      }
}
var url = ['http://' + location.host, 'new_surveys', 'submit'].join('/');
var callback = function(responseJSON, xhr) {
    }
create_ajax_request(url, {arrays: SelectedValue}, callback);
}

function showValue(newValue)
{
  document.getElementById("range").innerHTML=newValue;
}

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
function enableRank() {
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
  var elements = document.getElementsByClassName("AddRange");
      for(var i=0; i<elements.length; i++) {
        if (i==(elements.length - 1)){
          elements[i].style.display='none';
        };
  }
}