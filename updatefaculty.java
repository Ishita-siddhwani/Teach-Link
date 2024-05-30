

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/updatefaculty")
public class updatefaculty extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public updatefaculty() {
        super();
        
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String email=request.getParameter("address");
		String mobile=request.getParameter("mobile");
		String address=request.getParameter("email");
		String qual=request.getParameter("qual");
		String sub=request.getParameter("sub");
		String exp=request.getParameter("exp");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/j720","root","root");
			String qr="update faculty set name=?,email=?,mobile=?,address=?,qual=?,sub=?,exp=? where id=?";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(8, id);
			ps.setString(1, name);
			ps.setString(2, address);
			ps.setString(3, mobile);
			ps.setString(4, email);
			ps.setString(5, qual);
			ps.setString(6, sub);
			ps.setString(7, exp);
			
			
			int i=ps.executeUpdate();
			out.println(i+" faculty updated");
			con.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
