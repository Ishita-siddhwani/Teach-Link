<%@page errorPage="error.jsp" %>
<%@include file="db.jsp" %>
<%
	String email=request.getParameter("email");
	String qr="delete from schedule where email=?";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1, email);
	int i=ps.executeUpdate();
	RequestDispatcher rd=request.getRequestDispatcher("ShowSchedule.jsp");
	rd.include(request, response);
	out.println(i+" schedule deleted");
	con.close();
%>