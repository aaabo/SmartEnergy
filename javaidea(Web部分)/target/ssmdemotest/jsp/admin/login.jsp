<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>智慧能源系统登录</title>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<link rel="stylesheet" href="{pageContext.request.contextPath}../../css/admin/loginstyle.css">

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
					size="20" placeholder="请输入用户名" maxlength="20">
			</p>
			<p>
				<span class="fontawesome-lock"></span><input type="password"
					id="apwd" size="20" placeholder="请输入密码" maxlength="20">
			</p>
			<p>
				<input type="button" id="auserlogin" value="Sign In">
			</p>

			<p>
				Not a member? <a href="register"
					class="blue">Sign up now</a>
			</p>
		</div>
	</div>


	<script type="text/javascript">
		$(function() {

			$("#auserlogin").on("click", function() {
				$(this).prop('disabled', true)
				var that = this
				var aname = $("#aname").val()
				var apwd = $("#apwd").val()
				//alert(aname)
				//alert(apwd)
				if(aname!=""&&apwd!=""){
				$.ajax({
					url : "/SmartEnergy/auserLogin.action",
					data : {
						aname : aname,
						apwd : apwd

					},
					success : function(res) {
						if (res == "ok") {
							//alert("登录成功")
							window.location.href = "/SmartEnergy/admin.action"
						} else {
							alert("用户名与密码不匹配")
							$(that).prop('disabled', false)

						}
					}
				})
				}
				else{
					alert("用户名或密码为空")
					$(that).prop('disabled', false)
				}

			})

		})
	</script>
</body>
</html>