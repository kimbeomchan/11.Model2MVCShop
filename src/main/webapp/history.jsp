<%@ page contentType="text/html; charset=utf-8" %>

<html>
<head>
<title>열어본 상품 보기</title>
</head>

<body>
	당신이 열어본 상품을 알고 있다
<br>
<br>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	
	String history = null;
	
	Cookie[] cookies = request.getCookies();
	
	
	
	if (cookies!=null) {
		System.out.println("cookies1 : " + cookies);
		for (int i = 0; i < cookies.length; i++) {  // 3
			Cookie cookie = cookies[i];
			System.out.println("cookies1 : " + cookies);
			if (cookie.getName().equals("history")) {
				history = cookie.getValue();
				System.out.println("history : " + history);
			}
		}
		
		if (history != null) {
			String[] h = history.split("/");
			for (int i = 0; i < h.length; i++) {
				if (!h[i].equals("null")) {
%>
	<a href="/getProduct.do?prodNo=<%=h[i]%>&menu=search"	target="rightFrame"><%=h[i]%></a>
<br>
<%
				}
			}
		}
	}
%>

</body>
</html>