<%@page import="java.sql.ResultSet"%>
<%@page errorPage="error.jsp" %>
<%@include file="db.jsp" %>
<%
	String qr="select * from student";
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(qr);
	if(rs.next())
	{
		%>
			<table align="center" border="1px">
			<th>Roll</th>
			<th>Name</th>
			<th>Address</th>
			<th>Mobile</th>
			<th>Email</th>
			<th>Branch</th>
			<th>Year</th>
			<th>Semester</th>
		<%
		do
		{
			String roll=rs.getString("roll");
			String name=rs.getString("name");
			String address=rs.getString("address");
			String mob=rs.getString("mob");
			String email=rs.getString("email");
			String branch=rs.getString("branch");
			String year=rs.getString("year");
			String sem=rs.getString("sem");
			%>
			<tr>
			<form action="updatestudent.jsp">
			<td><%=roll %><input type="hidden" name="roll" value="<%=roll %>"  /></td>
			<td><input type="text" name="name" value="<%=name %>"  /></td>
			<td><input type="text" name="address" value="<%=address %>"  /></td>
			<td><input type="number" name="mob" value="<%=mob %>"  /></td>
			<td><input type="email" name="email" value="<%=email %>"  /></td>
			<td><input type="text" name="branch" value="<%=branch %>"  /></td>
			<td><input type="text" name="year" value="<%=year %>"  /></td>
			<td><input type="text" name="sem" value="<%=sem %>"  /></td>
			<td><button>Update</button></td>
			</form>
			<td><a href="deletestudent.jsp?roll=<%=roll %>">Delete</a></td>
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