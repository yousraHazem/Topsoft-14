/*
This function used in photo validation in case of uploading from 
local machine.
Parameters : None.
Returns : None.
Approach : If the image is uploaded from personal computer,
The value of the field contains the remote image will be cleared.
Author : Hussein M. Eloy
*/
function doLoc() {
    document.getElementById("rem").value = '';
}

/*
This function used in photo validation in case of uploading from 
remote url.
Parameters : None.
Returns : None.
Approach : If the image is uploaded from remote url, 
The value of the field contains the local image will be cleared.
Author : Hussein M. Eloy
*/
function doRem() {
    document.getElementById("loc").value = '';
}