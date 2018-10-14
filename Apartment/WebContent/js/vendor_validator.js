// Declaring required variables
var digits = "0123456789";
// non-digit characters which are allowed in phone numbers
var phoneNumberDelimiters = "()- ";
// characters which are allowed in international phone numbers
// (a leading + is OK)
var validWorldPhoneChars = phoneNumberDelimiters + "+";
// Minimum no of digits in an international phone no.
var minDigitsInIPhoneNumber = 10;

function isInteger(s)
{        
var i;
    for (i = 0; i < s.length; i++)
    {   
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}
function trim(s)
{   var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not a whitespace, append to returnString.
    for (i = 0; i < s.length; i++)
    {   
        // Check that current character isn't whitespace.
        var c = s.charAt(i);
        if (c != " ") returnString += c;
    }
    return returnString;
}
function stripCharsInBag(s, bag)
{   var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not in bag, append to returnString.
    for (i = 0; i < s.length; i++)
    {   
        // Check that current character isn't whitespace.
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}

function checkInternationalPhone(strPhone){
var bracket=3
strPhone=trim(strPhone)
if(strPhone.indexOf("+")>1) return false
if(strPhone.indexOf("-")!=-1)bracket=bracket+1
if(strPhone.indexOf("(")!=-1 && strPhone.indexOf("(")>bracket)return false
var brchr=strPhone.indexOf("(")
if(strPhone.indexOf("(")!=-1 && strPhone.charAt(brchr+2)!=")")return false
if(strPhone.indexOf("(")==-1 && strPhone.indexOf(")")!=-1)return false
s=stripCharsInBag(strPhone,validWorldPhoneChars);
return (isInteger(s) && s.length >= minDigitsInIPhoneNumber);
}


function IsEmpty(aTextField) {
   if ((aTextField.value.length==0) ||
   (aTextField.value==null)) {
      return true;
   }
   else { return false; }
}

function echeck(str) {

		var at="@"
		var dot="."
		var lat=str.indexOf(at)
		var lstr=str.length
		var ldot=str.indexOf(dot)
		if (str.indexOf(at)==-1){
		   alert("Invalid E-mail ID")
		   return false
		}

		if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
		   alert("Invalid E-mail ID")
		   return false
		}

		if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
		    alert("Invalid E-mail ID")
		    return false
		}

		 if (str.indexOf(at,(lat+1))!=-1){
		    alert("Invalid E-mail ID")
		    return false
		 }

		 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
		    alert("Invalid E-mail ID")
		    return false
		 }

		 if (str.indexOf(dot,(lat+2))==-1){
		    alert("Invalid E-mail ID")
		    return false
		 }
		
		 if (str.indexOf(" ")!=-1){
		    alert("Invalid E-mail ID")
		    return false
		 }

 		 return true					
	}

function ValidateForm(){
	var vename=document.vender_info.ven_name
	var service=document.vender_info.ven_service
	var mobile=document.vender_info.ven_mobile
	var phone=document.vender_info.ven_phone
	var email=document.vender_info.ven_email
	var servicerate=document.vender_info.ven_servicerate
	var comment=document.vender_info.ven_comment

	
	
	if (IsEmpty(ven_name)==true){
		alert("Please Enter your Vender Name")
		ven_name.focus()
		return false
	}
	
	if (IsEmpty(ven_service)==true){
		alert("Please Enter your ven_service")
		ven_service.focus()
		return false
	}
	
	if (IsEmpty(ven_mobile)==true){
		alert("Please Enter your ven_mobile")
		ven_mobile.focus()
		return false
	}
	if ((ven_mobile.value==null)||(ven_mobile.value=="")){
		alert("Please Enter your mobile Number")
		ven_mobile.focus()
		return false
	}
	if (checkInternationalPhone(ven_mobile.value)==false){
		alert("Please Enter a Valid mobile Number")
		ven_mobile.value=""
		ven_mobile.focus()
		return false
	}
	if ((ven_phone.value==null)||(ven_phone.value=="")){
		alert("Please Enter your Phone Number")
		ven_phone.focus()
		return false
	}
	if (checkInternationalPhone(ven_phone.value)==false){
		alert("Please Enter a Valid Phone Number")
		ven_phone.value=""
		ven_phone.focus()
		return false
	}
	
	if ((ven_email.value==null)||(ven_email.value=="")){
		alert("Please Enter your Email ID")
		ven_email.focus()
		return false
	}
	if (echeck(ven_email.value)==false){
		ven_email.value=""
		ven_email.focus()
		return false
	}
	if (IsEmpty(ven_servicerate)==true){
		alert("Please Enter amount")
		website.focus()
		return false
	}
	
	if (IsEmpty(ven_comment)==true){
		alert("Please Enter your comment")
		ven_comment.focus()
		return false
	}
	return true
 }
