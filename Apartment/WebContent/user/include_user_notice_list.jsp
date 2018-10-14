<% 
	//Get Notice List
	NoticeHandler userDashboardNoticeHandler = new NoticeHandler();
	ArrayList noticeList = userDashboardNoticeHandler.getCurrentNotice(userId,societyId);	
	System.out.println("noticeList size  = " + noticeList.size());
%>	 
	<table width="100%" border="1">
		<tr>
			<td><b>Sr.No.</b></td>
			<td><b>Date</b></td>
			<td><b>Subject</b></td>
		</tr>	
	 <%
	 	for(int i=0;i<noticeList.size();i++)
	 	{
	 		System.out.println("i  = " +i);
	 		NoticeBean bean = (NoticeBean)noticeList.get(i);
	 		
	 		System.out.println("bean.getHeading()  = " + bean.getHeading());
	%>
			<tr>
				<td> <%=i+1%> </td>
				<td> <%=bean.getDate()%> </td>
				<td><a href="../society/noticeboard.do?action=view&id=<%=bean.getId()%>"> <%=bean.getHeading()%></a></td>
			</tr>	
	 <% 		
	 	}
	 %>
 	</table>
