<%
	String femail=request.getParameter("femail");
	String semail=request.getParameter("semail");
%>
<form action="assigned.jsp">
Faculty Email:-<input type="text" name="femail" value="<%=femail%>" readonly /><br>
Student Email:-<input type="text" name="semail" value="<%=semail%>" readonly /><br>
Task:-<textarea rows="8" cols="50" name="task"></textarea><br>
<button>Assign Task</button>
</form>