<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.model.vo.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>1. 기존 방식대로 스크립트릿과 표현식을 이용하여 각 scope에 담겨있는 값을 뽑아 화면에 출력</h3>
<%--
	<%
		// requestScope 받아오기		
		String classRoom = (String)request.getAttribute("classRoom"); // 형변환
		Person student = (Person)request.getAttribute("student");
		
		// sessionScope 받아오기
		String academy = (String)session.getAttribute("academy");
		Person teacher = (Person)session.getAttribute("teacher");
	%>
	학원명 : <%=academy %><p/>
	강의장 : <%=classRoom %><p/>
	선생님 : <%=teacher.getName() %>,<%=teacher.getAge() %>, <%=teacher.getGender() %> <p/>
	
	수강생정보 : 
	<ul>
		<li>이름 : <%=student.getName() %></li>
		<li>나이 : <%=student.getAge() %></li>
		<li>성별 : <%=student.getGender() %></li>
	</ul>
--%>

	<h3>2. EL을 이용하여 쉽게 해당 SCOPE에 저장된 값 출력</h3>
	<p>
		EL을 이용하여 getXXX을 통해 값을 빼올 필요없이 EL구문내에 키값만 제시하면 바로 접근가능<br>
		기본적으로 EL은 JSP내장객체를 구분하지 않고 자동으로 모든 내장객체에 키 값을 검색해서 존재하면 값을 가져옴
	</p>
	학원명 : ${ academy } <p/>
	강의장 : ${ classRoom } <p/>
	선생님 : ${ teacher.name }, ${ teacher.age }, ${ teacher.gender } <p/>
	
	수강생정보
	<ul>
		<li>이름 : ${ student.name }</li>
		<li>나이 : ${ student.age }</li>
		<li>성별 : ${ student.gender }</li>
	</ul>
	
	<h3>3. EL사용시 내장 객체들의 저장된 키값이 동일한 경우</h3>
	scope값 : ${ scope }<p/>
	<!-- 
		EL은 공유범위가 제일 작은 scope에서 부터 해당 키값을 검색함
		page -> request -> session -> application
		만일, 모든 영역에서 못찾을 경우 => 아무것도 출력안됨(오류안됨)
	 -->
	test값 : ${ test }<p/>
	
	<h3>4. 직접 scope를 지정하여 접근하기</h3>
	<%pageContext.setAttribute("scope", "page"); %>
	
	pageScope에 담긴 값 : ${ scope } 또는 ${ pageScope.scope }<p/>
	requestScope에 담긴 값 : ${ requestScope.scope }<p/>
	sessionScope에 담긴 값 : ${ sessionScope.scope }<p/>
	applicationScope에 담긴 값 : ${ applicationScope.scope }<p/><p/>
	
	잘못된 접근 : ${ sessionscope.classRoom }
</body>
</html>