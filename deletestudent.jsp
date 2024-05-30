<%@page errorPage="error.jsp" %>
<%@include file="db.jsp" %>
<%
	String roll=request.getParameter("roll");
	String qr="delete from student where roll=?";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1, roll);
	int i=ps.executeUpdate();
	RequestDispatcher rd=request.getRequestDispatcher("showstudent.jsp");
	rd.include(request, response);
	out.println(i+" student deleted");
	con.close();
%>