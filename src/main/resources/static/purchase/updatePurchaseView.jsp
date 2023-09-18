<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
<title>������������</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="../javascript/calendar.js">
</script>

<script type="text/javascript">

function fncUpdatePurchase(){
	//Form ��ȿ�� ����
 	var receiverName = document.detailForm.receiverName.value;
	var receiverPhone = document.detailForm.receiverPhone.value;
	var dlvyAddr = document.detailForm.dlvyAddr.value;

	if(receiverName == null || receiverName.length<1){
		alert("�������̸��� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(receiverPhone == null || receiverPhone.length<1){
		alert("�����ڿ���ó�� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(dlvyAddr == null || dlvyAddr.length<1){
		alert("�ּҴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
		
	alert("hiii")
	$("form").attr("method", "POST").attr("action", "/purchase/updatePurchase").submit();
}

$(function() {
	$("td.ct_btn01:contains('����')").on("click", function() {
		fncUpdatePurchase();
	});
})

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<form name="detailForm" >

<input type="hidden" name="tranNo" value="${purchase.tranNo}" />

<table style="border:1px solid black;margin-left:auto;margin-right:auto;" width="50%" height="50" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">������������</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<table style="border:1px solid black;margin-left:auto;margin-right:auto;" width="50%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="130" class="ct_write">
			�����ھ��̵� <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${purchase.buyer.userId}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="130" class="ct_write">
			���Ź�� <img	src="/images/ct_icon_red.gif" width="7" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<select 	name="paymentOption" class="ct_input_g" style="width:80px; height:20px" 
							onChange="document.detailForm.phone2.focus();">
							
				<option value="0" ${ ! empty purchase.paymentOption && purchase.paymentOption == "0" ? "selected" : ""  } >�ſ�ī��</option>
				<option value="1" ${ ! empty purchase.paymentOption && purchase.paymentOption == "1" ? "selected" : ""  } >�¶��� �Ա�</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="130" class="ct_write">
			�������̸� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="receiverName" value="${purchase.receiverName}"
						class="ct_input_g" style="width: 100px; height: 19px" maxLength="50"/>&nbsp;
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="130" class="ct_write">
			�����ڿ���ó <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="receiverPhone" value="${purchase.receiverPhone}"
						class="ct_input_g" style="width: 100px; height: 19px" maxLength="50"/>&nbsp;
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="130" class="ct_write">
			�������ּ� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="dlvyAddr" value="${purchase.dlvyAddr}"
						class="ct_input_g" style="width: 100px; height: 19px" maxLength="50"/>&nbsp;
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="130" class="ct_write">
			���ſ�û���� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="dlvyRequest" value="${purchase.dlvyRequest}"
						class="ct_input_g" style="width: 100px; height: 19px" maxLength="50"/>&nbsp;
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="130" class="ct_write">
			���������� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" readonly="readonly" name="dlvyDate" value="${purchase.dlvyDate}" 	
						class="ct_input_g" style="width: 100px; height: 19px" maxLength="10" minLength="6">&nbsp;
						<img 	src="../images/ct_icon_date.gif" width="15" height="15" 
									onclick="show_calendar('document.detailForm.dlvyDate', document.detailForm.dlvyDate.value)" />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01"	style="padding-top: 3px;">
						����
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif"width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<a href="javascript:history.go(-1)">���</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>

</body>
</html>