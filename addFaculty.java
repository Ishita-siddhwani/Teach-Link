

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

@WebServlet("/addFaculty")
public class addFaculty extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public addFaculty() {
        super();
        
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String mobile=request.getParameter("mobile");
		String email=request.getParameter("email");
		String qual=request.getParameter("qual");
		String sub=request.getParameter("sub");
		String exp=request.getParameter("exp");
		String pwd=request.getParameter("pwd");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/j720","root","root");
           String qr="insert into faculty values(?,?,?,?,?,?,?,?,?)";
           PreparedStatement ps=con.prepareStatement(qr);
           ps.setString(1, id);
           ps.setString(2, name);
           ps.setString(3, address);
           ps.setString(4, mobile);
           ps.setString(5, email);
           ps.setString(6, qual);
           ps.setString(7, sub);
           ps.setString(8, exp);
           ps.setString(9, pwd);
         int i =ps.executeUpdate();
         out.println(i+" record added");
         con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}

}
