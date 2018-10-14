<%@ include file="include_user_header.jsp"%>
<%@ page import="com.rpm.am.util.ApartmentUtil,java.util.Hashtable"%>

<html>
<title>Member Registration</title>
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

<body onLoad="document.memberForm.member_name.focus()">
								
<div id="body">
	<div id="header"><%@ include file="../common/header.jsp"%></div> 
	
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
									<form name="memberForm" id="memberForm" action="../user/registerMember.do" method="post" tmt:validate="true" >
									
										<fieldset>
										<legend>Member Registration</legend>
										<input type="hidden" name="operation"  value="registerMember" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
										<input type="hidden" name="testcookie" value="1" />
										<table> 
											<tr>
												<td colspan="2">&nbsp;</td>
											</tr>
											
											<tr>
												<td align="right">Name:</td>
												<td align="left"><input type="text" name="member_name" id="member_name" class="required" tabindex="101"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter name" /></td>
											</tr>
											
											
											<tr>
												<td align="right">DateOfBirth:</td>
													<td align="left">
														<label>
															 <input type="text" size="9" name="member_dob" id="member_dob"  tabindex="102" value="" class="required"
				tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select or insert a valid birth date using the YYYY-MM-DD format"
				tmt:datepattern="YYYY-MM-DD"> 
				
				<A HREF="#" onClick="cal_1.select(document.memberForm.member_dob,'anchor_1','yyyy-MM-dd'); return false;"
					TITLE="From Date" NAME="anchor_1" ID="anchor_1" tabindex="103">...</A>
														</label>
													</td>
											</tr>
											
											<tr>
												<td align="right">Gender:</td>
												<td align="left">
														<input type="radio" name="member_gender" tabindex="104" value="1" class="required" tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select gender" />Male
														<input type="radio" name="member_gender" tabindex="105" value="0"/>Female
												</td>
											</tr>
											
											
											<tr>
												<td align="right">Badge Number:</td>
												<td align="left"><input type="text" name="member_badgenumber" id="member_badgenumber" tabindex="106"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please enter badge number" /></td>
											</tr>
											
											<tr>
												<td align="right">Wing:</td>
												<td align="left"><input type="text" name="member_wing" id="member_wing" tabindex="107"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please enter wing" /></td>
											</tr>
											
											<tr>
												<td align="right">Flat Number:</td>
												<td align="left"><input type="text" name="member_flatnumber" id="member_flatnumber" class="required" tabindex="108"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter flat number" /></td>
											</tr>
											
											<tr>
												<td align="right">Mobile:</td>
												<td align="left"><input type="text" name="member_mobile" id="member_mobile" tabindex="109"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please enter mobile number" /></td>
											</tr>
											
											<tr>
												<td align="right">Phone:</td>
												<td align="left"><input type="text" name="member_phone" id="member_phone" class="required" tabindex="110"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter phone number" /></td>
											</tr>
											
											<tr>
												<td align="right">Email:</td>
												<td align="left"><input type="text" name="member_email" id="member_email" tabindex="111"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please enter email" tmt:filters="nospaces" /></td>
											</tr>
											
											<tr>
												<td></td>
												<td>
													<input type="submit" name="Submit" class="buttonStandard" tabindex="112" onClick="return ValidateForm()" value=" Submit "   title="Submit">
													<input type="Reset" name="Reset" class="buttonStandard" tabindex="113"  value=" Reset " title="Reset">
													 
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
