package com.kh.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.model.vo.Person;

/**
 * Servlet implementation class ELServlet
 */
@WebServlet("/el.do")
public class ELServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 데이터들을 담을 수 있는 jsp내장 객체 종류
		 * 1. ServletContext(application Scope)
		 * 		한 애플리케이션 당 단 1개 존재하는 객체
		 * 		이 영역에 데이터를 담으면 애플리케이션 전역에서 사용가능
		 * 		공유범위가 가장 큼(jsp/servlet/java)
		 * 2. HttpSession(session Scope)
		 * 		한 브라우저당 1개 존재하는 객체
		 * 		이 영역에 데이터를 담으면 jsp/servlet단에서 사용가능
		 * 		공유범위가 2번째로 큼
		 * 3. HttpServletRequest(request Scope)
		 * 		요청 때마다 매번 생성되는 객체
		 * 		이 영역에 데이터를 담으면 해당 request객체를 포워딩 받는 jsp에서만 사용가능
		 * 		공유범위가 응답jsp(혹은 응답servlet)
		 * 4. PageContext(page Scope)
		 * 		jsp마다 존재하는 객체
		 *  	공유범위가 가장작음(해당 그 페이지)
		 *  
		 *  위의 4개의 객체들에
		 *  데이터를 담을 때 : .setAttribute("키", 담고자하는 데이터)
		 *  데이터를 꺼낼 때 : .getAttribute("키") 반환값은 담겨있는 데이터(value)
		 *  데이터를 삭제 할때 : .removeAttribute("키")
		 */
		
		// requestScope에 담기
		request.setAttribute("classRoom", "B강의장");
		request.setAttribute("student", new Person("홍길동",20,"남자"));
		
		// sessionScope에 담기
		HttpSession session = request.getSession();
		session.setAttribute("academy", "kh정보교육원");
		session.setAttribute("teacher", new Person("강지원",24,"남자"));
		
		// requestScope와 sessionScope에 동일한 키값으로 데이터 담기
		request.setAttribute("scope", "request");
		session.setAttribute("scope", "session");
		
		// applicationScope에 담기
		ServletContext application = request.getServletContext();
		application.setAttribute("scope", "application");
		
		// response.sendRedirect("views/1_EL/01.el.jsp");
		// 응답페이지를 지정하여 포워딩 되도록 설정
		request.getRequestDispatcher("views/1_EL/01.el.jsp").forward(request, response);
		
		
		
	}

}
