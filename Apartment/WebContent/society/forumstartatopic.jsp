<%@ include file="../user/include_user_header.jsp"%>
 
<html>
<title>Forum Start a Topic</title>
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
									<form name="forumform" id="forumform" action="../apartment/forum.do" method="post" tmt:validate="true">
									
										<fieldset>
										<legend>Forum</legend>
										<input type="hidden" name="operation"  value="forum" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
										<input type="hidden" name="testcookie" value="1" />
										<table> 
											<tr>
												<td colspan="2">&nbsp;</td>
											</tr>
											<tr>
												<td>Start a New Topic &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
									
												<td><input type="text" name="forum_starttopic" id="forum_starttopic" class="required" tabindex="101"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter a username" tmt:filters="nospaces" /></td>
											</tr>
											
											<tr>
												<td>This message should be visible to : &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
												<td>
													<label>
														<input type="radio" name="forum_visibleto" tabindex="102" value="1" />All Residents 
														<input type="radio" name="forum_visibleto" tabindex="103" value="0"/>Owners Only
													</label>
												</td>
											</tr>
											
											<tr>
												<td>Description &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
												<td><textarea type="text" name="forum_description" id="forum_description" tabindex="104"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please enter a password" tmt:filters="nospaces" ></textarea></td>
											</tr>
											
											<tr>
												<td>Attachment 1 &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
									
												<td><input type="file" name="forum_attachment1" id="forum_attachment1" class="required" tabindex="105"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter a username" tmt:filters="nospaces" /></td>
											</tr>
											<tr>
												<td>Attachment 2 &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
									
												<td><input type="file" name="forum_attachment2" id="forum_attachment2" class="required" tabindex="106"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter a username" tmt:filters="nospaces" /></td>
																				
											</tr>
											<tr>
												<td>Attachment 3 &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
									
												<td><input type="file" name="forum_attachment3" id="forum_attachment3" class="required" tabindex="107"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter a username" tmt:filters="nospaces" /></td>
											</tr>
											
											<tr>
												<td></td>
												<td>
													<input type="submit" name="forum_createtopic" class="buttonStandard" tabindex="108"  value=" Create Topic "   title="Login">
													<input type="Reset" name="Reset" class="buttonStandard" tabindex="109"  value=" Reset " title="Reset">
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
