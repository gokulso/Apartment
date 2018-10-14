<%@ include file="../society/include_jsp_headers.jsp"%></div>

<%@ include file="../common/header.jsp"%></div>

<%@ include file="../common/footer.jsp"%></div>

<%@ include file="../common/footer.jsp"%></div>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%
	String errorMessage = "";
		if(request.getAttribute("errorMessage")!=null){
			 errorMessage = request.getAttribute("errorMessage").toString();
		}		 
		 
		
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Apartment Home</title>
</head>
<body>
<b><%=errorMessage%></b>
</body>
</html>