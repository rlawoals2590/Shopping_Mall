<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="Stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<meta charset="UTF-8">
	<title>Shopping Mall</title>
	<style type="text/css">
    	.h1-atag:hover {
    		color: white;
    		text-decoration: none;
    	}
    </style>
</head>
<body>
	<nav><jsp:include page="nav.jsp"></jsp:include></nav>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3" style="font-size: 45px">의류 웹 쇼핑몰(느낀점?)</h1>
		</div>
	</div>
	<div class="container">
		<p>어…. 네 그 메인 화면에 뭘 넣어야 예쁠지 도저히 생각이 안 나서 이렇게 작은 JSP 프로젝트를 해보면서 느낀 점을 적기로 했습니다.
하면서 딱히 그렇게 힘든 점은 없었고요. 단지 JSP가 도저히 적응이 안 돼서 초반에 좀 헤맸습니다. 하하 다시는 시키지 않는 이상 JSP를 쓰지 않을 것 같네요. 후후
맞다 그리고 이번에 JSP 프로젝트 하면서 산업기사 실기 연습도 동시에 하는데 확실히 프로젝트를 하나 해보면 실력이 확 느는 걸 이번에 느꼈습니다.
방과 후에 산업기사 실기 가르쳐주시는 선배님께서 저 보고 잘한다고 칭찬도 해주셔서 좀 뿌듯했습니다. 다만 HTML, CSS는 아무리 해도 정이 안 쌓이더라고요..
네 이 정도면 느낀 점 다 쓴 거 같네요 하하하 아 맞다 그리고 이번에 맥북으로 개발해보니까 확실히 맛있습니다. 이래서 사람들이 개발은 맥북 맥북 하는 이유를 알겠더라고요.
팬이 없어서 소음도 거의 없긴한데 개발 좀 하다보면 손바닥이 뜨끈뜨끈 해지더라구요 지금도 그럽니다 하하 그렇게 대단한걸 하진 않았는데 하면서 재밌었습니다 하하 다음엔 조를 짜서
조 끼리 프로젝트를 해보는 것도 재밌을 것 같네요.. 그럼 이만..
		</p>	
	</div>
</body>
<footer><jsp:include page="footer.jsp"></jsp:include></footer>
</html>