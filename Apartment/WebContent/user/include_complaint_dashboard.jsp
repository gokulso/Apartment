
<%		
		ComplaintHandler complaintsHandler = new ComplaintHandler();
		ArrayList complaintList = complaintsHandler.getComplaints(userId,societyId);		
		System.out.println("complaintList size  = " + complaintList.size());		
%>

<table width="100%" id="BorderTable">
	<tr>
		<td>Search Complaint Box</td>
	</tr>
</table>

<table width="100%" id="BorderTable">	

				<tr>
					<td><b>Sr.No.</b></td>
					<td><b>Date</b></td>
					<td><b>Subject</b></td>
				</tr>	
		 	
		 	
		 <%
		 	for(int i=0;i<complaintList.size();i++){
		 		
		 		System.out.println("i  = " + i);
		 		ComplaintBean bean = (ComplaintBean)complaintList.get(i);
		 		
		 		 System.out.println("bean.getHeading()  = " + bean.getSubject());
		%>
		 	
				<tr>
					<td> <%=i+1%> </td>
					<td> <%=bean.getCreatedDate()%> </td>
					<td><a href="complaint.do?action=view&id=<%=bean.getId()%>"> <%=bean.getSubject()%></a> </td>
					<td><a href="complaint.do?action=update&id=<%=bean.getId()%>">Update</a>
					<td><a href="complaint.do?action=update&id=<%=bean.getId()%>">Delete</a>
				</tr>	
		 		
		 		
		 <% 		
		 	}
		 
		 %>
</table>