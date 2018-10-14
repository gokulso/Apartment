<%@ include file="../user/include_user_header.jsp"%>
 
<html>
<title>Resident List - Association Office</title>
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
								
								<td width="75%">
									<form name="associationofficeform" id="associationofficeform" action="../society/associationoffice.do" method="post" tmt:validate="true">
									
										<fieldset>
										<legend>Association Office</legend>
										<input type="hidden" name="operation"  value="associationoffice" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
										<input type="hidden" name="testcookie" value="1" />
										
										<table width="100%">
										<tr>
												<td colspan="3">&nbsp;</td>
											</tr>
											<tr bgcolor="Cyan">
												<td><a href="residents_list.jsp">Resident Directory</a></td>
									            <td><a href="resident_search.jsp">Resident Search</a></td>
									            <td><a href="association_office.jsp">Association Office</a></td>
									        </tr>
										</table>
										
										<table border="0"> 
											
											<tr> <td colspan="8" >&nbsp;</td></tr>
											<tr> <td colspan="8" align="left">getApartmenName Management Committee</td></tr>
											<tr> <td colspan="8" >&nbsp;</td></tr>
											<tr><td><table border="1" width="100%">
											<tr>
											<th>Designation</th><th>Responsibilities</th><th>Name</th><th>Phone/Mob</th><th>Email</th><th>Intercom</th><th>AptNo</th><th>View</th>
											</tr>
											<tr><td colspan="8">Accepting Data from database and Displaying  when in Resident List clicked on Association Office</td></tr>											
										    <tr> <td colspan="8" >&nbsp;</td></tr>
										    </table></td></tr>
										</table>
										<table>
										<tr><td><input type="Submit" value="Email Management Committee"></td></tr>
										</table>
										
										<table > 
											<tr> <td colspan="8" >&nbsp;</td></tr>
											<tr> <td colspan="8" align="left">getApartmenName Book Moderator</td></tr>
											<tr> <td colspan="8" >&nbsp;</td></tr>
											
											<tr>
											<td>
											<tr><td colspan="8"><table border="1" width="100%">
											<tr>
											<th>Name</th><th>Phone/Mob</th><th>Email</th><th>Intercom</th><th>AptNo</th><th>View</th>
											</tr>
											<tr><td colspan="8">Accepting Data from database and Displaying  when in Resident List clicked on Association Office</td></tr>											
										    <tr> <td colspan="8" >&nbsp;</td></tr>
										     </table></td></tr>
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
