<%@ include file="../user/include_user_header.jsp"%>
 
<html>
<title>Edit Notice</title>
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
					<DIV ID="calendarPopupDiv" STYLE="position:absolute;visibility:hidden;background-color:white;layer-background-color:white;"></DIV>
								 
						<table id="tableDataOuter" width="100%" >
								<tr>
									<td colspan="3"><b><%=errorMessage%></b></td>
								</tr>	
								<tr>
								<td width="75%">
									<form name="editnoticeform" id="editnoticeform" action="../society/editnotice.do" method="post" tmt:validate="true">
									
										<fieldset>
										<legend>Edit Notice</legend>
										<input type="hidden" name="operation"  value="editnotice" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
									 
										<table> 
											<tr>
												<td colspan="2">&nbsp;</td>
											</tr>
											<tr>
												<td>Heading &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
									
												<td><input type="text" name="edit_notice_heading" id="edit_notice_heading" class="required" tabindex="101"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter notice subject"   /></td>
										</tr>
											<tr>
										<td>Description &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
												<td><textarea cols="30" rows="4" type="text" name="edit_notice_description" id="edit_notice_description" tabindex="102"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please enter a description" ></textarea></td>
											</tr>
											<tr><td>&nbsp;</td></tr>
											<tr>
												<td>Category &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
												<td>
													
														<input type="radio" name="edit_notice_catgegory" tabindex="103" value="1">Administrative Notice 
														<input type="radio" name="edit_notice_catgegory" tabindex="104" value="2">General Notice
														<input type="radio" name="edit_notice_catgegory" tabindex="105" value="3">Buy/Sell Notice
												
												</td>
											</tr>
											
											<tr>
												<td>Date &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
													<td>
														<label>
								<input type="text" size="9" name="edit_notice_date" id="edit_notice_date"  tabindex="106" value="" class="required" tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select or insert a valid date using the YYYY-MM-DD format" tmt:datepattern="YYYY-MM-DD"> 
				
				                <A HREF="#" onClick="cal_1.select(document.editnoticeform.edit_notice_date,'anchor_1','yyyy-MM-dd'); return false;"	TITLE="From Date" NAME="anchor_1" ID="anchor_1">...</A>
								</label>
								</td>
								</tr>
											
											<tr>
												<td>Notice Expiry Date &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</td>
													<td>
														<label>
															 <input type="text" size="9" name="edit_notice_expirydate" id="edit_notice_expirydate"  tabindex="107" value="" class="required"
				tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select or insert a valid expiry date using the YYYY-MM-DD format"
				tmt:datepattern="YYYY-MM-DD"> 
				
				<A HREF="#" onClick="cal_1.select(document.editnoticeform.edit_notice_expirydate,'anchor_1','yyyy-MM-dd'); return false;" TITLE="From Date" NAME="anchor_1" ID="anchor_1">...</A>
															 
														</label>
													</td>
											</tr>
											
											
											<tr>
												<td></td>
												<td>
													<input type="submit" name="edit_notice_save" class="buttonStandard" tabindex="108"  value=" Save "   title="Save">
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
