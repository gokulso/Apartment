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
        if (((c < "0") || (c > "9"))) 
          return false;
    }
    // All characters are numbers.
    return true;
}

function trim(s)
{   
    var i;
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

/*
function isCity(city)
{
	 for (i = 0; i < s.length; i++)
	    {   
	        // Check that current character isn't whitespace.
	       
	        if (city.charAt(i)) 
	    }
	    return true;
}
*/

function checkInternationalPhone(strPhone)
{
 var bracket=3
 strPhone=trim(strPhone)
 if(strPhone.indexOf("+")>1)   return false

            if(strPhone.indexOf("-")!=-1)  bracket=bracket+1

 if(strPhone.indexOf("(")!=-1 && strPhone.indexOf("(")>bracket) return false

 var brchr=strPhone.indexOf("(")

 if(strPhone.indexOf("(")!=-1 && strPhone.charAt(brchr+2)!=")")return false

 if(strPhone.indexOf("(")==-1 && strPhone.indexOf(")")!=-1)return false
 s=stripCharsInBag(strPhone,validWorldPhoneChars);
 return (isInteger(s) && s.length >= minDigitsInIPhoneNumber);
}


function IsEmpty(aTextField)
 {
   if ((aTextField.value.length==0) || (aTextField.value==null)) 
   {
      return true;
   }
   else { return false; }
}






function echeck(str) 
{

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



function ValidateForm()
{
	var name=document.aptform.apt_name
	var address1=document.aptform.apt_address1
	var city=document.aptform.apt_city
	var mobile=document.aptform.apt_mobile
    var phone=document.aptform.apt_phone
	var emailID=document.aptform.apt_email
	var password=document.aptform.apt_password
	var password_confirmation=document.aptform.apt_confirmpassword
	var website=document.aptform.apt_website
	
	
	if (IsEmpty(name)==true){
		alert("Please Enter your Apartment Name")
		name.focus()
		return false
	}

	if (IsEmpty(city)==true){
		alert("Please Enter your City")
		city.focus()
		return false
	}
	
	if (IsEmpty(address1)==true){
		alert("Please Enter your address")
		address1.focus()
		return false
	}
	
	if ((mobile.value==null)||(mobile.value=="")){
		alert("Please Enter your mobile Number")
		mobile.focus()
		return false
	}
	
	if (checkInternationalPhone(mobile.value)==false){
		alert("Please Enter a Valid mobile Number")
		mobile.value=""
		mobile.focus()
		return false
	}
	
	if ((phone.value==null)||(phone.value=="")){
		alert("Please Enter your Phone Number")
		phone.focus()
		return false
	}
	if (checkInternationalPhone(phone.value)==false){
		alert("Please Enter a Valid Phone Number")
		phone.value=""
		phone.focus()
		return false
	}
	
	if ((emailID.value==null)||(emailID.value==""))
	{
		alert("Please Enter your Email ID")
		emailID.focus()
		return false
	}
	if (echeck(emailID.value)==false){
		emailID.value=""
		emailID.focus()
		return false
	}
	
	if (IsEmpty(password)==true){
		alert("Please Enter your password")
		password.focus()
		return false
	} 
	if (password.value.length <5 || password.value.length >8 )
	{
		alert("Please  password length must be within 5 to 8")
		password.focus()
		return false
	}
	
	if (IsEmpty(password_confirmation)==true){
		alert("Please Enter your Password Confirmation")
		password_confirmation.focus()
		return false
	}
	if(password.value!=password_confirmation.value)
	{
	     alert("Please Both Password must match")
		password.focus()
		return false
	}	
	return true
 }
