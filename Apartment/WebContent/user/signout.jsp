<%@ include file="include_login_header.jsp"%>

<TITLE>Portal Seven | Sign Out</TITLE>
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

	<%@ include file="../common/menu.jsp"%>
	<div id="content">
		<TABLE>
			<TR>
				<TD valign="top" width="640"><!-- Page Data -->
					<div id="data" align="center">
						<table id="tableDataOuter" width="100%">
							<tr>
								<td width="75%" valign="top" >
									<form name="signoutform" id="signoutform" action="../user/login.do" method="post" tmt:validate="true">
									
										<fieldset>
										<legend>Signout</legend>
										<input type="hidden" name="operation"  value="signout" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
											<input type="hidden" name="testcookie" value="1" />
										<table>
											<tr>
												<td> 
													&nbsp;&nbsp;&nbsp;
												</td>
											</tr>
											<tr>
												<td> 
													&nbsp;&nbsp;&nbsp;
												</td>
											</tr>
											<tr>
												<td ><b><%=errorMessage%></b></td>
											</tr>
											<tr>
												<td ><b>Click on the button to sign out of the session.</b></td>
											</tr>
											<tr>
												<td>  
									
													<input type="submit" name="Sign out !" class="buttonStandard" tabindex="10"  value=" Sign out ! "   title="Sign out !">
													 
												</td>
											</tr>
											<tr>
												<td> 
													&nbsp;&nbsp;&nbsp;
												</td>
											</tr>
											<tr>
												<td> 
													&nbsp;&nbsp;&nbsp;
												</td>
											</tr>
										</table>
										</fieldset>
									</form>
								</td>
								<td width="5%">&nbsp;&nbsp;&nbsp;</td>
								<td valign="top"  width="20%">
									<%@ include file="sideLinks.jsp"%> 
								</td>
							</tr>
						</table>
					</div>
				</TD>
				<TD valign="top">
					<div id="sideBar"><%@ include
						file="../common/Sidebar_User.jsp"%></div>
				</TD>
			</TR>
		</TABLE>
	</div>
	<div id="footer" align="center">
		< %@ include file="../common/footer_Home.jsp"%></div>
	</div>
</body>
</html> 
