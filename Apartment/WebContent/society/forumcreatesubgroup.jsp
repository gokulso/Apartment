<%@ include file="../user/include_user_header.jsp"%>
 
<html>
<title>Forum Create a Sub Group</title>
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
									<form name="noticeboardform" id="noticeboardform" action="../apartment/noticeboard.do" method="post" tmt:validate="true">
									
										<fieldset>
										<legend>Forum Create a Sub Group</legend>
										<input type="hidden" name="operation"  value="noticeboard" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
										<input type="hidden" name="testcookie" value="1" />
										<table> 
											<tr>
												<td colspan="2">&nbsp;</td>
											</tr>
											<tr>
												<td>SubGroup Name &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
									
												<td><input type="text" name="notice_briefdescription" id="notice_briefdescription" class="required" tabindex="101"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter a username" tmt:filters="nospaces" /></td>
											</tr>
											<tr>
												<td>SubGroup Description &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
												<td><textarea cols="30" rows="4" type="text" name="notice_description" id="notice_description" tabindex="102"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please enter a password" tmt:filters="nospaces" ></textarea></td>
											</tr>
											<tr><td>&nbsp;</td></tr>
											<tr>
												<td>Membership Restriction &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
												<td>
													<label>
														<input type="radio" name="notice_catgegory" tabindex="103" value="1" />Open for all
														<input type="radio" name="notice_catgegory" tabindex="104" value="0"/>Restricted
													</label>
												</td>
											</tr>
											
											<tr>
												<td></td>
												<td>
													<input type="submit" name="forum_save" class="buttonStandard" tabindex="108"  value=" Save "   title="Forum">
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
