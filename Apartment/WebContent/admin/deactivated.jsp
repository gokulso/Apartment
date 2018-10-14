<%@ include file="../user/include_user_header.jsp"%>
 
<html>
<title>Deactivated Resident Accounts</title>
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
									<form name=" deactivatedresidentsform" id="deactivatedresidentsform" action="../user/deactivatedresidents.do" method="post" tmt:validate="true">
									
										<fieldset>
										<legend>Deactivated Resident Accounts</legend>
										<input type="hidden" name="operation"  value="deactivatedresidents" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
										<input type="hidden" name="testcookie" value="1" />
										<table > 
											
											<tr><td colspan="8"></td></tr>
											<tr><td colspan="8"></td></tr>
											
											<tr>
											<td colspan="8">
											<table border="1" width="100%">
											<tr>
											<th>Name</th><th>Phone/Mobile</th><th>Email</th><th>Intercom</th><th>Flat</th><th>Owner/Tenant</th><th>Joined On</th><th>LastLog</th><th>Edit</th>
											</tr>
											<tr><td colspan="8">Accepting Data from database and Displaying  when deactivated residents will be there</td></tr>
											</table>
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
