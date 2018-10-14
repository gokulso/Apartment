<%@ include file="../user/include_user_header.jsp"%>
 
<html>
<title>Document Repository</title>
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
									<form name="documentrepositoryform" id="documentrepositoryform" action="../user/documentrepository.do" method="post" tmt:validate="true">
									
										<fieldset>
										<legend>Document Repository</legend>
										<input type="hidden" name="operation"  value="documentrepository" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
										<input type="hidden" name="testcookie" value="1" />
										<table> 
											<tr>
												<td colspan="2">&nbsp;</td>
											</tr>
											<tr>
												<td>&nbsp; </td>
												<td align="right"><input type="text" name="document_repository" id="document_repository" class="required" tabindex="101"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter a any following files" tmt:filters="nospaces" /></td>
											
												<td>
													<input type="submit" name="search_repository" class="buttonStandard" tabindex="102"  value="Search"   title="Document Repository">																						 
											</td>
											</tr>
											
											<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
											
											<tr>
												<td> &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
									
												<td>
												   <input type="Radio" name="search" id="search" class="required" tabindex="103">File name
												   <input type="Radio" name="search" id="search" class="required" tabindex="104">Folder
												   <input type="Radio" name="search" id="search" class="required" tabindex="105" >Discription
												   <input type="Radio" name="search" id="search" class="required" tabindex="106" >Any
												</td>
												</tr>
												<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
												<tr>												
												<td> &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
												<td>Document uploaded by Assication</td>
												</tr>
												<tr>
												<td> &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
												<td>Showing file, folder here</td>
												</tr>
											<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
											<tr>
												<td> &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
												<td>Document uploaded by Residents</td>
												</tr>
												<tr>
												<td> &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
												<td> Showing file, folder here</td>
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
