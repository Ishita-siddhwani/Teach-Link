<%
	String email=request.getParameter("email");
%>
<form action="AddFacultySchedule.jsp">
	<input type="hidden" name="email" value=<%=email %> >
	Branch<input type="text" name="branch" /><br>
	Year<input type="number" name="year" /><br>
	<button>Add New Schedule</button>
</form>