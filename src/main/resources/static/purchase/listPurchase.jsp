<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script type="text/javascript">
	function fncGetPageList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
	   	document.detailForm.submit();
	}
	
	$(function () {
		$(".ct_list_pop td:nth-child(3)").on("click", function() {
			var tranNo = $(this).data('tranno');
			
			$("input[name='tranNo']").val(tranNo);
			$("form").attr("method", "POST").attr("action", "/purchase/getPurchase").submit();
		});
	})
	
	
	
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" >
<input type="hidden" name="tranNo" />
<input type="hidden" name="prodNo" value="${purchase.purchaseProd.prodNo}"/>

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">
			��ü  ${resultPage.totalCount}  �Ǽ�,	���� ${resultPage.currentPage} ������
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="50">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��<br><h7>(��ǰ Click:: ������)</h7></td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ȭ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
		<td class="ct_line02"></td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}" >
		<c:set var="i" value="${ i + 1 }" />
	
	<tr class="ct_list_pop">
		<td align="center">
			${ i }
		</td>
		<td></td>
		
		<td align="center" data-tranno="${purchase.tranNo}">
			<%-- <a href="/purchase/getPurchase?tranNo=${purchase.tranNo}"></a> --%> 
			${purchase.purchaseProd.prodName}
		<td/>
		
		<td align="center">
			<a href="/product/getUser?userId=${user.userId}">${user.userId}</a>
		</td>
		<td></td>
		
		<td align="center">${purchase.receiverName}</td>
		<td></td>
		
		<td align="center">${purchase.receiverPhone}</td>
		<td></td>
		
		<td align="center">	���� ${purchase.tranCode}
			<c:choose>
				<c:when test = "${fn:trim(purchase.tranCode) == '1'}" >
					���ſϷ� �����Դϴ�. 
				</c:when>
				<c:when test = "${fn:trim(purchase.tranCode) == '2'}">
					����� �����Դϴ�. 
					<a href="/updateTranCode.do?prodNo=${purchase.purchaseProd.prodNo}&tranCode=3">���ǵ���</a>
				</c:when>
				<c:when test = "${fn:trim(purchase.tranCode) == '3'}">
					��ۿϷ� �����Դϴ�. 
				</c:when>
			</c:choose>
		</td>	
		<td></td>
<!-- 		<td align="left">
			�̿ϼ�
		</td> -->
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	</c:forEach>
	
</table>
<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
			<input type="hidden" id="currentPage" name="currentPage" value=""/>
			
			<jsp:include page="../common/pageNavigator.jsp" />		
			
		</td>
	</tr>
</table>
<!-- PageNavigation End... -->
</form>

</div>

</body>
</html>