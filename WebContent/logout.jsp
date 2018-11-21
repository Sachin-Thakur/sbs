<%@ page import="java.util.*" %>

<%
	
	session.invalidate();
HttpSession nsession = request.getSession(false);
	response.sendRedirect("christLogin.jsp");
%>
<script type="text/javascript">
        history.pushState(null, null, document.URL);
        window.addEventListener('popstate', function () {
            history.pushState(null, null, document.URL);
        });
     </script>