<%@page import="java.sql.ResultSet"%>
<%@page errorPage="error.jsp" %>
<%@include file="db.jsp" %>
<%
	String femail=(String)session.getAttribute("femail");//downcasting
	out.println("welcome "+femail);
	String qr="select roll,student.name,student.mob,student.email,student.branch,student.year,student.sem from student,schedule where student.branch=schedule.branch and student.year=schedule.year and schedule.email=?";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1, femail);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		%>
			<table align="center" border="1px">
			<th>Roll</th>
			<th>Name</th>
			<th>Mobile</th>
			<th>Email</th>
			<th>Branch</th>
			<th>Year</th>
			<th>Sem</th>
		<%
		do
		{
			String roll=rs.getString("roll");
			String name=rs.getString("name");
			String mob=rs.getString("mob");
			String semail=rs.getString("email");
			String branch=rs.getString("branch");
			String year=rs.getString("year");
			String sem=rs.getString("sem");
			%>
			<tr>
			<td><%=roll %></td>
			<td><%=name %></td>
			<td><%=mob %></td>
			<td><%=semail %></td>
			<td><%=branch %></td>
			<td><%=year %></td>
			<td><%=sem %></td>
			<td><a href="taskassign.jsp?femail=<%=femail %>&semail=<%=semail %>">assign task</a></td>
			<td><a href="viewtasks.jsp?femail=<%=femail %>&semail=<%=semail %>">view task</a></td>
			</tr>
			<%
		}while(rs.next());
}
else
{
	out.println("no records found");
}
con.close();
%>
</table>