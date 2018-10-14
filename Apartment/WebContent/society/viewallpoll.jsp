<%@ include file="../user/include_user_header.jsp"%>
 
<html>
<title>View Polls</title>
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
										<legend>View Polls</legend>
										<input type="hidden" name="operation"  value="redidentdirectory" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
										<input type="hidden" name="testcookie" value="1" />

										<table > 
											<tr><td colspan="8"></td></tr>
											<tr><td colspan="8"></td></tr>
											<tr><td colspan="8" align="left"> Open Polls</td></tr>
											<tr>
											<td colspan="8">
											<table border="1" width="100%">
											<tr>
											<th>Topic</th><th>Started By</th><th>Response Count</th><th>Closing Date</th><th>View</th>
											</tr>
											<tr><td colspan="8">Accepting Data from database and Displaying  when there will be open polls available</td></tr>
										</table>

										<table > 
											<tr><td colspan="8"></td></tr>
											<tr><td colspan="8"></td></tr>
											<tr><td colspan="8" align="left"> Closed Polls</td></tr>
											<tr>
											<td colspan="8">
											<table border="1" width="100%">
											<tr>
											<th>Topic</th><th>Started By</th><th>Response Count</th><th>Date Closed</th><th>View</th>
											</tr>
											<tr><td colspan="8">Accepting Data from database and Displaying  when there will be closed polls available</td></tr>
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
