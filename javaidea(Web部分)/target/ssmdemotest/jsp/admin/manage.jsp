<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<title>用户管理</title>
<link href="{pageContext.request.contextPath}../../css/admin/cssMain/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<link rel="stylesheet" href="{pageContext.request.contextPath}../../css/admin/cssMain/style.css"
	type="text/css" media="all" />
<link rel="stylesheet" href="{pageContext.request.contextPath}../../css/admin/cssMain/font-awesome.css"
	type="text/css" media="all" />
<link rel="stylesheet" href="{pageContext.request.contextPath}../../css/admin/cssMain/colorbox.css"
	type="text/css" media="all" />
<!-- font -->
<link href="http://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>
<!-- //font -->
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
					<li><a href="/SmartEnergy/admin.action">主页</a></li>
					<li><a href="/SmartEnergy/energy.action">能源信息</a></li>
					<li><a href="/SmartEnergy/environment.action">环境信息</a></li>
					<li class="active"><a href="/SmartEnergy/manage.action">用户管理（${userInfo.aname}）</a></li>
				</ul>
			</div>
		</div>
		</nav>
	</div>
	<!-- /navigation -->
	<!-- banner-->
	<div class="w3layouts-banner-slider-1"></div>
	<!-- //banner -->
	<!-- contact -->

	<div class="contact">
		<div class="container">


			<div class="col-sm-6 contact-left">
				<input type="text" id="aname" placeholder="请输入用户名"> <input
					type="password" id="apwd" placeholder="请输入密码"> <input
					type="password" id="apwd2" placeholder="请再次输入密码">
				<div class="col-sm-6 contact-right">
					<input type="button" id="auserregister" value="新建用户">
				</div>
			</div>

			<div class="col-sm-6 contact-left">
				<input type="text" id="delaname" placeholder="请输入用户名">
				<div class="col-sm-6 contact-right">
					<input type="button" id="delAuserBtn" value="删除用户">
				</div>
			</div>

		</div>
	</div>
	<div class="contact">
		<div class="container">


			<div class="col-sm-6 contact-left">
			<input type="password" id="ypwd" placeholder="请输入原密码"> 
				<input type="password" id="upwd1" placeholder="请输入新密码"> <input
					type="password" id="upwd2" placeholder="请再次输入新密码">
					
				<div class="col-sm-6 contact-right">
					<input type="button" id="updataPwdBtn" value="更改密码">
				</div>
			</div>
			<div class="col-sm-6 contact-left">	
				<div class="col-sm-6 contact-right">
					<input type="button" id="exitAuser" value="安全退出">
				</div>
			</div>


		</div>
	</div>

	<div class="footer-agile jarallax">
		<div class="container">

			<div class="footer-btm-agileinfo">
				<h1 style="height: 50px">&nbsp;</h1>
				<div class="clearfix"></div>
			</div>
			<div class="footer-top-agileinfo">
				<div class="social-wthree-icons bnragile-icons">
					<ul>
						<li><a class="fa fa-facebook icon icon-border facebook">
						</a></li>
						<li><a class="fa fa-twitter icon icon-border twitter"> </a></li>
						<li><a class="fa fa-google-plus icon icon-border googleplus">
						</a></li>
						<li><a class="fa fa-dribbble icon icon-border dribbble">
						</a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		$(function() {

			$("#auserregister").on("click", function() {
				$(this).prop('disabled', true)
				var that = this
				var aname = $("#aname").val()
				var apwd = $("#apwd").val()
				var apwd2 = $("#apwd2").val()

				//alert(aname)
				//alert(apwd)
				//alert(apwd2)
				if (aname == '' || apwd == '') {
					alert("用户名或密码为空，请重新输入")
					$(that).prop('disabled', false)
				} else if (apwd == apwd2) {
					alert("用户名或密码合适")
					$.ajax({
						url : "/SmartEnergy/auserregister.action",
						data : {
							aname : aname,
							apwd : apwd
							

						},
						success : function(res) {
							if (res == "ok") {
								alert("注册成功")

							} else {
								alert("用户名已存在，请重新输入")
								$(that).prop('disabled', false)

							}
						}
					})
				} else {
					alert("两次密码不一致，请重新输入")
					$(that).prop('disabled', false)
				}

			})

			$("#delAuserBtn").on("click", function() {
				var aname = $("#delaname").val()

				//确认框
				if (confirm("确定要删除此" + aname + "用户吗？")) {

					$.ajax({
						//访问后台的地址
						url : "/SmartEnergy/delAuser.action",
						//携带的数据
						data : {
							aname : aname
						},

						success : function(res) {
							if (res == "ok") {
								alert("删除成功")
							} else {
								alert("用户不存在")
							}
						}
					})
				}
			})
			
			
			$("#updataPwdBtn").on("click", function (){
			$(this).prop('disabled', true)
			var that = this
			var aname = '${userInfo.aname}'
			var ypwd = $("#ypwd").val()
			var upwd1 = $("#upwd1").val()
			var upwd2 = $("#upwd2").val()
			if (aname == '' || upwd1 == '') {
			alert("用户名或密码为空，请重新输入")
			$(that).prop('disabled', false)
			} else if (upwd1 == upwd2) {
			$.ajax({
				url : "/SmartEnergy/updataPwd.action",
						data : {
							aname : aname,
							apwd : ypwd,
							upwd : upwd1
						},
						success : function(res) {
							if (res == "ok") {
							alert("修改成功，请重新登录")
							window.location.href = "/SmartEnergy/login"
						} 
							else {
							alert("原密码不正确，请重新输入")
							$(that).prop('disabled',false)
							}
						}
					})
				} 
			else {
				alert("两次密码不一致，请重新输入")
				$(that).prop('disabled', false)
					}			
			
			})
			
	$("#exitAuser").on("click",function(){  
		$.ajax({
			//访问后台的地址
			url : "/SmartEnergy/exitAuser.action",
			success : function(res) {
				alert("退出成功")
				window.location.href = "/SmartEnergy/login"
			}
		
		})
		
	})

		})
	</script>
</body>
</html>
