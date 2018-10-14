<%@ include file="include_user_header.jsp"%>
<%@ page import="com.rpm.am.util.ApartmentUtil,java.util.Hashtable"%>

<html>
<title>User Registration</title>
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
	
	String selectedCity = "";
		if(request.getParameter("cities")!=null)
		{
			selectedCity= request.getParameter("cities").toString();
			System.out.println("selected city "+selectedCity);
		}
		else
			selectedCity="1";		
%>

<body onLoad="document.userForm.member_name.focus()">
								
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
									<form name="userForm" id="userForm" action="../user/registerUser.do" method="post" tmt:validate="true" >
									
										<fieldset>
										<legend>User Registration</legend>
										<input type="hidden" name="operation"  value="registerUser" > 
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
				tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select or insert a valid birth date"> 
				
				<A HREF="#" onClick="cal_1.select(document.userForm.member_dob,'anchor_1','yyyy-MM-dd'); return false;"
					TITLE="From Date" NAME="anchor_1" ID="anchor_1" tabindex="103">...</A>
														</label>
													</td>
											</tr>
											
											<tr>
												<td align="right">Gender:</td>
												<td align="left">
														<input type="radio" name="member_gender" tabindex="104" value="1" class="required" tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select gender" />Male
														<input type="radio" name="member_gender" tabindex="105" value="2"/>Female
												</td>
											</tr>
											
											
											<tr>
												<td align="right">Badge Number:</td>
												<td align="left"><input type="text" name="member_badgenumber" id="member_badgenumber" tabindex="106"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please enter badge number" /></td>
											</tr>
											
											
											<tr>
												<td align="right">Society:</td>
													<td align="left">
														<select id="societies" name="societies"  tabindex="107" class="required" tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select society name" />
														<option value="" >Select Society Name </option>
														<% 
														Iterator societylist  = ApartmentUtil.getEntity("uspGetSocietyList 0,"+selectedCity);
														while (societylist.hasNext()) {
														    Map.Entry me=(Map.Entry) societylist.next();
														    System.out.println(" Data "+me.getKey() + ":"+ me.getValue());
														%>
														<option value="<%=me.getKey()%>" ><%=me.getValue()%></option>
														<% }
														 %>												
														</select>
													</td>
												
											</tr>
											
											<tr>
												<td align="right">Is Owner:</td>
												<td align="left">
														<input type="radio" name="user_isowner" tabindex="108" value="1" class="required" tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select owner or tenant "  />Owner
														<input type="radio" name="user_isowner" tabindex="109" value="0"/>Tenant
												</td>
											</tr>
											
											<tr>
												<td align="right">Wing:</td>
												<td align="left"><input type="text" name="member_wing" id="member_wing" tabindex="110"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please enter wing" /></td>
											</tr>
											
											<tr>
												<td align="right">Flat Number:</td>
												<td align="left"><input type="text" name="member_flatnumber" id="member_flatnumber" tabindex="111" class="required"   tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter flat number" /></td>
											</tr>
											
											<tr>
												<td align="right">Mobile:</td>
												<td align="left"><input type="text" name="member_mobile" id="member_mobile" tabindex="112"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please enter mobile number" /></td>
											</tr>
											
											<tr>
												<td align="right">Phone:</td>
												<td align="left"><input type="text" name="member_phone" id="member_phone" class="required" tabindex="113"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter phone number" /></td>
											</tr>
											
										<%--  <tr>
												<td align="right">User Type:</td>
												<td align="left">
													<select name="user_typeid" width="100%" class="required" tabindex="114"  tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select user type" >
<option value="" >Select </option>
<% 
Hashtable usertypes = ApartmentUtil.getEntityTypes("UserType");
for (int i=1; i<usertypes.size();i++) {%>
<option value="<%=i%>" ><%=usertypes.get(new Integer(i))%></option>
<% }%>													
													</select>
												</td>
											</tr>  --%>
											
											<tr>
												<td align="right">Email:</td>
												<td align="left"><input type="text" name="user_email" id="user_email" tabindex="114"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please enter email" tmt:filters="nospaces" /></td>
											</tr>
											
											<tr>
												<td align="right">Password:</td>
												<td align="left"><input type="Password" name="user_password" id="user_password" tabindex="115" class="required"   tmt:required="true" tmt:errorclass="invalid" tmt:message="Please enter password" tmt:filters="nospaces" /></td>
											</tr>
											
											<tr>
												<td align="right">Confirm Password:</td>
												<td align="left"><input type="Password" name="user_confirmpassword" id="user_confirmpassword" tabindex="116"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:equalto="user_password" tmt:message="Please enter confirm password" tmt:filters="nospaces" /></td>
											</tr>
											
											<tr>
												<td align="right">Joining Date:</td>
													<td align="left">
														<label>
															 <input type="text" size="9" name="user_joindate" id="user_joindate" tabindex="117" value="" class="required"
				tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select or insert a valid joining date"
				tmt:datepattern="YYYY-MM-DD"> 
				
				<A HREF="#" onClick="cal_2.select(document.userForm.user_joindate,'anchor_2','yyyy-MM-dd'); return false;"
					TITLE="Joining Date" NAME="anchor_2" ID="anchor_2" tabindex="118">...</A>
															 
														</label>
													</td>
											</tr>
											
											<tr>
												<td align="right">Intercom:</td>
												<td align="left"><input type="text" name="user_intercom" id="user_intercom" tabindex="119"  class="required" tmt:required="true" tmt:errorclass="invalid"  tmt:message="Please enter intercom"  /></td>
											</tr>
											
											<tr>
												<td align="right">Is Staying Here:</td>
												<td align="left">
														<input type="radio" name="user_isstayinghere" tabindex="120" value="1" class="required" tmt:required="true" tmt:errorclass="invalid" tmt:message="Please select is staying here" />Yes
														<input type="radio" name="user_isstayinghere" tabindex="121" value="0"/>No
												</td>
											</tr>
																						
											<tr>
												<td> </td>
											</tr>
											
											<tr>
												<td></td>
												<td>
													<input type="submit" name="Submit" class="buttonStandard" tabindex="122" onClick="return ValidateForm()" value=" Submit "   title="Submit">
													<input type="Reset" name="Reset" class="buttonStandard" tabindex="123"  value=" Reset " title="Reset">
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
