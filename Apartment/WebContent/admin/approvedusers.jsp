
<%@ include file="../user/include_user_header.jsp"%>
 
<html>
<title>Approved Residents</title>
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
									<form name="approvedresidentsform" id="approvedresidentsform" action="../user/approvedresidents.do" method="post" tmt:validate="true">
									
										<fieldset>
										<legend>Approved Residents</legend>
										<input type="hidden" name="operation"  value="approvedresidents" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
										<input type="hidden" name="testcookie" value="1" />
										<table> 
											
											<tr>
												<td colspan="0">&nbsp;</td>
									            <td colspan="9" align="right" ><input type="text" name="approvedresidents_search" id="approvedresidents_search" class="required" tabindex="101"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter a name to search" tmt:filters="nospaces" /></td>
												<td align="left""><input type="submit" value="Search" class="buttonStandard" tabindex="102"   title="Search"></td>
											</tr>
											<tr><td colspan="9">&nbsp;</td></tr>
											<tr>
												<td ><input type="radio" name="search" id="search">Name</td>
												<td ><input type="radio" name="search" id="search">Phone</td>
												<td ><input type="radio" name="search" id="search">Email</td>
												<td ><input type="radio" name="search" id="search">Intercom</td>
												<td ><input type="radio" name="search" id="search">Flat</td>
												<td ><input type="radio" name="search" id="search">Vehicle</td>
												<td ><input type="radio" name="search" id="search">Family</td>
												<td ><input type="radio" name="search" id="search">Any</td>
											</tr>
											<tr><td colspan="9">&nbsp;</td></tr>
											<tr>
									            <td colspan="9" align="right" ><input type="text" name="search_user_history" id="search_user_history" class="required" tabindex="101"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter a name to search" tmt:filters="nospaces" /></td>
												<td align="left""><input type="submit" value="Search User History" class="buttonStandard" tabindex="102"   title="Search"></td>
											</tr>
											<tr><td colspan="9">&nbsp;</td></tr>
											
											<tr>
											<td colspan="12">
											<table border="1" width="100%">
											<tr>
											<th>Flat</th><th>Name</th><th>Phone/Mobile</th><th>Email</th><th>Intercom</th><th>User Status</th><th>Lives Here</th><th>Joined On</th><th>LastLog</th><th>Assoc.Member</th><th>SMS/Email</th><th>Edit</th>
											</tr>
											<tr><td colspan="8">Accepting Data from database and Displaying  when Residents will be there </td></tr>
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
