<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=euc-kr" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

		<td></td>
		<td align="left" data-prodno="${vo.prodNo}"> ${vo.prodName}</td>
		<td></td>
		<td align="left">${vo.price}</td>
		<td></td>
		<td align="left">${vo.regDate}</td>
		<td></td>
		<td align="left">
		
			<c:if test="${menu.equals('manage')}">
				<c:if test="${vo.proTranCode == null}" >
					�Ǹ���
				</c:if>
				<c:if test="${vo.proTranCode.trim() == '1'}" >
					���ſϷ�
				</c:if>
				<c:if test="${vo.proTranCode.trim() == '2'}" >
					�����
				</c:if>
				<c:if test="${vo.proTranCode.trim() == '3'}" >
					��ۿϷ�
				</c:if>
			</c:if>
			
			<c:if test="${menu.equals('search')}">
				${vo.proTranCode == null ? '�Ǹ���' : '�ǸſϷ�'}
			</c:if>
		</td>
			