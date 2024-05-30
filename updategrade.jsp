<%@page import="java.util.Date"%>
<%@page errorPage="error.jsp" %>
<%@include file="db.jsp" %>
<%
	String tdate=request.getParameter("tdate");
	String sdate=request.getParameter("sdate");
	String grade=request.getParameter("grade");
	String semail=request.getParameter("semail");
	String femail=request.getParameter("femail");
	String qr="update tasks set grade=? where femail=? and semail=? and tdate=? and sdate=?";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1, grade);
	ps.setString(2, femail);
	ps.setString(3, semail);
	ps.setString(4, tdate);
	ps.setString(5, sdate);
	int i=ps.executeUpdate();
	RequestDispatcher rd=request.getRequestDispatcher("FacultyHome.jsp");
	rd.include(request, response);
	out.println("<script>window.alert('grade assigned sucessfully');</script>");
	con.close();
%>