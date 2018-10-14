<%@ include file="../user/include_user_header.jsp"%>
<%@ page import="com.rpm.am.util.ApartmentUtil,java.util.Hashtable"%>

<html>
<title>Complaint Registration</title>
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

<body onLoad="document.compaintForm.subject.focus()">
<DIV ID="calendarPopupDiv" STYLE="position:absolute;visibility:hidden;background-color:white;layer-background-color:white;"></DIV>
								
<div id="body">
	<div id="header"><%@ include file="../common/header.jsp"%></div> 
	
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
								<td width="100%">
									<form name="compaintForm" id="compaintForm" action="../user/complaint.do" method="post" tmt:validate="true" >
									
										<fieldset>
										<legend>Register Complaint</legend>
										<input type="hidden" name="operation"  value="registerComplaint" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
										<input type="hidden" name="testcookie" value="1" />
										<input type="hidden" name="userid" value="<%=session.getAttribute("userId") %>" />
										<input type="hidden" name="societyid" value="<%=session.getAttribute("societyId") %>" />
										<table border=0 width="100%"> 
											<tr>
												<td colspan="2">&nbsp;</td>
											</tr>
											
											<tr>
												<td align="right">Subject:</td>
												<td align="left"><input type="text" name="subject" id="subject" class="required" tabindex="101"  tmt:required="true" maxlength="255"  tmt:errorclass="invalid" tmt:message="Please Enter complaint subject" /></td>
											</tr>
											
											<tr>
												<td align="right">Description:</td>
												<td align="left"> 
												<textarea name="description" id="description" class="required"  maxlength="4000"  tabindex="102"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please Enter complaint description" ></textarea>
												</td>
											</tr>
											<tr>
												<td align="right">Vendor Type: </td>
												<td align="left"><select id="vendorTypeId" name="vendorTypeId" width="100" tabindex="110">
<option value="" >Select </option>
<% 
Hashtable vendortypes= ApartmentUtil.getEntityTypes("VendorType");
for (int i=1; i<vendortypes.size();i++) {%>
<option value="<%=i%>" ><%=vendortypes.get(new Integer(i))%></option>
<% }%>
												</select>
												<td>									
											</tr>
											<tr>
												<td></td>
												<td>
													<input type="submit" name="Submit" class="buttonStandard" tabindex="111" onClick="return ValidateForm()" value=" Submit "   title="Submit">
													<input type="Reset" name="Reset" class="buttonStandard" tabindex="112"  value=" Reset " title="Reset">
													 
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

