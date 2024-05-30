<%@page errorPage="error.jsp" %>
<%@include file="db.jsp" %>
<%
	String roll=request.getParameter("roll");
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String mob=request.getParameter("mob");
	String address=request.getParameter("address");
	String branch=request.getParameter("branch");
	String year=request.getParameter("year");
	String sem=request.getParameter("sem");
	String pwd=request.getParameter("pwd");
	String qr="insert into student value(?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1, roll);
	ps.setString(2, name);
	ps.setString(3, address);
	ps.setString(4, mob);
	ps.setString(5, email);
	ps.setString(6, branch);
	ps.setString(7, year);
	ps.setString(8, sem);
	ps.setString(9, pwd);
	int i=ps.executeUpdate();
	out.println(i+" record added");
	con.close();
%>