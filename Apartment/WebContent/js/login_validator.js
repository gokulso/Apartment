
function IsEmpty(aTextField)
 {
   if ((aTextField.value.length==0) || (aTextField.value==null)) 
   {
      return true;
   }
   else { return false; }
}

function ValidateForm()
{
	var name=document.loginform.user_login
	var password=document.loginform.user_password
	
	
	if (IsEmpty(name)==true)
	{
		alert("Please Enter your Username")
		name.focus()
		return false
	}
	
	if (IsEmpty(password)==true)
	{
		alert("Please Enter your Password")
		password.focus()
		return false
	} 
	return true
 }
