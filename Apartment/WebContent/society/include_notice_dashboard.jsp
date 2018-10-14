<%		
		NoticeHandler noticeBoardHandler = new NoticeHandler();
		ArrayList noticeList = noticeBoardHandler.getCurrentNotice(userId,societyId);		
		System.out.println("noticeList size  = " + noticeList.size());		
%>

<table width="100%" id="BorderTable">
	<tr>
		<td>Search Notice Box</td>
	</tr>
</table>

<table width="100%" id="BorderTable">	

				<tr>
					<td><b>Sr.No.</b></td>
					<td><b>Date</b></td>
					<td><b>Subject</b></td>
				</tr>	
		 	
		 	
		 <%
		 	for(int i=0;i<noticeList.size();i++){
		 		
		 		System.out.println("i  = " +i);
		 		NoticeBean bean = (NoticeBean)noticeList.get(i);
		 		
		 		 System.out.println("bean.getHeading()  = " + bean.getHeading());
		%>
		 	
				<tr>
					<td> <%=i+1%> </td>
					<td> <%=bean.getDate()%> </td>
					<td><a href="noticeboard.do?operation=view&id=<%=bean.getId()%>"> <%=bean.getHeading()%></a> </td>
					<td><a href="noticeboard.do?operation=updatePopulate&id=<%=bean.getId()%>">Update</a></td>
					<td><a href="noticeboard.do?operation=delete&id=<%=bean.getId()%>">Delete</a></td>
				</tr>	
		 		
		 		
		 <% 		
		 	}
		 
		 %>
</table>