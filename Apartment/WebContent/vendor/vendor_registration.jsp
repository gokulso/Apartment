<%@ include file="../user/include_user_header.jsp"%>
<%@ page import="com.rpm.am.util.ApartmentUtil,java.util.Hashtable"%>

<html>
<title>Vendor Registration</title>
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

<body onLoad="document.vendorForm.vendor_name.focus()">
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
									<form name="vendorForm" id="vendorForm" action="../vendor/registerVendor.do" method="post" tmt:validate="true" >
									
										<fieldset>
										<legend>Vendor Registration</legend>
										<input type="hidden" name="operation"  value="registerVendor" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
										<input type="hidden" name="testcookie" value="1" />
										<table border=0 width="100%"> 
											<tr>
												<td colspan="2">&nbsp;</td>
											</tr>
											
											<tr>
												<td align="right">Name:</td>
									
												<td align="left"><input type="text" name="vendor_name" id="vendor_name" class="required" tabindex="101"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please Enter Name" /></td>
											</tr>
											
											<tr>
												<td align="right">Gender:</td>
												<td align="left">
														<input type="radio" name="vendor_gender" tabindex="102" value="1" />Male
														<input type="radio" name="vendor_gender" tabindex="103" value="0"/>Female
												</td>
											</tr>
											
											<tr>
												<td align="right">Badge Number:</td>
									
												<td align="left"><input type="text" name="vendor_badgenumber" id="vendor_badgenumber" class="required" tabindex="104"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please Enter Badge Number" /></td>
											</tr>
											<tr>
												<td align="right">Wing:</td>
												<td align="left"><input type="text" name="vendor_wing" id="vendor_wing" tabindex="105"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please Enter Wing" /></td>
											</tr>
											
											<tr>
												<td align="right">Shop Number:</td>
									
												<td align="left"><input type="text" name="vendor_shopnumber" id="vendor_shopnumber" class="required" tabindex="106"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please Enter ShopNumber" /></td>
											</tr>
											
											<tr>
												<td align="right">Mobile:</td>
												<td align="left"><input type="text" name="vendor_mobile" id="vendor_mobile" tabindex="107"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please Enter Mobile Number" /></td>
											</tr>
											
											<tr>
												<td align="right">Phone:</td>
									
												<td align="left"><input type="text" name="vendor_phone" id="vendor_phone" class="required" tabindex="108"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please Enter Phone Number" /></td>
											</tr>
											
											<tr>
												<td align="right">Email:</td>
												<td align="left"><input type="text" name="vendor_email" id="vendor_email" tabindex="109"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please Enter Email" tmt:filters="nospaces" /></td>
											</tr>
											
											<tr>
												<td align="right">Vendor Type: </td>
												<td align="left"><select name="vendor_typeid" width="100" tabindex="110">
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

