
<%
	if(session.getAttribute("login") != "true"){
		
		session.setAttribute("msg_erro_login", "Usuario não autenticado, favor se autenticar!");
%>		
				<jsp:forward page="../login.jsp"></jsp:forward>			
			
<%
	}

%>
