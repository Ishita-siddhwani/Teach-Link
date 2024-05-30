

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/deletefaculty")
public class deletefaculty extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public deletefaculty() {
        super();
        
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String id=request.getParameter("id");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/j720","root","root");
			String qr="delete from faculty where id=?";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1, id);
			int i=ps.executeUpdate();
			out.println(i+ "record deleted");
		}
		catch(Exception e){
			e.printStackTrace();
		}
	
		
	}

}
