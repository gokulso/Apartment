<%@ include file="include_login_header.jsp"%>
 
<title>Guest - Login</title>
 
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
%>
<BODY onLoad="document.loginform.user_email.focus()">

<div id="body">
	<div id="header"><%@ include file="../common/header.jsp"%>
	</div>
 
	<div id="content">
		<TABLE align="center">
			<TR>
				<TD valign="top" width="100%"><!-- Page Data -->
					<div id="data" align="center">
						<table id="tableDataOuter" width="100%" >
								<tr>
									<td colspan="3"><b><%=errorMessage%></b></td>
								</tr>	
								<tr>
								<td width="75%">
									<form name="loginform" id="loginform" action="../user/login.do" method="post" tmt:validate="true">
									
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
											
											<tr>
												<td><a href="user_registration.jsp" tabindex="106">Register New User</a></td>
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
