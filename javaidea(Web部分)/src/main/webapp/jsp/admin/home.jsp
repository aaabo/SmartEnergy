<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<title>智慧能源系统主页</title>
<link href="{pageContext.request.contextPath}../../css/admin/cssMain/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<link rel="stylesheet" href="{pageContext.request.contextPath}../../css/admin/cssMain/style.css" type="text/css"
	media="all" />
<link rel="stylesheet" href="{pageContext.request.contextPath}../../css/admin/cssMain/font-awesome.css"
	type="text/css" media="all" />
<link rel="stylesheet" href="{pageContext.request.contextPath}../../css/admin/cssMain/colorbox.css"
	type="text/css" media="all" />
	<style>
	.content_input {
	border: 0;
	outline: 0;
}
	.fanye {
	float: right;
}

</style>

</head>
<body>
	<div class="header-w3layoutstop">
		<div class="container">
			<div class="hdr-w3left navbar-left">
				<p>&nbsp;</p>
			</div>
			<div>
				<p>&nbsp;</p>
			</div>
		</div>
	</div>
	<!-- navigation -->
	<div class="nav-links">
		<nav class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/SmartEnergy/admin.action"><h1>智慧能源管理</h1></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav link-effect">
					<li class="active"><a href="/SmartEnergy/admin.action">主页</a></li>
					<li><a href="/SmartEnergy/energy.action">能源信息</a></li>
					<li><a href="/SmartEnergy/environment.action">环境信息</a></li>
					<li><a href="/SmartEnergy/manage.action">用户管理（${userInfo.aname}）</a></li>
				</ul>
			</div>
		</div>
		</nav>
	</div>
	<div class="w3layouts-banner-slider">
		<div class="container">
			<div class="slider">
				<div class="callbacks_container">
					<ul class="rslides callbacks callbacks1" id="slider4">
						<li>
							<div class="top-agileits-banner">
								<div class="agileits-banner-info">
									<h3>智慧能源管理系统</h3>
								</div>
								<div class="agileinfo-social-grids">
									<a href="#">&nbsp;</a> <a href="#">&nbsp;</a> <a href="#">&nbsp;</a>
									<a href="#">&nbsp;</a>
								</div>
								<div class="clearfix"></div>
							</div>
						</li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<div class="services">
		<div class="container">
			<div class="ser-wthree">
				<div class="services-agileinfo">
					<div class="col-sm-4 col-xs-6 services-w3grids">
						<div class="ser-agile">
							<div class="services-icon hvr-radial-in">
								<i class="fa fa-anchor" aria-hidden="true"></i>
							</div>
							<h4>安全</h4>
						</div>
					</div>
					<div class="col-sm-4 col-xs-6 services-w3grids">
						<div class="ser-agile">
							<div class="services-icon hvr-radial-in">
								<i class="fa fa-line-chart" aria-hidden="true"></i>
							</div>
							<h4>智能</h4>
						</div>
					</div>
					<div class="col-sm-4 col-xs-6 services-w3grids">
						<div class="ser-agile">
							<div class="services-icon hvr-radial-in">
								<i class="fa fa-check-square-o" aria-hidden="true"></i>
							</div>
							<h4>可靠</h4>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="portfolio">
		<div class="container">
			<div class="w3ls-title">
				<h3 class="agileits-title w3title1">设备信息</h3>
				<div id="shebeiliebiao" class="row nav_des">
			<div class="col-md-12">
				<table class="table table-striped">
					<tr>
						<td>编号</td>
						<td>设备名称</td>
						<td>设备地址</td>
						<td>详情</td>
						<td>删除</td>
						<td>修改</td>	
					</tr>
					<c:forEach items="${devicesList }" var="item">
						<tr>
							<td>${item.device_id }</td>
							<td><input class="device_name content_input"
								value="${item.device_name }"></td>
							<td><input class="address content_input"
								value="${item.address }"></td>
						
							<td>
								<button deviceId="${item.device_id}" type="button"
									class="btn btn-primary detDeviceBtn">详情</button>
							</td>
							<td>
								<button deviceId="${item.device_id}" type="button"
									class="btn btn-primary delDeviceBtn">删除</button>
							</td>
							<td>
								<button deviceId="${item.device_id }" type="button"
									class="btn btn-primary updateBtn">修改</button>
							</td>
						</tr>
					</c:forEach>
				</table>
				     <div class="fanye">
					  <ul class="pagination">
						<li><a href="#">&laquo;上一页</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">下一页&raquo;</a></li>
						<td><button type="button" class="btn btn-default addDevice">添加</button></td>
					  </ul>
				    </div>
			    </div>	
		      </div>
		   </div>
		</div>
	</div>
	
	
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">设备详情</h4>
            </div>
            <div class="modal-body">
            <h4>设备编号</h4>
					<div class="text-primary device_id">设备编号</div>
			<h4>设备名称</h4>
					<div class="text-primary device_name">设备名称</div>
			<h4>设备地址</h4>
					<div class="text-primary address">设备地址</div>
			<h4>创建时间</h4>
					<div class="text-primary dtime">创建时间</div>

