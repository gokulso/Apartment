<%@ include file="../user/include_user_header.jsp"%>
<%@ page import="com.rpm.am.util.ApartmentUtil,java.util.Hashtable"%>

<html>
<title>Society Registration</title>
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

<body onLoad="document.aptForm.society_name.focus()">
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
									<form name="aptForm" id="aptForm" action="../society/registerSociety.do" method="post" tmt:validate="true"  >
									
										<fieldset>
										<legend>Society Registration</legend>
										<input type="hidden" name="operation"  value="registerSociety" > 
										<input type="hidden" name="redirect_to" value="<%=redirect_to%>" />
										<input type="hidden" name="testcookie" value="1" />
										<table border=0 width="100%"> 
											<tr>
												<td colspan="2"><b><u>Society Information</u></b></td>
											</tr>
											
											<tr>
												<td align="right">Society Name:</td>
												<td align="left"><input type="text" name="society_name" id="society_name" class="required" tabindex="101"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter name" /></td>
											</tr>
											
											<tr>
												<td align="right">Address1:</td>
												<td align="left"><input type="text" name="society_address1" id="society_address1" tabindex="102"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please enter address1" /></td>
											</tr>
											
											<tr>
												<td align="right">Address2:</td>
												<td align="left"><input type="text" name="society_address2" id="society_address2" tabindex="103" class="required"   tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter address2" /></td>
											</tr>
											
											<tr>
												<td align="right">City:</td>
												<td align="left">
												<input type="hidden" name="society_cityid" value ="<%=request.getParameter("cities")%>" id="society_cityid"  />
												<input type="text" name="society_cityname" value ="<%=request.getParameter("cityname")%>" id="society_cityname" tabindex="104" readonly="readonly"   class="required"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter city" />
												
												</td>
											</tr>
											
											<tr>
												<td align="right">Mobile:</td>
												<td align="left"><input type="text" name="society_mobile" id="society_mobile" tabindex="105"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please enter mobileno" /></td>
											</tr>
											
											<tr>
												<td align="right">Phone:</td>
												<td align="left"><input type="text" name="society_phone" id="society_phone" tabindex="106" class="required"   tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter phoneno" /></td>
											</tr>
											
											<tr>
												<td align="right">Email:</td>
												<td align="left"><input type="text" name="society_email" id="society_email" tabindex="107"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please enter email" tmt:filters="nospaces" /></td>
											</tr>
											
											<tr>
												<td align="right">Website:</td>
												<td align="left"><input type="text" name="society_website" id="society_website" tabindex="108"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:filters="nospaces" /></td>
											</tr>
											
											<tr>
												<td> </td>
											</tr>
											
											<tr>
												<td colspan="2"><b><u>Society Admin Information</u></b></td>
											</tr>
											
											<tr>
												<td align="right">Name:</td>
												<td align="left"><input type="text" name="member_name" id="member_name" tabindex="109" class="required"   tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter name" /></td>
											</tr>
										
											<tr>
												<td align="right">DateOfBirth:</td>
													<td align="left">
														<label>
															 <input type="text" size="9" name="member_dob" id="member_dob"  tabindex="110" value="" class="required"
				tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select or insert a valid birth date  using the YYYY-MM-DD format"
				tmt:datepattern="YYYY-MM-DD"> 
				
				<A HREF="#" onClick="cal_1.select(document.aptForm.member_dob,'anchor_1','yyyy-MM-dd'); return false;"
					TITLE="Birth Date" NAME="anchor_1" ID="anchor_1" tabindex="111">...</A>
															 
														</label>
													</td>
											</tr>
											
											<tr>
												<td align="right">Gender:</td>
												<td align="left">
														<input type="radio" name="member_gender" tabindex="112" value="1" class="required" tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select gender" />Male
														<input type="radio" name="member_gender" tabindex="113" value="0" />Female
												</td>
											</tr>
											
											<tr>
												<td align="right">Badge Number:</td>
												<td align="left"><input type="text" name="member_badgenumber" id="member_badgenumber" tabindex="114"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please enter badgenumber" /></td>
											</tr>
											
											<tr>
												<td align="right">Wing:</td>
												<td align="left"><input type="text" name="member_wing" id="member_wing" tabindex="115"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please enter wing" /></td>
											</tr>
											
											<tr>
												<td align="right">Flat Number:</td>
												<td align="left"><input type="text" name="member_flatnumber" id="member_flatnumber" tabindex="116" class="required"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter flat number" /></td>
											</tr>
											
											<tr>
												<td align="right">Is Owner:</td>
												<td align="left">
														<input type="radio" name="user_isowner" tabindex="117" value="true" class="required" tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select owner or tenant " />Yes
														<input type="radio" name="user_isowner" tabindex="118" value="false" />No
												</td>
											</tr>
											
											
											<tr>
												<td align="right">Mobile:</td>
												<td align="left"><input type="text" name="member_mobile" id="member_mobile" tabindex="119"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please enter Mobile Number" /></td>
											</tr>
											
											<tr>
												<td align="right">Phone:</td>
												<td align="left"><input type="text" name="member_phone" id="member_phone" tabindex="120" class="required"   tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter phoneno" /></td>
											</tr>
											
											<tr>
												<td align="right">Email:</td>
												<td align="left"><input type="text" name="member_email" id="member_email" tabindex="121"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please enter email" tmt:filters="nospaces" /></td>
											</tr>
										 	
											<tr>
												<td align="right">Password:</td>
												<td align="left"><input type="Password" name="user_password" id="user_password" tabindex="122" class="required"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter password" tmt:filters="nospaces" /></td>
											</tr>
											
											<tr>
												<td align="right">Confirm Password:</td>
												<td align="left"><input type="Password" name="user_confirmpassword" id="user_confirmpassword" tabindex="123"  class="required" tmt:required="true" tmt:errorclass="invalid" tmt:equalto="user_password" tmt:message="Please enter confirm password" tmt:filters="nospaces" /></td>
											</tr>
											
											<%-- <tr>
												<td align="right">User Type:</td>
									
												<td>
													<select name="user_typeid" width="100%" class="required" tabindex="124"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select UserType" />
