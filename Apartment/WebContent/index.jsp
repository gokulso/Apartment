<%@ include file="../user/include_login_header.jsp"%>
<%-- <%@ page import="com.rpm.am.util.ApartmentUtil,java.util.Hashtable,java.sql.*;"%> --%>
 
<html>
<title>Home Page</title>
<head>
<script language="javascript">
function getSocieties()
{
	document.homepage.action="index.jsp";
	document.homepage.submit();
}

function registerSociety()
{
	document.homepage.action="society/society_registration.jsp";
	document.homepage.cityname.value=document.homepage.cities.options[document.homepage.cities.selectedIndex].text;
 	document.homepage.submit();

}
function registerUser()
{
	document.homepage.action="user/user_registration.jsp";
	document.homepage.submit();
}
</script>
</head>
								 
<%
	String errorMessage = "";
		if(request.getAttribute("errorMessage")!=null)
		{
			 errorMessage = request.getAttribute("errorMessage").toString();
		}		 
		
	String redirect_to = "";
	if(request.getAttribute("redirect_to")!=null)
		{
			redirect_to = request.getAttribute("redirect_to").toString();
		}
	
	String selectedCity = "";
	if(request.getParameter("cities")!=null)
	{
		selectedCity= request.getParameter("cities").toString();
		System.out.println("selected city "+selectedCity);
	}
	else
		selectedCity="1";
%>
<BODY onLoad="document.homepage.cities.focus()">

<div id="body">
	<div id="header"><%@ include file="../common/header.jsp"%>
	</div>
 
	<div id="content">
		<TABLE align="center">
			<TR>
				<TD valign="top" width="100%"><!-- Page Data -->
					<div id="data" align="center">
					<DIV ID="calendarPopupDiv" STYLE="position:absolute;visibility:hidden;background-color:white;layer-background-color:white;"></DIV>
						<table id="tableDataOuter" width="100%">
								<tr>
									<td colspan="3"><b><%=errorMessage%></b></td>
								</tr>	
								<tr> 
								<td width="100%">
									<form name="homepage" id="homepage" action="society/society_registration.jsp" method="post" tmt:validate="true">
									
										<fieldset>
										<legend>Home Page</legend>
										<input type="hidden" name="operation"  value="login" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
										<input type="hidden" name="testcookie" value="1" />
										<table width="100%" height="100%"> 
											<tr>
												<td colspan="2">&nbsp;</td>
											</tr>
												
												<tr>
													<td align="right">City: </td>
													<td align="left">
														<select onchange="javascript:getSocieties();" id="cities" name="cities" class="required" tabindex="101"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select city" >
															<option value="-1" >Select City</option>
															<% 
																Iterator citylist  = ApartmentUtil.getEntity("uspGetCity");
																while (citylist.hasNext())
																{
																    Map.Entry me=(Map.Entry) citylist.next();
															%>
																	<option value="<%=me.getKey()%>" <% if ((selectedCity.equals(((Integer)me.getKey()).toString())) ) { %>Selected  <% } %>><%=me.getValue()%></option>
															<%
																}
															%>
														</select>
														<input type="hidden" id="cityname" name="cityname" value="" />
													</td>
													
													
													
													<td align="right">Society: </td>
													<td align="left">												
														<select id="societies" name="societies" class="required" tabindex="101"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select society name" >
															<option value="" >Select Society Name </option>
															<% 
																Iterator societylist  = ApartmentUtil.getEntity("uspGetSocietyList 0," + selectedCity);
																while (societylist.hasNext()) 
																{
																    Map.Entry me=(Map.Entry) societylist.next();
																    System.out.println(" Data "+me.getKey() + ":"+ me.getValue());
															%>
																	<option value="<%=me.getKey()%>" ><%=me.getValue()%></option>
															<% 
																}
														 	%>												
														</select>
													</td>
												</tr>
												
											<tr><td>&nbsp;</td></tr>
											
											<tr>
												<td colspan="2" align="right">Do not find your society click here to register your society
												<input type="button" name="regsociety" onclick="javascript:registerSociety();" class="buttonStandard" tabindex="104"  value=" Register your society "   title="Login"></td>
												
												<td>&nbsp;</td>
												
												<td colspan="2" align="right">If your society already present click here to register yourself
												<input type="button" onclick="javascript:registerUser();" name="reguser" class="buttonStandard" tabindex="104"  value=" Register yourself "   title="Login"></td><td colsapn="2">&nbsp;</td>
											</tr>
											
										</table>
										</fieldset>
									</form>
								</td>
								
								<td width="100%">
									<form name="loginform" id="loginform" action="user/login.do" method="post" tmt:validate="true">
									
										<fieldset>
										<legend>Login</legend>
										<input type="hidden" name="operation"  value="login" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
										<input type="hidden" name="testcookie" value="1" />
										<table> 
											<tr>
												<td colspan="2">&nbsp;</td>
											</tr>
											
											<tr>
												<td align="right">Username:</td>
												<td align="left"><input type="text" name="user_email" id="user_email" class="required" tabindex="101"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter a username" tmt:filters="nospaces" /></td>
											</tr>
											
											<tr>
												<td align="right">Password:</td>
												<td align="left"><input type="password" name="user_password" id="user_password" tabindex="102"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please enter a password" tmt:filters="nospaces" /></td>
											</tr>
											
											<tr>
												<td align="right"></td>
												<td align="left"><p class="forgetmenot"><label><input type="checkbox" name="rememberme" id="rememberme" tabindex="103" value="forever" />Remember</label></p></td>
											</tr>
											
											<tr>
												<td></td>
												<td>
													<input type="submit" name="Login" class="buttonStandard" tabindex="104"  value=" Login "   title="Login">
													<input type="Reset" name="Reset" class="buttonStandard" tabindex="105"  value=" Reset " title="Reset">
												</td>
											</tr>
											
										</table>
										</fieldset>
									</form>
								</td>
							</tr>
						</table>
					</div>
				</TD>
				
			</TR>
		</TABLE>
	</div>
	<div id="footer" align="center">
		<%@ include file="../common/footer.jsp"%></div>
	</div>
</body>
</html> 
