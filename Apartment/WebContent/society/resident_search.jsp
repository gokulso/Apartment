<%@ include file="../user/include_user_header.jsp"%>
 
<html>
<title>Resident Search</title>
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
									<form name="residentsearchform" id="residentsearchform" action="../society/residentsearch.do" method="post" tmt:validate="true">
									
										<fieldset>
										<legend>Residents List</legend>
										<input type="hidden" name="operation"  value="residentsearch" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
										<input type="hidden" name="testcookie" value="1" />
										<table width="100%"> 
											<tr>
												<td colspan="8">&nbsp;</td>
											</tr>
											<tr bgcolor="Cyan">
												<td colspan="3"><a href="residents_list.jsp">Resident Directory</a>&nbsp;</td>
									            <td colspan="2"><a href="resident_search.jsp">Resident Search</a>&nbsp;</td>
									            <td colspan="3"><a href="association_office.jsp">Association Office</a></td>
									        </tr>
									        
									        <tr>
												<td colspan="6">&nbsp;</td>
											</tr>
											<tr>
									            <td colspan="4" align="right" ><input type="text" name="resident_search" id="resident_search" class="required" tabindex="101"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter a username" tmt:filters="nospaces" /></td>
												<td align="left""><input type="submit" value="Search" class="buttonStandard" tabindex="102"   title="Search"></td>
											</tr>
											<tr><td colspan="7">&nbsp;</td></tr>
											<tr>
												<td ><input type="radio" name="search" id="search">Name</td>
												<td ><input type="radio" name="search" id="search">Flat</td>
												<td ><input type="radio" name="search" id="search">Intercom</td>
												<td ><input type="radio" name="search" id="search">Occupation</td>
												<td ><input type="radio" name="search" id="search">Languages</td>
												<td ><input type="radio" name="search" id="search">Hobbies</td>
												<td ><input type="radio" name="search" id="search">Any</td>
											</tr>
											<tr><td colspan="7">&nbsp;</td></tr>
									        
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
