<% 
	//Get Complaint List
	ComplaintHandler userDashboardComplaintHandler = new ComplaintHandler();
	ArrayList complaintList = userDashboardComplaintHandler.getComplaints(userId,societyId);	
	System.out.println("complaintList size  = " + complaintList.size());
%>	 
	<table width="100%" border="1">
		<tr>
			<td><b>Sr.No.</b></td>
			<td><b>Date</b></td>
			<td><b>Subject</b></td>
		</tr>	
									 	
	 	
	 <%
	 	for(int i=0;i<complaintList.size();i++)
	 	{
	 		System.out.println("i = " + i);
	 		ComplaintBean bean = (ComplaintBean)complaintList.get(i);
	 		
	 		 System.out.println("bean.getSubject()  = " + bean.getSubject());
	%>
			<tr>
				<td> <%=i+1%> </td>
				<td> <%=bean.getCreatedDate()%> </td>
				<td><a href="../user/complaint.do?action=view&id=<%=bean.getId()%>"> <%=bean.getSubject()%></a></td>
			</tr>	
	 <% 		
	 	}
	 %>
 	</table>
