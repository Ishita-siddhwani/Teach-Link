<%@page import="java.sql.ResultSet"%>
<%@page errorPage="error.jsp" %>
<%@include file="db.jsp" %>
<%
	String email=request.getParameter("email");
	String qr="select * from schedule where email=?";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1, email);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		%>
			<table align="center" border="1px">
			<th>Email</th>
			<th>Branch</th>
			<th>Year</th>
		<%
		do
		{
			String branch=rs.getString("branch");
			String year=rs.getString("year");
			%>
			<tr>
			<form action="UpdateSchedule.jsp">
			<td><input type="email" name="email" value="<%=email %>"  /></td>
			<td><input type="text" name="branch" value="<%=branch %>"  /></td>
			<td><input type="text" name="year" value="<%=year %>"  /></td>
			<td><button>Update</button></td>
			</form>
			<td><a href="deleteschedule.jsp?branch=<%=branch %>and year=<%=year %>">Delete</a></td>
                			
			
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