<%
String semail=(String)session.getAttribute("semail");
%>
<%="welcome "+semail %>
<a href="Logout">Logout</a>
<%@page import="java.sql.ResultSet"%>
<%@page errorPage="error.jsp" %>
<%@include file="db.jsp" %>
<%
	String qr="select * from tasks where semail=?";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1, semail);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		%>
			<table align="center" border="1px">
			<th>Faculty Email</th>
			<th>Student Email</th>
			<th>Task</th>
			<th>Task Date</th>
			<th>Sub Date</th>
			<th>Grade</th>
			<th>Submission</th>
			
		<%
		do
		{
			String femail=rs.getString("femail");
			String task=rs.getString("task");
			String tdate=rs.getString("tdate");
			String submission=rs.getString("submission");
			String sdate=rs.getString("sdate");
			String grade=rs.getString("grade");
			%>
			<tr>
			<td><%=femail %></td>
			<td><%=semail %></td>
			<td><%=task %></td>
			<td><%=tdate %></td>
			<td><%=sdate %></td>
			<td><%=grade %></td>
			<form action="submitstudenttask.jsp">
			<td>
			<input type="hidden" name="femail" value="<%=femail %>" >
			<input type="hidden" name="semail" value="<%=semail %>" >
			<input type="hidden" name="tdate" value="<%=tdate %>" >
			<input type="hidden" name="task" value="<%=task %>" >	
			<textarea rows="15" cols="50" name="submission">
			<%=submission %>
			</textarea>
			<td><button>Submit Answer</button></td>
			</form>
			
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