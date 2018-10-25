<% 
	//Get Users List
	UserHandler userDashboardHandler = new UserHandler();
	ArrayList memberList = userDashboardHandler.getCurrentMembers(userId,societyId);	
	System.out.println("noticeList size  = " + memberList.size());

%>	
<table width="100%" border="1">
		<tr>
			<td><b>Sr.No.</b></td>
			<td><b>Name</b></td>
			<td><b>Wing</b></td>
			<td><b>FlatNumber</b></td>
			<td><b>Mobile</b></td>
			<td><b>CreateDate</b></td>
			<td><b>IsActive</b></td>
		</tr>	
									 	
	 	
	 <%
	 	for(int i=0;i<memberList.size();i++)
	 	{
	 		System.out.println("i = " + i);
	 		MemberBean bean = (MemberBean)memberList.get(i);
	 		
	 		 System.out.println("bean.getMemberName()  = " + bean.getMemberName());
	%>
			<tr>
				<td> <%=i+1%> </td>
				<td> <%=bean.getMemberName()%> </td>
				<td><%=bean.getMemberWing()%></td>
				<td><%=bean.getMemberFlatNumber()%></td>  
				<td><%=bean.getMemberMobile()%></td>
				<td><%=bean.getCeateDate()%></td> 
				<td><%=(bean.getMemberIsActive()== true)?"Yes":"No"%></td> 
	        </tr>	
	 <% 		
	 	}
	 %>
 	</table>