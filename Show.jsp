<%@page import="java.sql.ResultSet"%>
<%@page errorPage="error.jsp" %>
<%@include file="db.jsp" %>
<%
	String qr="select * from faculty";
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(qr);
	if(rs.next())
	{
		%>
			<table align="center" border="1px">
			<th>Id</th>
			<th>Name</th>
			<th>Address</th>
			<th>Mobile</th>
			<th>Email</th>
			<th>Qualification</th>
			<th>Subjects</th>
			<th>Exprience</th>
		<%
		do
		{
			String id=rs.getString("id");
			String name=rs.getString("name");
			String address=rs.getString("address");
			String mob=rs.getString("mobile");
			String email=rs.getString("email");
			String qul=rs.getString("qual");
			String sub=rs.getString("sub");
			String exp=rs.getString("exp");
			%>
			<tr>
			<form action="updatefaculty">
			<td><%=id %><input type="hidden" name="id" value="<%=id %>"  /></td>
			<td><input type="text" name="name" value="<%=name %>"  /></td>
			<td><input type="text" name="address" value="<%=address %>"  /></td>
			<td><input type="number" name="mob" value="<%=mob %>"  /></td>
			<td><input type="email" name="email" value="<%=email %>"  /></td>
			<td><input type="text" name="qul" value="<%=qul %>"  /></td>
			<td><input type="text" name="sub" value="<%=sub %>"  /></td>
			<td><input type="text" name="exp" value="<%=exp %>"  /></td>
			<td><button>Update</button></td>
			</form>
			<td><a href="deletefaculty?id=<%=id %>">Delete</a></td>
			<td><a href="AddSchedule.jsp?email=<%=email %>">AddSchedule</a></td>
			<td><a href="ShowSchedule.jsp?email=<%=email %>">ViewSchedule</a></td>
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