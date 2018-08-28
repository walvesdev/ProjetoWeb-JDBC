package util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/sistema/*")
public class LoginFilter implements Filter {

	public LoginFilter() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		HttpSession session = request.getSession();
		
		boolean isStaticResource =  request.getRequestURI().contains(request.getContextPath() + "/sistema/lib/");
		boolean isLoginPage =  request.getRequestURI().contains("login.jsp");
		
		
		if ((session.getAttribute("login") == "true") || isStaticResource || isLoginPage ){


			chain.doFilter(req, res);

			
		}else {
			session.setAttribute("msg_erro_login", "Usuário não autenticado, identifique-se por favor!");
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		}
		
		

	
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
