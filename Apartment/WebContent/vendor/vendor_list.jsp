<%@ include file="../user/include_user_header.jsp"%>
 
<html>
<title>Vendor Search</title>
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
									<form name="residentsearchform" id="residentsearchform" action="../user/residentsearch.do" method="post" tmt:validate="true">
									
										<fieldset>
										<legend>Vendor Search</legend>
										<input type="hidden" name="operation"  value="residentsearch" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
										<input type="hidden" name="testcookie" value="1" />
										<table> 
											<tr>
												<td colspan="0">&nbsp;</td>
											</tr>
											<tr>
												<td colspan="0">&nbsp;</td>
									            <td colspan="4" align="right" ><input type="text" name="resident_search" id="resident_search" class="required" tabindex="101"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter a username" tmt:filters="nospaces" /></td>
												<td align="left""><input type="submit" value="Search" class="buttonStandard" tabindex="102"   title="Search"></td>
											</tr>
											<tr><td colspan="7">&nbsp;</td></tr>
											<tr>
												<td ><input type="radio" name="search" id="search">Name</td>
												<td ><input type="radio" name="search" id="search">Service</td>
												<td ><input type="radio" name="search" id="search">Phone</td>
												<td ><input type="radio" name="search" id="search">Email</td>
												<td ><input type="radio" name="search" id="search">Comments</td>
												<td ><input type="radio" name="search" id="search">Any</td>
											</tr>
											<tr><td colspan="7">&nbsp;</td></tr>
											
											<tr><td colspan="8"></td></tr>
											<tr><td colspan="8"></td></tr>
											
											<tr><td colspan="8" align="left"> Vendors List </td></tr>
											
											<tr>
											<td colspan="8">
											<table border="1" width="100%">
											<tr>
											<th>Name</th><th>Rating</th><th>Service</th><th>Phone</th><th>Email</th><th>Comments</th><th>Added By</th><th>Edit</th>
											</tr>
											<tr><td colspan="8">Accepting Data from database and Displaying  when there will be some registered vendors.</td></tr>
											</table>
											</td>
											</tr>
										</table>
										<table align="right">
											<tr>
												<td></td>
												<td>
													<input type="submit" name="addvendor" align="right" class="buttonStandard" tabindex="122"  value=" Add Vendor " title="Login">
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
