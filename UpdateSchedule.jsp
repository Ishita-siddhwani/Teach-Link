<%@page import="java.util.Date"%>
<%@page errorPage="error.jsp" %>
<%@include file="db.jsp" %>
<%
	String email=request.getParameter("email");
	String branch=request.getParameter("branch");
	String year=request.getParameter("year");
	
	
	
	
	String qr="update student set name=?,address=?,mob=?,email=?,branch=?,year=?,sem=?,pwd=? where roll=?";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(9, email);
	ps.setString(1, branch);
	ps.setString(2, year);
	
	
	int i=ps.executeUpdate();
	RequestDispatcher rd=request.getRequestDispatcher("showstudent.jsp");
	rd.include(request, response);
	out.println("<script>window.alert('Details updated');</script>");
	con.close();
%>