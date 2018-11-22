

import java.io.IOException;


import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daniel.util.DbUtil;


public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static Connection connection;
    


    	public Login() {
    	    		connection = DbUtil.getConnection();
    	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		java.sql.Statement loginSt =null;
		java.sql.ResultSet loginRs = null;
		PrintWriter out;
		RequestDispatcher rd=null;
		
		
		try {
			
			out = response.getWriter(); 
			String username = request.getParameter("email-login");
			String password = request.getParameter("password-login");
			loginSt = connection.createStatement();
			loginRs = loginSt.executeQuery("select * from registeredusers where email='"+username+"' and password='"+password+"'");
			if(loginRs.next())
			{
				String id = loginRs.getString("sno");
				HttpSession session = request.getSession();
				
			session.setAttribute("loginId", id);
			

			session.setAttribute("USER","FACULTY");
			session = request.getSession();
			session.setAttribute("USER_NAME",loginRs.getString("name") );
			session.setAttribute("EMAIL_ID", request.getParameter("email-login"));
			session.setAttribute("REGISTER_NUMBER",loginRs.getString("register"));
			session.setAttribute("CONTACT_NUMBER",loginRs.getString("phone"));
			session.setAttribute("CLASS_NAME",loginRs.getString("dept"));
			session.setAttribute("TERM", "0");
			session.setAttribute("ROLE","FACULTY");
			session.setAttribute("USER_CATEGORY", "Faculty");
				session.setMaxInactiveInterval(1800);
			
				response.sendRedirect("class/index.jsp");
				
				
			}
			else {
				response.sendRedirect("christLogin.jsp?action=loginFailed");
				System.out.println("NOT Able to fetch the record from data base ");
				
			}	
		}
		catch(SQLException se)
		{
			se.printStackTrace();
		}
		catch(NullPointerException e)
		{
			e.printStackTrace();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}/*
		finally {
			if(loginSt!=null)
				try {
					loginSt.close();
					
				}catch (SQLException e) {
				e.printStackTrace();
				
			}
		}*/
		
		
		
	}

}
