

/**
 * @brief  Handles collapsing and expanding fields.
 * @authors Ahmed H. Ismail
 * @param  element, this element when clicked.
 * @return void
 */
function collapse (element) {
  var checkBox = element.firstElementChild.firstElementChild;
  if(checkBox != null) {
    checkBox.checked = !checkBox.checked; // toggle
    var collapsableDiv = element.firstElementChild.nextElementSibling;
    if(collapsableDiv != null) {
      if(checkBox.checked) {
        // make visible
        collapsableDiv.style.visibility="visible";
      }else {
        collapsableDiv.style.visibility="hidden";
      }
    }else {
      console.log("Error in collapse function could not find collapsableDiv");
    }
    console.log(checkBox);
  }else {
    console.log("Error in collapse function could not find checkBox");
  }
}


function verify_child (childUserName) {
  // body...
}

function reject_child (childUserName) {
  // body...
}