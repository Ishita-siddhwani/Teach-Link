<%@page import="java.util.Date"%>
<%@page errorPage="error.jsp" %>
<%@include file="db.jsp" %>
<%
	String tdate=request.getParameter("tdate");
	Date dt=new Date();
	String sdate=dt.toString();
	String submission=request.getParameter("submission");
	String semail=request.getParameter("semail");
	String femail=request.getParameter("femail");
	String qr="update tasks set submission=?,sdate=? where femail=? and semail=? and tdate=?";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1, submission);
	ps.setString(2, sdate);
	ps.setString(3, femail);
	ps.setString(4, semail);
	ps.setString(5, tdate);
	int i=ps.executeUpdate();
	RequestDispatcher rd=request.getRequestDispatcher("StudentHome.jsp");
	rd.include(request, response);
	out.println("<script>window.alert('grade assigned sucessfully');</script>");
	con.close();
%>