

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daniel.util.DbUtil;



public class AdminLogin extends HttpServlet {
	int snum=0,login_flag=0;
	 String adminlevel="noadmin";

	private static final long serialVersionUID = 1L;
       
	

	private static Connection connection;
    
    public AdminLogin() {
   
    	connection = DbUtil.getConnection();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		java.sql.Statement loginSt =null;
		java.sql.ResultSet loginRs = null;
		PrintWriter out;
		RequestDispatcher rd=null;
		
			
			if(request.getParameterMap().containsKey("ADMIN_ID"))
			{
			
				try
				{	
				String login_email=request.getParameter("email-login");
				String password=request.getParameter("password-login");
				
				loginSt = connection.createStatement();
				loginRs=loginSt.executeQuery("select privilege,email from admin_list");
				
				while(loginRs.next())
				{
				
				out = response.getWriter(); 
				String dbemail=loginRs.getString("email"),
						passwd=request.getParameter("password-login"),
						password_checker;
						if(login_email.equals(dbemail))
						{
							
							login_flag++;
							loginSt = connection.createStatement();
							loginRs=loginSt.executeQuery("select password,privilege from admin_list where email ='"+login_email+"'");
							while(loginRs.next())
							{
							password_checker=loginRs.getString("password");
							if(password_checker.equals(passwd))
							{
								adminlevel=loginRs.getString("privilege");
							}
							else
							{
								System.out.println("Wrong password");
							}
							}
						
						}

			if(login_flag==0)
			{
				System.out.println("User not registered");
			}
			}
			}catch(Exception e)
			{
				System.out.println(e);
			}	
			}
			if(adminlevel.equals("noadmin"))
			{
				System.out.println("No Session Created");
			}
			else
			{
			HttpSession session = request.getSession();
			session.setAttribute("USER","ADMIN");
			session.setMaxInactiveInterval(1800);

													
													if(adminlevel.equals("super_admin"))
													{
													
													session = request.getSession();
													session.setAttribute("REGISTER_NUMBER", request.getParameter("ADMIN_ID"));
													session.setAttribute("USER_NAME", "SUPER ADMIN");
													session.setAttribute("ROLE", "SUPER ADMIN");
													session.setAttribute("EMAIL_ID", request.getParameter("login_email"));
													session.setAttribute("USER_CATEGORY", "SUPER ADMIN");
													response.sendRedirect("class/index.jsp");
													}
													if(adminlevel.equals("admin_class"))
													{
													
													session = request.getSession();
													session.setAttribute("REGISTER_NUMBER", request.getParameter("ADMIN_ID"));
													session.setAttribute("USER_NAME", "CLASS ADMIN");
													session.setAttribute("ROLE", "CLASS ADMIN");
													session.setAttribute("EMAIL_ID", request.getParameter("login_email"));
													session.setAttribute("USER_CATEGORY", "CLASS ADMIN");
													response.sendRedirect("class/index.jsp");
													response.sendRedirect("class/index.jsp");
													}
													if(adminlevel.equals("admin_cews"))
													{
													
													session = request.getSession();
													session.setAttribute("REGISTER_NUMBER", request.getParameter("ADMIN_ID"));
													session.setAttribute("USER_NAME", "CEWS ADMIN");
													session.setAttribute("ROLE", "CEWS ADMIN");
													session.setAttribute("EMAIL_ID", request.getParameter("login_email"));
													session.setAttribute("USER_CATEGORY", "CEWS ADMIN");
													response.sendRedirect("class/index.jsp");
													}
													if(adminlevel.equals("admin_chal"))
													{
													
													session = request.getSession();
													session.setAttribute("REGISTER_NUMBER", request.getParameter("ADMIN_ID"));
													session.setAttribute("USER_NAME", "CHAl ADMIN");
													session.setAttribute("ROLE", "CHAL ADMIN");
													session.setAttribute("EMAIL_ID", request.getParameter("login_email"));
													session.setAttribute("USER_CATEGORY", "CHAL ADMIN");
													response.sendRedirect("class/index.jsp");
													}
													if(adminlevel.equals("admin_caw"))
													{
													
													session = request.getSession();
													session.setAttribute("REGISTER_NUMBER", request.getParameter("ADMIN_ID"));
													session.setAttribute("USER_NAME", "CAW ADMIN");
													session.setAttribute("ROLE", "CAW ADMIN");
													session.setAttribute("EMAIL_ID", request.getParameter("login_email"));
													session.setAttribute("USER_CATEGORY", "CAW ADMIN");
													response.sendRedirect("class/index.jsp");
													}
	}
	}
}
													
							
			
		
						


