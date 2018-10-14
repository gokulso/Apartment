<%@page import="com.rpm.am.formbeans.UserBean"%>
<%@ include file="login-template.jsp"%> 

<%

	String user_name = request.getParameter("user_name");
	String user_wing = request.getParameter("user_wing");
	String user_flatnumber = request.getParameter("user_flatnumber");
	String user_mobile = request.getParameter("user_mobile");
	String user_phone = request.getParameter("user_phone");
	String user_email = request.getParameter("user_email");
	String user_password = request.getParameter("user_password");
	String user_confirmpassword = request.getParameter("user_confirmpassword");
	String user_jmonth = request.getParameter("user_jmonth");
	String user_jday = request.getParameter("user_jday");
	String user_jyear = request.getParameter("user_jyear");
	String user_intercom = request.getParameter("user_intercom");
	String user_staying = request.getParameter("user_staying");
		
	UserBean obj = new UserBean(request);
	
%>