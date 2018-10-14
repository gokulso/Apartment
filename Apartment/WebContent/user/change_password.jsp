 <%-- <%@ include file="template_jsp_header_user.jsp"%>  --%>  
 <%@ include file="include_user_header.jsp"%>

<TITLE>Change Password</TITLE>
</HEAD>
								 
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

<BODY>
<div id="body">
	<div id="header"><%@ include file="../common/header.jsp"%>	</div>

	<%-- <%@ include file="../common/menu.jsp"%> --%> 
	
	<div id="content">
		<TABLE align="center">
			<TR>
				<TD valign="top" width="100%"><!-- Page Data -->
					<div id="data" align="center">
						<table id="tableDataOuter" width="100%">
							<tr>
								<td colspan="3"><b><%=errorMessage%></b></td>
							</tr>
							<tr>
								<td width="75%">
									<form name="changePasswordform" id="changePasswordform" action="../user/changePassword.do" method="post" tmt:validate="true">
																									
										<fieldset>
										<legend>Change Password</legend>
										<input type="hidden" name="operation"  value="changePassword" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
										<input type="hidden" name="testcookie" value="1" />
										<table>
											<tr>
												<td colspan="2"><b><%=errorMessage%></b></td>
											</tr>
											<tr>
												<td colspan="2">&nbsp;</td>
											</tr>
											<tr>
												<td align="right">Username</td>								
												<td align="left"><input type="text" name="user_email" id="user_email" class="required" tabindex="1"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter a login name" tmt:filters="nospaces" /></td>
											</tr>
											<tr>
												<td align="right">Current Password</td>
												<td align="left"><input type="password" name="user_password" id="user_password" tabindex="2"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please enter current password" tmt:filters="nospaces" /></td>
											</tr>
											
											<tr>
												<td align="right">New Password</td>
												<td align="left"><input type="password" name="user_newpassword" id="user_newpassword" class="required" tabindex="3" tmt:required="true" tmt:errorclass="invalid" /></td>
											</tr>
											<tr>
												<td align="right">Repeat New Password</td>
												<td align="left"><input type="password" name="user_newrepeatpassword" id="user_newrepeatpassword" class="required" tabindex="4" tmt:required="true" tmt:errorclass="invalid" tmt:equalto="user_newpassword" tmt:message="Please insert two matching new passwords" /></td>
											</tr> 
											<tr>
												<td></td>
												<td>
													<input type="submit" name="Change Password" class="buttonStandard" tabindex="5"  value=" Change Password "   title="Change Password">
													<input type="Reset" name="Reset" class="buttonStandard" tabindex="6"  value=" Reset " title="Reset"> 
												</td>
											</tr>
										</table>
										</fieldset>
									</form>
								</td>
								<td>&nbsp;&nbsp;&nbsp;</td>
								<td valign="top">
								<%-- <%@ include file="sideLinks.jsp"%>  --%> 
								</td>
							</tr>
						</table>
					</div>
				</TD>
				<TD valign="top">
					<div id="sideBar">
				<%--	<%@ include file="../common/Sidebar_User.jsp"%></div> --%> 
				</TD>
			</TR>
		</TABLE>
	</div>
	<div id="footer" align="center">
		<%-- <%@ include file="../common/footer_Home.jsp"%></div> --%> 
	</div>
</body>
</html> 
