<%@page errorPage="error.jsp" %>
<%@include file="db.jsp" %>
<%

	String email=request.getParameter("email");
	String branch=request.getParameter("branch");
	String year=request.getParameter("year");
	String qr="insert into schedule(email,branch,year) values(?,?,?)";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1, email);
	ps.setString(2, branch);
	ps.setString(3, year);
	int i=ps.executeUpdate();
	RequestDispatcher rd=request.getRequestDispatcher("Show.jsp");
	rd.include(request, response);
	out.println("<script>window.alert('shedule added sucessfully');</script>");
	con.close();
%>