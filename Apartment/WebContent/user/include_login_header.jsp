<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<%@ include file="../common/global_variables.jsp"%>
<%@page session="true"
	import="com.rpm.am.formbeans.*,com.rpm.am.constants.*,com.rpm.am.util.*,java.util.*,com.rpm.am.user.*,com.rpm.am.common.*"%>
  
<html  xmlns:tmt="http://www.massimocorner.com/libraries/" xmlns:csi="http://www.massimocorner.com/libraries/csi" xmlns="http://www.w3.org/1999/xhtml">
<%String contextPath = request.getContextPath();  
System.out.println("path==" +contextPath);%>
<HEAD>
 
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/base.css" /> 
<link type="text/css" rel="stylesheet" href="<%=contextPath%>/css/tmt_style.css" />
<link type="text/css" rel="stylesheet" href="<%=contextPath%>/css/tmt_style_form.css" />

<script type="text/javascript" src="<%=contextPath%>/js/tmt_core.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/tmt_form.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/tmt_validator.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/user_validator.js"></script> 
<script type="text/javascript" src="<%=contextPath%>/js/apt_validator.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/vendor_validator.js"></script> 
<script type="text/javascript" src="<%=contextPath%>/js/calendarPopup.js"></script>
<SCRIPT LANGUAGE="JavaScript">document.write(getCalendarStyles());</SCRIPT>



