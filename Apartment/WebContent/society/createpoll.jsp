<%@ include file="../user/include_user_header.jsp"%>
 
<html>
<title>Instant Poll</title>
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
									<form name="pollform" id="pollform" action="../apartment/poll.do" method="post" tmt:validate="true">
									
										<fieldset>
										<legend>Instant Poll</legend>
										<input type="hidden" name="operation"  value="poll" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
										<input type="hidden" name="testcookie" value="1" />
										<table> 
											<tr>
												<td colspan="2">&nbsp;</td>
											</tr>
											<tr>
												<td>Poll Topic &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
									
												<td><input type="text" name="poll_topic" id="poll_topic" class="required" tabindex="101"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter a username" tmt:filters="nospaces" /></td>
											</tr>
											
											<tr>
												<td>Poll Description &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
												<td><textarea type="text" name="poll_description" id="poll_description" tabindex="102"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please enter a password" tmt:filters="nospaces" ></textarea></td>
											</tr>
											
											<tr>
												<td>Date &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
													<td>
														<label>
															 <input type="text" size="9" name="poll_date" id="poll_date"  tabindex="103" value="" class="required"
				tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select or insert a valid date using the YYYY-MM-DD format"
				tmt:datepattern="YYYY-MM-DD"> 
				
				<A HREF="#" onClick="cal_1.select(document.loginform.fromDate,'anchor_1','yyyy-MM-dd'); return false;"
					TITLE="From Date" NAME="anchor_1" ID="anchor_1">...</A>
															 
														</label>
													</td>
											</tr>
											
											<tr>
												<td>Poll Expiry Date &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
													<td>
														<label>
															 <input type="text" size="9" name="poll_expirydate" id="poll_expirydate"  tabindex="104" value="" class="required"
				tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select or insert a valid expiry date using the YYYY-MM-DD format"
				tmt:datepattern="YYYY-MM-DD"> 
				
				<A HREF="#" onClick="cal_1.select(document.loginform.fromDate,'anchor_1','yyyy-MM-dd'); return false;"
					TITLE="From Date" NAME="anchor_1" ID="anchor_1">...</A>
															 
														</label>
													</td>
											</tr>
											
											<tr>
												<td>Choice 1 &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
									
												<td><input type="text" name="poll_choice1" id="poll_choice1" class="required" tabindex="105"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter a username" tmt:filters="nospaces" /></td>
											</tr>
											<tr>
												<td>Choice 2 &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
									
												<td><input type="text" name="poll_choice2" id="poll_choice2" class="required" tabindex="106"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter a username" tmt:filters="nospaces" /></td>
											</tr>
											<tr>
												<td>Choice 3 &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
									
												<td><input type="text" name="poll_choice3" id="poll_choice3" class="required" tabindex="107"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter a username" tmt:filters="nospaces" /></td>
											</tr>
											<tr>
												<td>Choice 4 &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
									
												<td><input type="text" name="poll_choice4" id="poll_choice4" class="required" tabindex="108"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter a username" tmt:filters="nospaces" /></td>
											</tr>
											<tr>
												<td>Choice 5 &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
									
												<td><input type="text" name="poll_choice5" id="poll_choice5" class="required" tabindex="109"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter a username" tmt:filters="nospaces" /></td>
											</tr>
											
											<tr>
												<td>Choose Group : &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
												<td>
													<label>
														<input type="radio" name="poll_choosegroup" tabindex="110" value="1" />All Residents 
														<input type="radio" name="poll_choosegroup" tabindex="111" value="0"/>Owners Only
													</label>
												</td>
											</tr>
											
											<tr>
												<td>Poll Close Date &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
													<td>
														<label>
															 <input type="text" size="9" name="poll_closedate" id="poll_closedate"  tabindex="112" value="" class="required"
				tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select or insert a valid close date using the YYYY-MM-DD format"
				tmt:datepattern="YYYY-MM-DD"> 
				
				<A HREF="#" onClick="cal_1.select(document.loginform.fromDate,'anchor_1','yyyy-MM-dd'); return false;"
					TITLE="From Date" NAME="anchor_1" ID="anchor_1">...</A>
															 
														</label>
													</td>
											</tr>
											
											<tr>
												<td></td>
												<td>
													<input type="submit" name="poll_save" class="buttonStandard" tabindex="113"  value=" Save "   title="Login">
													<input type="Reset" name="Reset" class="buttonStandard" tabindex="114"  value=" Reset " title="Reset">
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
