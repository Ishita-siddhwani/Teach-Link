<%@page import="java.sql.ResultSet"%>
<%@page errorPage="error.jsp" %>
<%@include file="db.jsp" %>
<%
    String email = request.getParameter("email");
    String pwd = request.getParameter("pwd");
    String qr = "select * from student where email=? and pwd=?";
    PreparedStatement ps = con.prepareStatement(qr);
    ps.setString(1, email);
    ps.setString(2, pwd);
    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
        session.setAttribute("semail", email);
        response.sendRedirect("StudentHome.jsp");
    } else {
        // Move the JavaScript alert before the include
        out.println("<script>window.alert('Invalid Email and Password');</script>");
        RequestDispatcher rd = request.getRequestDispatcher("student.html");
        rd.include(request, response);
    }
    con.close();
%>
