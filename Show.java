

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Show")
public class Show extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/j720","root","root");
			String qr="select * from faculty";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qr);
			if(rs.next())
			{
				out.println("<table align=center border=1px >");
				out.println("<th>Id</th><th>Name</th><th>Address</th><th>Mob</th><th>Email</th><th>Qualification</th><th>Subjects</th><th>Exprience</th>");
				do
				{
					String id=rs.getString("id");
					String name=rs.getString("name");
					String address=rs.getString("address");
					String mob=rs.getString("mobile");
					String email=rs.getString("email");
					String qul=rs.getString("qual");
					String sub=rs.getString("sub");
					String exp=rs.getString("exp");
					out.println("<tr>");
					out.println("<form action=updatefaculty>");
					out.println("<td>");
					out.println(id+"<input type=hidden name=id value="+id+" />");
					out.println("</td>");
					out.println("<td>");
					out.println("<input type=text name=name value="+name+" />");
					out.println("</td>");
					out.println("<td>");
					out.println("<input type=text name=address value="+address+" />");
					out.println("</td>");
					out.println("<td>");
					out.println("<input type=number name=mob value="+mob+" />");
					out.println("</td>");
					out.println("<td>");
					out.println("<input type=email name=email value="+email+" />");
					out.println("</td>");
					out.println("<td>");
					out.println("<input type=text name=qul value="+qul+" />");
					out.println("</td>");
					out.println("<td>");
					out.println("<input type=text name=sub value="+sub+" />");
					out.println("</td>");
					out.println("<td>");
					out.println("<input type=text name=exp value="+exp+" />");
					out.println("</td>");
					out.println("<td>");
					out.println("<button>Update</button>");
					out.println("</td>");
					out.println("</form>");
					out.println("<td>");
					out.println("<a href=deletefaculty?id="+id+">Delete</a>");
					out.println("</td>");
					out.println("</tr>");
				}while(rs.next());
				out.println("</table>");
			}
			else
			{
				out.println("no records found");
			}
			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
