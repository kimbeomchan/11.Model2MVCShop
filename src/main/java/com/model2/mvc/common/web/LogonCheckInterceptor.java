package com.model2.mvc.common.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.model2.mvc.service.domain.User;


public class LogonCheckInterceptor implements HandlerInterceptor {

	///Field

	///Constructor
	public LogonCheckInterceptor(){
		System.out.println("\nCommon :: "+this.getClass()+"\n");
	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		System.out.println("\n[ LogonCheckInterceptor start........]");

		HttpSession session = request.getSession(true);
		User user = (User)session.getAttribute("user");

		if(   user != null   )  {
			String uri = request.getRequestURI();

			if( uri.indexOf("addUser") != -1 || uri.indexOf("login") != -1 ||
					uri.indexOf("checkDuplication") != -1 ){
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				System.out.println("[ 로그인 상태.. 로그인 후 불필요 한 요구.... ]");
				System.out.println("[ LogonCheckInterceptor end........]\n");
				return false;
			}

			System.out.println("[ 로그인 상태 ... ]");
			System.out.println("[ LogonCheckInterceptor end........]\n");
			return true;

		}else{

			String uri = request.getRequestURI();

			if( uri.indexOf("addUser") != -1 || uri.indexOf("login") != -1 ||
					uri.indexOf("checkDuplication") != -1 ){
				System.out.println("[ 로그 시도 상태 .... ]");
				System.out.println("[ LogonCheckInterceptor end........]\n");
				return true;
			}

			request.getRequestDispatcher("/index.jsp").forward(request, response);
			System.out.println("[ 로그인 이전 ... ]");
			System.out.println("[ LogonCheckInterceptor end........]\n");

			return false;
		}
	}
}//end of class
