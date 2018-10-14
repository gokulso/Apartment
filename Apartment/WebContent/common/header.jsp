<table width="100%" cellSpacing="1" cellPadding="1" align="center" border="1">
	<tr>
		<td align="left" width="660">
			<img border="0" height="90"
			width="660" alt="ApartmentManager.com" src="http://localhost:8080/Apartment/images/logo.png">
		</td>	
		<td  width="330">
			<table>
				<% if(userName.equals("Guest")){ %>
				
				<tr>
					<td>Welcome Guest</td>
				</tr>
				<tr>
					<td>Login</td>
				</tr>
				<%} else { %>
				<tr>
					<td>Welcome <%=userName%></td>
				</tr>
				<tr>		
					<td><%=societyName%></td>
				</tr>
				<tr>
					<td><a href="../user/logout.do?operation=logout">Logout</a></td>
				</tr>
				
				<% } %>
			</table>
		</td>
	</tr>
</table>

<table width="100%" cellSpacing="1" cellPadding="1" align="center" border="1">
	<tr>
		<td align="left" width="660">
			 <a href="../user/index_new.jsp">Dashboard</a> |  <a href="../society/noticeboard.jsp">Notice Board </a>|  <a href="../user/complaints.jsp">Complaints </a>
		</td>
	</tr>
</table>




