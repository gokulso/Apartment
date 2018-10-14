<%@ include file="../user/include_user_header.jsp"%>
 
<html>
<title>Forum Archive</title>
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
										<legend>Forum Archive</legend>
										<input type="hidden" name="operation"  value="redidentdirectory" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
										<input type="hidden" name="testcookie" value="1" />
										<table > 
											
											<tr><td colspan="8"></td></tr>
											<tr><td colspan="8"></td></tr>
											<tr><td>Archive of topics beyond the last 1 month.
											<tr><td colspan="8" align="left">Forum > Page 1</td></tr>
											
											<tr>
											<td colspan="8">
											<table border="1" width="100%">
											<tr>
											<th>Topic</th><th>First Post</th><th>Last Post</th><th>Replies Count</th>
											</tr>
											<tr><td colspan="8">Accepting Data from database and Displaying  when there will be different topics</td></tr>
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
