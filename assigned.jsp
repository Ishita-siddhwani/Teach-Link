<%@page import="java.util.Date"%>
<%@page errorPage="error.jsp" %>
<%@include file="db.jsp" %>
<%
	String task=request.getParameter("task");
	Date dt=new Date();
	String tdate=dt.toString();
	String semail=request.getParameter("semail");
	String femail=request.getParameter("femail");
	String qr="insert into tasks(semail,femail,tdate,task) value(?,?,?,?)";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1, semail);
	ps.setString(2, femail);
	ps.setString(3, tdate);
	ps.setString(4, task);
	int i=ps.executeUpdate();
	RequestDispatcher rd=request.getRequestDispatcher("FacultyHome.jsp");
	rd.include(request, response);
	out.println("<script>window.alert('task assigned sucessfully');</script>");
	con.close();
%>