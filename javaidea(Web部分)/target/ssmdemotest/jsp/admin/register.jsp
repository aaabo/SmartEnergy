<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>智慧能源系统注册</title>
<link rel="stylesheet" href="{pageContext.request.contextPath}../../css/admin/loginstyle.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
</head>
<body>
	<div id="clouds">
		<div class="cloud x1"></div>
		<div class="cloud x2"></div>
		<div class="cloud x3"></div>
		<div class="cloud x4"></div>
		<div class="cloud x5"></div>
	</div>
	<div class="container">
		<div id="login">


			<p>
				<span class="fontawesome-user"></span><input type="text" id="aname"
					size="20" placeholder="请在这里输入用户名" maxlength="20">
			</p>
			<p>
				<span class="fontawesome-lock"></span><input type="password"
					id="apwd" size="20" placeholder="请在这里输入密码" maxlength="20">
			</p>
			<p>
				<span class="fontawesome-lock"></span><input type="password"
					id="apwd2" size="20" placeholder="请再次输入密码" maxlength="20">
			</p>
			<p>
				<input type="button" id="auserregister" value="Registered">
			</p>


		</div>
	</div>

	<script type="text/javascript">
		$(function() {

			$("#auserregister")
					.on(
							"click",
							function() {
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

									$.ajax({
												url : "/SmartEnergy/auserregister.action",
												data : {
													aname : aname,
													apwd : apwd

												},
												success : function(res) {
													if (res == "ok") {
														alert("注册成功")
														window.location.href = "/SmartEnergy/login"
													} else {
														alert("用户名已存在，请重新输入")
														$(that).prop(
																'disabled',
																false)

													}
												}
											})
								} else {
									alert("两次密码不一致，请重新输入")
									$(that).prop('disabled', false)
								}

							})

		})
	</script>
</body>
</html>