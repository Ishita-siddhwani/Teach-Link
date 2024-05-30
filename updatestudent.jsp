<%@page import="java.util.Date"%>
<%@page errorPage="error.jsp" %>
<%@include file="db.jsp" %>
<%
	String roll=request.getParameter("roll");
	String name=request.getParameter("name");
	String address=request.getParameter("address");
	String mob=request.getParameter("mob");
	String email=request.getParameter("email");
	String branch=request.getParameter("branch");
	String year=request.getParameter("year");
	String sem=request.getParameter("sem");
	String pwd=request.getParameter("pwd");
	
	
	
	String qr="update student set name=?,address=?,mob=?,email=?,branch=?,year=?,sem=?,pwd=? where roll=?";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(9, roll);
	ps.setString(1, name);
	ps.setString(2, address);
	ps.setString(3, mob);
	ps.setString(4, email);
	ps.setString(5, branch);
	ps.setString(6, year);
	ps.setString(7, sem);
	ps.setString(8, pwd);
	
	int i=ps.executeUpdate();
	RequestDispatcher rd=request.getRequestDispatcher("showstudent.jsp");
	rd.include(request, response);
	out.println("<script>window.alert('Details updated');</script>");
	con.close();
%>