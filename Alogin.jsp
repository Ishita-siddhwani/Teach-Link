<%
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");
if(id.equals("admin")&&pwd.equals("admin123"))
{
	//session.setAttribute("id", id);
	//response.sendRedirect("adminhome.html");
	%>
	<jsp:forward page="adminhome.html"></jsp:forward>
	<%
}
else
{
	RequestDispatcher rd=request.getRequestDispatcher("admin.html");
	rd.include(request, response);
	out.println("Invalid id and password");
}
%>