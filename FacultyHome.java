

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/FacultyHome")
public class FacultyHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public FacultyHome() {
        super();
        
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		out.println("<h1>Welcome to Faculty Home</h1>");	
		HttpSession session=request.getSession();
		String femail=(String)session.getAttribute("femail");//downcasting
		out.println("<body style='background-color:#99ccff;'>");
		out.println("welcome "+femail);
		out.println("<a href=Logout>Logout</a>");
	
		
	}

}
