<%@ include file="../user/include_user_header.jsp"%>
 
<html>
<title>Resident List - Resident Directory - Hobbies/Interests</title>
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
		<TABLE align="center" width="80%" >
			<TR>
				<TD valign="top" width="100%"><!-- Page Data -->
					<div id="data" align="center">
						<table id="tableDataOuter" width="100%" >
								<tr>
									<td colspan="3"><b><%=errorMessage%></b></td>
								</tr>	
								<tr>
								<td width="75%">
									<form name="hobbiesinterestsform" id="hobbiesinterestsform" action="../user/documentrepository.do" method="post" tmt:validate="true">
									
										<fieldset>
										<legend>Hobbies/Interests</legend>
										<input type="hidden" name="operation"  value="hobbiesinterests" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
										<input type="hidden" name="testcookie" value="1" />
										<table width="100%"> 
											<tr>
												<td colspan="8">&nbsp;</td>
											</tr>
											<tr bgcolor="Cyan">
												<td align="right"  colspan="2"><a href="resident_directory.jsp">Resident Directory</a>&nbsp;</td>
									            <td  colspan="2"><a href="resident_search.jsp">Resident Search</a></td>
									            <td colspan="2"><a href="association_office.jsp">Association Office</a></td>
									        </tr>
									        
											<tr><td colspan="3"></td></tr>
											<tr>
												<td colspan="4">Residents of +'"getApartmentName"'</td><td align="right"> Show me</td>
									
												<td><input type="Radio" name="resident_Directory" id="resident_Directory">Resident Directory</td>
											
												<td>
													<input type="Radio" name="hobbies_interests" >Hobbies/Interests</td>
											</tr>
											<tr><td colspan="8"></td></tr>
											<tr><td colspan="8"></td></tr>
											
											<tr><td colspan="8"></td></tr>
											<tr>
											<td>Blocks : </td><td colspan="7" align="left">All Blocks</td>
											</tr>
											<tr><td  colspan="8"></td></tr>
											<tr><td colspan="8" align="left"> Residents from Blocks</td></tr>
											
											<tr>
											<td colspan="8">
											<table border="1">
											<tr>
											<th>Name</th><th>Flat</th><th>Email</th><th>Occupation</th><th>Languages Spoken</th><th>Hobbies</th><th>Homepage/Blog</th><th>Social/Professional Nework</th><th>View</th>
											</tr>
											<tr><td colspan="8">Acceptin Data from database and Displaying  when Resident Directory checked</td></tr>
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
		
	</div>
	<div id="footer" align="center">
		<%@ include file="../common/footer.jsp"%></div>
	
</body>
</html> 
