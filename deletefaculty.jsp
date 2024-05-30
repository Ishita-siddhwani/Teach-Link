<%@page errorPage="error.jsp" %>
<%@include file="db.jsp" %>
<%
	String id=request.getParameter("id");
	String qr="delete from faculty where id=?";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1, id);
	int i=ps.executeUpdate();
	RequestDispatcher rd=request.getRequestDispatcher("Show");
	rd.include(request, response);
	out.println(i+" faculty deleted");
	con.close();
%>