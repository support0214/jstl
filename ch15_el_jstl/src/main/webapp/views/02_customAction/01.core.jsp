<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL Core Library</h1>
	
	<h3>1. 변수(속성==attribute)</h3>
	<pre>
	* 변수 선언과 동시에 초기화(c:set var="" value="" [scope=""])
	- 변수 선언하고 초기값을 대입해주는 기능을 제공
	- 해당 변수들 어떤 scope에 담아둘껀지 지정가능함 (생략시 pageScope에 담김)
	  => 해당 scope에 setAttribute를 통해 key-value형태로 데이터를 담아놓는 것이라고 생각하면 됨
	  => c:set으로 선언된 변수는 EL로 접근해서 사용가능함(스크립팅원소로는 접근 불가)
	  
	- 변수 타입을 별도로 지정않함
	- 초기값을 반드시 지정해야됨	  
	</pre>
	<c:set var="num1" value="10" />
	<c:set var="num2" value="20" scope="request" />
	
	num1 변수 값 : ${ num1 } <br>
	num2 변수 값 : ${ num2 } <br>
	
	<%-- num1 변수 값 : <%= num1 %> <br> 스크립팅원소로는 접근 불가 --%>
	<%-- <c:set var="result" value="num1+num2" scope="request" /> 문자열 --%>
	<c:set var="result" value="${ num1 + num2 }" scope="session"/>
	
	10 + 20 = ${ result }<p/>
	
	pageScope.num1 : ${ pageScope.num1 }<br>
	requestScope.num2 : ${ requestScope.num2 }<br>
	sessionScope.result : ${ sessionScope.result }<br>
	requestScope.result : ${ requestScope.result }<p/>
	
	<!-- value속성대신 시작태그와 종료태그 사이에 초기값 지정 가능 -->
	<c:set var="result" scope="request">9999</c:set>
	
	requestScope.result : ${ requestScope.result }<p/>
	
	<hr>
	<pre>
	* 변수 삭제(c:remove var="제거하고자하는 변수명" [scope=""])
	- 해당 scope에서 변수를 찾아 제거하는 태그
	- scope 생략하면 모든 scope에서 해당 변수 모두 다 찾아서 제거함
	  => 해당 scope에 .removeAttribute를 통해 제거하는거라고 생각하면 됨
	</pre>
	
	삭제 전 result : ${ result }<p/>
	
	<%-- 1) 특정 scope지정해서 삭제<br>
	<c:remove var="result" scope="request"/>
	request에서 삭제 후 result : ${ result }<p/> --%>
	
	2) 모든 scope에서 삭제<p/>
	<c:remove var="result" />
	모두 삭제 후 result : ${ result }<p/>
	
	<hr>
	
	<pre>
	* 변수(데이터) 출력 (c:out value="출력하고자하는값" [default="기본값"] [escapeXml="true|false"])<br>
	  데이터를 출력하고자 할 때 사용하는 태그
	</pre>
	
	<c:out value="${ num1 }" /><br>
	<c:out value="${ result }" default="없음"/><p/>
	
	<c:set var="outTest" value="<b>출력테스트</b>" />
	
	<!-- escapeXml 생략시 기본값이 true -->
	<c:out value="${ outTest }" /><br> 
	<c:out value="${ outTest }" escapeXml="false"/><p/>
	
	<h3>2. 조건문(c:if test="조건식")</h3>
	<pre>
	- java의 if문과 같은 역할
	- 조건식은 test속성에 작성
	</pre>
	<%--
	<% if(num1 > num2) { %>
			<p>num1의 숫자가 크다</p>
			<p>num1의 숫자가 크다</p>
			<p>num1의 숫자가 크다</p>	
	<% } %>
	 --%>
	<c:if test="${ num1 gt num2 }">
		<b>num1이 num2보다 크다</b>
	</c:if>
	
	<c:if test="${ num1 le num2 }">
		<b>num1이 num2보다 작거나 같다</b>
	</c:if>
	
	<p/>
	
	<c:set var="str" value="안녕하세요" />
	
	<c:if test="${ str eq '안녕하세요' }">
		<h4>Hello world</h4>
	</c:if>
	
	<c:if test='${ str ne "안녕하세요" }'>
		<h4>Bye world</h4>
	</c:if>
</body>
</html>