
//提交状态
function nextStatus(Id){
			top.jzts();
			var url = "<%=basePath%>pay/nextStatus.do?ORDER_ID="+Id+"&tm="+new Date().getTime();
			$.get(url,function(data){
					alert()
			});
}

/**
 * 取消订单
 */
function cancelOrder(){
	alert("取消订单")
}
/**
 * 支付订单
 */
function goPay(obj){
	alert(obj.id);
	var val=$("#"+obj.id).parents("name=[ORDER_NUM]").val();
	alert(val)
	alert("支付订单")
}
/**
 * 我已邮寄
 */
function alreadySent(){
	alert("我已邮寄")
}
/**
 * 修改订单
 */
function updateOrder(){
	alert("修改订单")
}

/**
 * 确认收货
 */
function confirmOrder(){
	alert("确认收货")
}
/**
 * 评价晒单
 */
function commentOrder(){
	alert("评价晒单")
}

/**
 * 删除订单
 */
function deleteOrder(){
	alert("删除订单")
}

