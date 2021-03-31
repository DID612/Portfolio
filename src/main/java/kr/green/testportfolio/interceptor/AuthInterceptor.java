package kr.green.testportfolio.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Object user = session.getAttribute("user");
		if(user == null) {
			String referer = request.getHeader("Referer");
//			URI authpop = new URI("http://localhost:8080/testportfolio/authPop");
//			Desktop.getDesktop().browse(authpop);
			response.sendRedirect(referer);
		}
		return true;
	}
}
