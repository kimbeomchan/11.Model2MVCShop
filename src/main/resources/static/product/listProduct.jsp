<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-2.1.4.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">


	var page = 1;

	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScript �̿�
	function fncGetPageList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
	   	//document.detailForm.submit();
	   	$("#currentPage").val(currentPage);
	   	$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
	}
	
	$(function () {
		$( "#tableBody" ).on("click" , ".ct_list_pop td:nth-child(3)", function() {
			var prodNo = $(this).data('prodno');
			var menu = "${menu}";
			
			if (menu == "search") {
				$("input[name='prodNo']").val(prodNo);
				$("form").attr("method", "POST").attr("action", "/product/getProduct").submit();
			} else if (menu == "manage") {
				$("input[name='prodNo']").val(prodNo);
				$("form").attr("method", "POST").attr("action", "/product/updateProductView").submit();
			}
		});	
	});
	
	$(function () {
		var prodNo = $(this).data('prodno');
		
		$("c:if:contains('����ϱ�')").on("click", function(){
			self.location.href = "/purchase/updateTranCode?prodNo=" + prodNo + "&tranCode=2&currentPage=" + ${resultPage.currentPage};
		});
		
	});
	
	$(function() {
		$("td.ct_btn01:contains('�˻�')").on("click" , function() {
			fncGetPageList(1);
		});
	});
	 
	$(function () {
		$( "#tableBody" ).on( "mouseenter", ".ct_list_pop td:nth-child(3)" ,function() {
				var prodNo = $(this).data('prodno');
				console.log(prodNo);
	    		setTimeout(function() {
					$.ajax(
						{
							url : "/product/json/getProduct/" + prodNo ,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json" ,
								"Content-Type" : "application/json"
							},
							success : function(JSONData) {
								var file = JSONData.fileName.split(',')[0];
								var display = "<h3>"
													+ "��ǰ�� : " + JSONData.prodName + "<br/>"
													+ "��ǰ ������ : " + JSONData.prodDetail + "<br/>"
													+ "�������� : " + JSONData.manuDate + "<br/>"
													+ "�� �� : " + JSONData.price + " �� <br/>"
													+ "��ǰ �̹���  <br/>"
													+ "<img width='200' height='150' src = /images/uploadFiles/" + file + "/>"
													+ "</h3>";
								
								$("h3").remove();
								$("#"+JSONData.prodNo+"").html(display);
							}
						}		
					);
				}, 100);
			}
		);
		
		$( "#tableBody" ).on("mouseleave", ".ct_list_pop td:nth-child(3)", function() {
			$("h3").remove();
		});

		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
	});

	
	$(function(){
	    var availableTags = [];

	    $("input[name=searchKeyword]").autocomplete({
	        source: availableTags,
	        autoFocus: true,
	        messages: {
	            noResults: '',
	            results: function() {}
	        }
	    });

	    $("input[name=searchKeyword]").keyup(function(){
	        var searchKeyword = $(this).val();
	        var searchCondition = $("select[name=searchCondition]").val();

	        $.ajax({
	            url: "/product/json/listAutoProduct?searchCondition="+ searchCondition +"&searchKeyword=" + searchKeyword,
	            dataType: "json",
	            headers : {
	                "Accept" : "application/json",
	                "Content-Type" : "application/json"
	            },
	            success: function(data) {
	                availableTags = data; // �޾ƿ� �����ͷ� availableTags ������Ʈ
	                $("input[name=searchKeyword]").autocomplete("option", "source", availableTags); // Autocomplete�� source �ɼ��� ������Ʈ
	            }
	        });
	        
	    });
	    
	    
	    

	    $("#inputBox").on("focus", function() {
	        if (availableTags.length >= 0) {
	            $(this).autocomplete("search");
	        }
	    });
	});

	$(function(){
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
		var win = $(window);
		$(window).scroll(function() {
			
		    if($(window).scrollTop() >= $(document).height() - $(window).height()) {
		    	$.ajax({
		    		url: '/product/json/listProduct',
		    		type: 'POST',
		    		headers : {
						"Accept" : "application/json" ,
						"Content-Type" : "application/json"
					},
		    		data: JSON.stringify({ 
		    	        currentPage: ++page,  // ������ ��ȣ ����
		    	       	pageSize: 10,
		    	       	pageUnit: 1,
		    	    }),
		    	    contentType: "application/json",
		    	    dataType: 'json',
		    	    success: function(data) {
		    	    	var productList = data.list;
		    	    	var menu = "manage";
		    	    	var countNo = $("tr.ct_list_pop:last td:first").text();
		    	    	
		    	    	$.each(productList, function(index, product){
		    	    		var row = 
		    	    			"<tr class='ct_list_pop' id='list'>" +
		    	            	"<td align='center' height='100'>" + ++countNo + "</td>" +
		    	            	"<td></td>" +
		    	            	"<td align='left' data-prodno='" + product.prodNo + "'>" + product.prodName + "</td>" +
		    	            	"<td></td>" +
		    	            	"<td align='left'>" + product.price+ " ��</td>" +
		    	            	"<td></td>" +
		    	            	"<td align='left'>" + product.regDate+ "</td>" +
		    	            	"<td></td>" +
		    	            	"<td align='left'>" +
		    	            		(menu == 'manage' ? 
		    	                        (product.proTranCode.trim() == null ? '�Ǹ���' :
		    	                          (product.proTranCode.trim() == '1' ? '���ſϷ�' :
		    	                            (product.proTranCode.trim() == '2' ? '�����' :
		    	                              (product.proTranCode.trim() == '3' ? '��ۿϷ�' : '')))) : '') +
		    	                (menu == "search" ? (product.proTranCode.trim() == null ? "�Ǹ���" : "�ǸſϷ�") : '') +
		    	                "</td></tr>" +
		    	                "<tr>" +
		    	        		"<td id=" +  product.prodNo + " colspan='11' bgcolor='D6D7D6' height='5'></td>" +
		    	        		"</tr>";	
		    	        		
		    	    			$("#tableBody").append(row);		// �޾ƿ� ������ �߰�
		    	    		}
		    	    	);
		    	        
		    	    },
		    	    error: function() {
		    	    	alert("ERROR");
		    	    // ��û ���� �� ó���� ���� �ۼ�
		    	    }
		        });
		    }
		});
	});
	 
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm" >

