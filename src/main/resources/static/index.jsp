<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
  <title>Model2 MVC Shop</title>
  <style>
    .container {
      display: flex;
      flex-direction: column;
      height: 100vh;
    }
    .top {
      height: 80px;
    }
    .bottom {
      display: flex;
      flex-grow: 1;
    }
    .left {
      width: 160px;
      height: calc(100vh - 80px);
    }
  </style>
</head>

<body>

<div class="container">

  <div class="top">
    <iframe src="/layout/top.jsp" style="width:100%;height:100%;" scrolling="NO"></iframe>
  </div>

  <div class="bottom">
    <div class="left">
      <iframe src="/layout/left.jsp" style="width:100%;height:100%;" scrolling="NO"></iframe>
    </div>

    <div class="right" style="flex-grow :1;">
      <!-- 이 iframe에 동적으로 페이지를 로드할 수 있습니다. -->
      <iframe name ="rightFrame" src="" style ="width : 100%; height : 100%;" scrolling = "auto"></iframe >
    </div >

  </div >
</div >
</body>
</html >
