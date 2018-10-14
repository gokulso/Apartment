<%@ include file="../user/include_user_header.jsp"%>
 
<html>
<title>Create Notice</title>
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
<BODY onLoad="document.noticeboardform.heading.focus()">
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
									<form name="noticeboardform" id="noticeboardform" action="../society/noticeboard.do" method="post" tmt:validate="true">
									
										<fieldset>
										<legend>Create Notice</legend>
										<input type="hidden" name="operation"  value="create" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
									 
										<table> 
											<tr>
												<td colspan="2">&nbsp;</td>
											</tr>
											
											<tr>
												<td align="right">Heading:</td>
												<td align="left"><input type="text" name="heading" id="heading" class="required" tabindex="101"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter notice subject"   /></td>
											</tr>
											
											<tr>
												<td align="right">Description:</td>
												<td align="left"><textarea cols="30" rows="4" type="text" name="description" id="description" tabindex="102"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please enter a description" ></textarea></td>
											</tr>
											<tr><td>&nbsp;</td></tr>
											
											<tr>
												<td align="right">Category:</td>
												<td align="left">
													
														<input type="radio" name="category" tabindex="103" value="1" class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please select category" >Administrative Notice 
														<input type="radio" name="category" tabindex="104" value="2">General Notice
														<input type="radio" name="category" tabindex="105" value="3">Buy/Sell Notice
												
												</td>
											</tr>
											
											<tr>
												<td align="right">Date:</td>
													<td align="left">
														<label>
								<input type="text" size="9" name="date" id="date"  tabindex="106" value="" class="required" tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select or insert a valid date using the YYYY-MM-DD format" tmt:datepattern="YYYY-MM-DD"> 
				
				                <A HREF="#" onClick="cal_1.select(document.noticeboardform.date,'anchor_1','yyyy-MM-dd'); return false;"	TITLE="From Date" NAME="anchor_1" ID="anchor_1" tabindex="107">...</A>
								</label>
								</td>
								</tr>
											
											<tr>
												<td align="right">Notice Expiry Date:</td>
													<td align="left">
														<label>
															 <input type="text" size="9" name="expirydate" id="expirydate"  tabindex="108" value="" class="required"
				tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select or insert a valid expiry date using the YYYY-MM-DD format"
				tmt:datepattern="YYYY-MM-DD"> 
				
				<A HREF="#" onClick="cal_2.select(document.noticeboardform.expirydate,'anchor_2','yyyy-MM-dd'); return false;" TITLE="Expiry Date" NAME="anchor_2" ID="anchor_2" tabindex="109">...</A>
															 
														</label>
													</td>
											</tr>
											
											
											<tr>
												<td></td>
												<td>
													<input type="submit" name="save" class="buttonStandard" tabindex="110"  value=" Save "   title="Save">
													<input type="Reset" name="Reset" class="buttonStandard" tabindex="111"  value=" Reset " title="Reset">
												
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
