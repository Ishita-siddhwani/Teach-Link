

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Flogin")
public class Flogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Flogin() {
        super();
        
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String email=request.getParameter("email");
		String pwd=request.getParameter("pwd");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/j720","root","root");
			String qr="select * from faculty where email=? and pwd=? ";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1, email);
			ps.setString(2, pwd);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				HttpSession session=request.getSession();//active session memory
				session.setAttribute("femail", email);//store value in session memory(upcasting)
				//Object femail=email;{internal working}
				response.sendRedirect("FacultyHome.jsp");
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("faculty.html");
				rd.include(request, response);
				out.println("<script>window.alert('Invalid Email and Password');</script>");
			}
			con.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	}