<input type="hidden" name="prodNo" />
<input type="hidden" name="menu" value="${menu}"/>

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					
					<c:if test="${menu.equals('search')}" >
						��ǰ ��� ��ȸ
					</c:if>
					<c:if test="${menu.equals('manage')}" >
						��ǰ ����
					</c:if>
					
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0" ${search.searchCondition.equals("0") ? "selected" : "" } >��ǰ��ȣ</option>
				<option value="1" ${search.searchCondition.equals("1") ? "selected" : "" } >��ǰ��</option>
				<option value="2" ${search.searchCondition.equals("2") ? "selected" : "" } >��ǰ����</option>
			</select>
			<input 	type="text" name="searchKeyword" id="inputBox" value="${search.searchKeyword}" 
							class="ct_input_g" style="width:200px; height:19px" >
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						�˻�
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table id="table" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
<tbody id="tableBody" >
	<tr>
		<td colspan="11" >
			��ü ��ǰ :  ${resultPage.totalCount}  �Ǽ�<%-- ,	���� ${resultPage.currentPage} ������ --%>
			
		</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="5"></td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="500">��ǰ��<br>
			<h7>(��ǰ :: ������)</h7>
		</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="500">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="5"></td>
	</tr>

	<c:set var="i" value="0" />
	<c:forEach var="vo" items="${list}" >
		<c:set var="i" value="${ i + 1 }" />
	<tr id="list" class="ct_list_pop" >
		<td align="center" height="100">${ i }</td>
		<td></td>
		<td align="left" data-prodno="${vo.prodNo}"> ${vo.prodName}</td>
		<td></td>
		<td align="left">${vo.price} ��</td>
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
	</tr>
	
	
	<tr>
		<td id="${vo.prodNo}" colspan="11" bgcolor="D6D7D6" height="5"></td>
	</tr>	
	
	</c:forEach>
	</tbody>
</table>

</form>
</div>
</body>
</html>
