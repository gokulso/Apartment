<%@ include file="../user/include_user_header.jsp"%>
 
<html>
<title>Manage Users</title>
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
									<form name="manageusersform" id="manageusersform" action="../apartment/manageusers.do" method="post" tmt:validate="true">
									
										<fieldset>
										<legend>Manage Users</legend>
										<input type="hidden" name="operation"  value="manageusers" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
										<input type="hidden" name="testcookie" value="1" />

										<table> 
											<tr>
												<td colspan="5">&nbsp;</td>
											</tr>
											<tr>
												<td><a href="unapproved.jsp"> Unapproved </a>&nbsp;</td>
												<td>&nbsp;&nbsp;&nbsp;</td>
												<td><a href="adddata.jsp"> Add Data </a>&nbsp;</td>
												<td>&nbsp;&nbsp;&nbsp;</td>
												<td><a href="approvedusers.jsp"> Approved Users </a>&nbsp;</td>
												<td>&nbsp;&nbsp;&nbsp;</td>
												<td><a href="accesscontrol.jsp"> Access Control </a>&nbsp;</td>
												<td>&nbsp;&nbsp;&nbsp;</td>
												<td><a href="statistics.jsp"> Statistics </a>&nbsp;</td>
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
