<%@ include file="../user/include_user_header.jsp"%>
 
<html>
<title>Unapproved Residents</title>
<head>
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
<BODY>
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
									<form name=" residentslistform" id="residentslistform" action="../user/documentrepository.do" method="post" tmt:validate="true">
									
										<fieldset>
										<legend>Unapproved Residents</legend>
										<input type="hidden" name="operation"  value="redidentdirectory" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
										<input type="hidden" name="testcookie" value="1" />
										<table > 
											
											<tr><td colspan="8"></td></tr>
											<tr><td colspan="8"></td></tr>
											
											<tr>
											<td colspan="8">
											<table border="1" width="100%">
											<tr>
											<th>Name</th><th>Phone/Mobile</th><th>Email</th><th>Intercom</th><th>Block</th><th>Flat</th><th>Owner/Tenant</th><th>Joined On</th><th>Approve</th><th>Edit</th><th>Delete</th>
											</tr>
											<tr><td colspan="8">Accepting Data from database and Displaying  when unapproved users will be there</td></tr>
											</table>
											</td>
											</tr>
										</table>
										<table align="right">
											<tr>
												<td></td>
												<td>
													<input type="submit" name="approveselectedusers" align="right" class="buttonStandard" tabindex="122"  value=" Approve Selected Users " title="Login">
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
