package cn.staryu.interceptor;

import cn.staryu.pojo.DevUser;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SysInterceptor extends HandlerInterceptorAdapter {

	private Logger logger = Logger.getLogger(SysInterceptor.class);

	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception{
		logger.debug("SysInterceptor preHandle ==========================");
		/*HttpSession session=request.getSession();
		User user=(User)session.getAttribute("userSession");
		if(user==null){
			response.sendRedirect(request.getContextPath()+"/norighterror.jsp");
		}*/

		HttpSession session = request.getSession();
		DevUser devUser = (DevUser) session.getAttribute("devUserSession");
		if(devUser == null ){
			response.sendRedirect(request.getContextPath()+"/403.jsp");
			return  false;
		}
		return true;
	}
}
