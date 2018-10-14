<%-- <%@ include file="template_jsp_header_user.jsp"%>--%>
 
<TITLE>Retrieve Password </TITLE>
</HEAD>
								 
<%
	String errorMessage = "";
		if(request.getAttribute("errorMessage")!=null){
			 errorMessage = request.getAttribute("errorMessage").toString();
		}		 
		
	String redirect_to = "";
		if(request.getAttribute("redirect_to")!=null){
			redirect_to = request.getAttribute("redirect_to").toString();
		}		
%>
<BODY>
<div id="body">
	<div id="header"><%@ include file="../common/header.jsp"%>
	</div>

	<%-- <%@ include file="../common/menu.jsp"%>--%>
	<div id="content">
		<TABLE>
			<TR>
				<TD valign="top" width="640"><!-- Page Data -->
					<div id="data" align="center">
						<table id="tableDataOuter" width="100%">
								<tr>
									<td colspan="3"><b><%=errorMessage%></b></td>
								</tr>	
								
							<tr>
								<td>
									<form name="lostpasswordform" id="lostpasswordform" action="../user/lostpassword.do" method="post" tmt:validate="true">
									<fieldset>
										<legend>Forgot Password</legend>
										<input type="hidden" name="operation"  value="resendPassword" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
										<input type="hidden" name="testcookie" value="1" />
										<table>
												<tr>
													<td colspan="2">
														<p class="message"> 
															Please enter your e-mail address. You will receive the password via e-mail. 
														</p>
													</td>
												</tr>
												<tr>
												<td>Email</td>									
												<td>
													<input type="text" name="user_email" class="required"   tmt:required="true"  tabindex="40" tmt:errorclass="invalid" tmt:message="Please insert a valid email" tmt:pattern="email" /></td>
												</tr>												
												<tr>
													<td></td>
													<td>
														<input type="submit" name="submit" class="buttonStandard" tabindex="120"  value=" Get Password " title=" Get Password ">
														 
												</tr>										
												<tr>
													<td colspan="2">&nbsp;</td>
												</tr>
												<tr>
													<td colspan="2">&nbsp;</td>
												</tr>
										</table>
									</fieldset>
									</form>
								</td>								
							</tr>
							
						</table>
					</div>
				</TD>
				<TD valign="top">
					<%-- <div id="sideBar"><%@ include file="../common/Sidebar_User.jsp"%></div>--%>
				</TD>
			</TR>
		</TABLE>
	</div>
	<div id="footer" align="center">
		<%-- <%@ include file="../common/footer_Home.jsp"%></div> --%>
	</div>
</body>
</html> 
