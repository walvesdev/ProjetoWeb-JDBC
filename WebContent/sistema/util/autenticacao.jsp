
<%
	if(session.getAttribute("login") != "true"){
		
		session.setAttribute("msg_erro_login", "Usuario n�o autenticado, favor se autenticar!");
%>		
				<jsp:forward page="../login.jsp"></jsp:forward>			
			
<%
	}

%>
