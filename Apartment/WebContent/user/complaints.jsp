<%@ include file="../user/include_user_header.jsp"%> 	
 

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
	System.out.println("########## redirect_to  = " + redirect_to);
	
	

	//Get Vendor List
	 
	
		 %>		
 
<%
	//Show Page Title ( Display the society selected + Welcome message)
%> 
<title>Complaints</title>
 
</head>				 
 
		

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
								 
						<table id="simple-table-1" width="100%" >
								<tr>
									<td colspan="3"><b><%=errorMessage%></b></td>
								</tr>
								 <tr>
									<td colspan="3"><%@ include file="include_complaint_dashboard.jsp"%></td>
								</tr>
								 <tr>
									<td colspan="3"> 
									 <a href="../user/registerComplaint.jsp">Register Complaint</a> |  <a href="">Delete</a>|  <a href="">Search</a>
		
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