<option value="" >Select </option>
<% 
Hashtable usertypes = ApartmentUtil.getEntityTypes("UserType");
for (int i=1; i<usertypes.size();i++) {%>
<option value="<%=i%>" ><%=usertypes.get(new Integer(i))%></option>
<% }%>																									
													</select>
												</td>
											</tr> --%>  
										
											<tr>
												<td align="right">Joining Date:</td>
													<td align="left">
														<label>
															 <input type="text" size="9" name="user_joindate" id="user_joindate"  tabindex="124" value="" class="required"
				tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select or insert a valid date  using the YYYY-MM-DD format"
				tmt:datepattern="YYYY-MM-DD"> 
				
				<A HREF="#" onClick="cal_2.select(document.aptForm.user_joindate,'anchor_2','yyyy-MM-dd'); return false;"
					TITLE="From Date" NAME="anchor_2" ID="anchor_2" tabindex="125">...</A>
															 
														</label>
													</td>
											</tr>
											
											<tr>
												<td align="right">Intercom:</td>
												<td align="left"><input type="text" name="user_intercom" id="user_intercom" tabindex="126"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please enter intercom" /></td>
											</tr>
											
											<tr>
												<td align="right">Is Staying Here:</td>
												<td align="left">
														<input type="radio" name="user_isstayinghere" tabindex="127" value="true" class="required" tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select is staying here" />Yes
														<input type="radio" name="user_isstayinghere" tabindex="128" value="false" />No
												</td>
											</tr>
																						
											<tr>
												<td> </td>
									
											</tr>
											
											
											<tr>
												<td></td>
												<td>
													<input type="submit" name="Submit" class="buttonStandard" tabindex="129"  value=" Submit " title="Submit">
													<input type="Reset" name="Reset" class="buttonStandard" tabindex="130"  value=" Reset " title="Reset">
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