</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
	
	
	
	

<!-- 模态框（Modal） -->
<div class="modal fade" id="tianjia" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加设备</h4>
            </div>
            <div class="modal-body">
            
            <div class="input-group">
			<span class="input-group-addon">设备名称</span>
			<input type="text" class="form-control" id="device_name" placeholder="请输入设备名称">
		</div>
		<div class="input-group">
			<span class="input-group-addon">设备地址</span>
			<input type="text" class="form-control" id="address" placeholder="请输入设备地址">
		</div>
            
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="addDevice">确认添加</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
<script type="text/javascript">
$(function() {
	
	$(".delDeviceBtn").on("click", function() {
		

		if (confirm("确认是否删除？")) {

			var device_id = $(this).attr("deviceId")
			var that = this
			//alert(device_id)
			$.ajax({
				//访问后台的地址
				url : "/SmartEnergy/delDeviceById.action",
				//携带的数据
				data : {
					id : device_id
				},

				//成功回调函数，后台响应之后会执行
				success : function(res) {
					if (res == "ok") {
						$(that).parent().parent().remove()
					}
				}
			})
		}

	})
	
	
		$(".updateBtn").on("click", function (){
			var device_name = $(this).parent().parent().find(".device_name").val()
			var address = $(this).parent().parent().find(".address").val()
			var device_id = $(this).attr("deviceId")
			console.log(device_id,device_name,address)
			$.ajax({
				url: "/SmartEnergy/updateDevice.action",
				data: {
					device_name: device_name,
					address: address,
					device_id: device_id
				},
				success: function (res){
					if (res == "ok")
					{
						alert("修改成功")
					}
				}
			})
		})
		
		
			$(".detDeviceBtn").on("click", function() {
				var device_id = $(this).attr("deviceId")

				//alert(device_id)

				$.ajax({
					//访问后台的地址
					url : "/SmartEnergy/detDeviceById.action",
					//携带的数据
					data : {
						id : device_id
					},

					//成功回调函数，后台响应之后会执行
					success : function(res) {
						console.log(res)
						$(".device_id").html(res.device_id)
						$(".device_name").html(res.device_name)
						$(".address").html(res.address)
						$(".dtime").html(res.dtime)
						$("#myModalLabel").html(device_id+"号设备信息详情")
						$('#myModal').modal()

					}
				})

			})

			
		$(".addDevice").on("click", function() {
			$('#tianjia').modal()
				
			})
			
		$("#addDevice").on("click", function() {
			//alert("123")	
			$(this).prop('disabled', true)
				var that = this
			var device_name = $("#device_name").val()
			var address = $("#address").val()
			//alert(device_name)	
			if(device_name!=""&&address!=""){
				$.ajax({
					url : "/SmartEnergy/addDevice.action",
					data : {
						device_name : device_name,
						address : address

					},
					success : function(res) {
						if (res == "ok") {
							alert("添加成功")
							window.location.href = "/SmartEnergy/admin.action"
						} else {
							alert("添加失败")
							$(that).prop('disabled', false)
						

						}
					}
				})
			}
			else{
				alert("设备名称或设备地址为空")
				$(that).prop('disabled', false)
			}
			})
		
	
	
})




</script>
</html>