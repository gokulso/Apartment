<%@ include file="../user/include_user_header.jsp"%>
 
<html>
<title>Notice Board Details</title>
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
									<form name="noticeboarddetailsform" id="noticeboarddetailsform" action="../society/noticedetails.do" method="post" tmt:validate="true">
									
										<fieldset>
										<legend>Notice Board Details</legend>
										<input type="hidden" name="operation"  value="noticeBoardDetails" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
										<input type="hidden" name="testcookie" value="1" />
										<table> 
											<tr>
												<td colspan="2">&nbsp;</td>
											</tr>
											<tr>
												<td>Notice Type:</td>
									
												<td><input name="notice_type" tabindex="101" value="1" type="radio">Admin Notice</td>
												<td><input name="notice_type" tabindex="101" value="2" type="radio">General Notice</td>
												<td><input name="notice_type" tabindex="101" value="3" type="radio">Buy Notice</td>
												<td><input name="notice_type" tabindex="101" value="4" type="radio">Sell Notice</td>
												<td><input name="notice_type" tabindex="101" value="5" type="radio">Any</td>
											</tr>
											
											<tr>
											<td colspan="6">&nbsp;</td>	
											</tr>
											
											<tr>
												<td> Filter Data</td>
												<td colspan="5">&nbsp;</td>
											</tr>
											
											<tr><td colspan="6"><HR></td></tr>
											
											<tr>
												<td>Notice : </td>
												<td><select name="notice_list" width="100">
												<option value="0" selected="selected">All</option>
												<option value="1">Admin Notice</option>
												<option value="2">General Notice</option>
												<option value="3">Buy Notice</option>
												<option value="4">Sell Notice</option>
												<option value="5">Any</option> 
												</select>
												<td>									
											</tr>
											
											<tr>
												<td colspan="6"></td>
											</tr>
											
											<tr>
												<td>&nbsp;</td>
												<td colspan="0">
												<input type="radio" name="noticedate">Fixed Period</td><td colspan="0">&nbsp;
												<label>
													<select name="fixedperiod" width="100">
														<option value="0" selected="selected">Last 3 Months</option>
														<option value="1">Last 6 Months</option>
														<option value="2">Last 9 Months</option>
														<option value="3">Last 1 Year</option>
													</select>
												</label>
												</td>
												
											</tr>
											
											<tr>
												<td>Time : </td><td colspan="5"><input type="radio" name="notice_date">From<label>
								<input type="text" size="9" name="from_date" id="fromdate"  tabindex="106" value="" class="required" tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select or insert a valid date using the YYYY-MM-DD format" tmt:datepattern="YYYY-MM-DD"> 
				
				                <A HREF="#" onClick="cal_1.select(document.noticeboarddetailsform.fromdate,'anchor_1','yyyy-MM-dd'); return false;"	TITLE="From Date" NAME="anchor_1" ID="anchor_1">...</A>
								</label>
								
								To<label>
								<input type="text" size="9" name="todate" id="todate"  tabindex="107" value="" class="required" tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select or insert a valid date using the YYYY-MM-DD format" tmt:datepattern="YYYY-MM-DD"> 
				
				                <A HREF="#" onClick="cal_1.select(document.noticeboarddetailsform.todate,'anchor_1','yyyy-MM-dd'); return false;"	TITLE="To Date" NAME="anchor_1" ID="anchor_1">...</A>
								</label>
								
								</td>
											</tr>

											<tr>
												<td>&nbsp;</td><td colspan="0"><input type="radio" name="noticedate">All Date</td><td colspan="4">&nbsp;</td>
											</tr>
											
											
											<tr><td> <input type="Submit" value="Get Notice"></td><td colspan="5">&nbsp;</td></tr>
											
											<tr><td colspan="6"><HR/></td></tr>
											
											<tr>
											<td><input type="Submit" name="addnotice" value="Add Notice" onClick="" ></td>
											<td><input type="Submit" name="editnotice" value="Edit Notice" onClick="" ></td>
											<td><input type="Submit" name="deletenotice" value="Delete Notice" onClick="" ></td>
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
