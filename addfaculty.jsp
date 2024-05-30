<%@page errorPage="error.jsp" %>
<%@include file="db.jsp" %>
<%
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String mob=request.getParameter("mob");
	String address=request.getParameter("address");
	String qualification=request.getParameter("qualification");
	String sub=request.getParameter("sub");
	String exp=request.getParameter("exp");
	String pwd=request.getParameter("pwd");
	String qr="insert into faculty value(?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1, id);
	ps.setString(2, name);
	ps.setString(3, address);
	ps.setString(4, mob);
	ps.setString(5, email);
	ps.setString(6, qualification);
	ps.setString(7, sub);
	ps.setString(8, exp);
	ps.setString(9, pwd);
	int i=ps.executeUpdate();
	out.println(i+" record added");
	con.close();
%>