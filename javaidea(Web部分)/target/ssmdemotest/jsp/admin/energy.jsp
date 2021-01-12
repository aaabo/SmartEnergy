<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="Access-Control-Allow-Origin" content="*">
<!-- 引入 echarts.js -->
<script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<title>智慧能源系统能源信息</title>
<link href="{pageContext.request.contextPath}../../css/admin/cssMain/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<link rel="stylesheet" href="{pageContext.request.contextPath}../../css/admin/cssMain/style.css" type="text/css"
	media="all" />
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
					<li class="active"><a href="/SmartEnergy/energy.action">能源信息</a></li>
					<li><a href="/SmartEnergy/environment.action">环境信息</a></li>
					<li><a href="/SmartEnergy/manage.action">用户管理（${userInfo.aname}）</a></li>
				</ul>
			</div>
		</div>
		</nav>
	</div>
	<!-- /navigation -->
	<!-- banner-->
	<div class="w3layouts-banner-slider-1"></div>
	<!-- //banner -->
	<div style="width: 50%; margin-left: 25%; text-align: left">

		<table id="sampleTableA" class="table table-striped sampleTable">
			<thead>
				<tr>
					<th>设备编号</th>
					<th>设备名称</th>
					<th>用电量</th>
					<th>用水量</th>
					<th>时间</th>
					<th>详情</th>
				</tr>
			</thead>
			<tbody>
					<c:forEach items="${energysList }" var="item">
						<tr>
							<td>${item.device_id }</td>
							<td>${item.device_name}</td>
							<td>${item.electric}</td>
							<td>${item.water}</td>
							<td>${item.etime}</td>
						<td><button deviceId="${item.device_id}" type="button"
									class="btn btn-primary detEnergyBtn">详情</button></td>

						</tr>
					</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="footer-agile jarallax">
		<div class="container">
			<div class="footer-btm-agileinfo">
				<h1 style="height: 200px">&nbsp;</h1>
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
	
	
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="detEnergy" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">设备能源详情</h4>
				</div>
				<div class="modal-body" id="nyxq" style="width: 500px; height: 300px;">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
</body>


<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script
		src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		crossorigin="anonymous"></script>

<script type="text/javascript">








	$(function() {
		$(".detEnergyBtn").on("click", function() {
			
			var device_id = $(this).attr("deviceId")
			//alert(device_id)



			$.ajax({
					//访问后台的地址
					url : "/SmartEnergy/detEnergyById.action",
					//携带的数据
					data : {
						id : device_id
					},
					//成功回调函数，后台响应之后会执行
					success : function(res) {
						//console.log(res)
						 var myChart = echarts.init(document.getElementById('nyxq'));
					        // 指定图表的配置项和数据
					        var option = {
					        	    title: {
					        	        text: '折线图堆叠'
					        	    },
					        	    tooltip: {
					        	        trigger: 'axis'
					        	    },
					        	    legend: {
					        	        data: ['电量', '水量']
					        	    },
					        	    grid: {
					        	        left: '3%',
					        	        right: '4%',
					        	        bottom: '3%',
					        	        containLabel: true
					        	    },
					        	    toolbox: {
					        	        feature: {
					        	            saveAsImage: {}
					        	        }
					        	    },
					        	    xAxis: {
					        	        type: 'category',
					        	        boundaryGap: false,
					        	        data: res.etime
					        	    },
					        	    yAxis: {
					        	        type: 'value'
					        	    },
					        	    series: [
					        	        {
					        	            name: '电量',
					        	            type: 'line',
					        	            stack: '总量',
					        	            data: res.electric
					        	        },
					        	        {
					        	            name: '水量',
					        	            type: 'line',
					        	            stack: '总量',
					        	            data: res.water
					        	        },

					        	    ]
					        	};

					        // 使用刚指定的配置项和数据显示图表。
					        myChart.setOption(option);
					        $("#myModalLabel").html(device_id+"号设备能源详情")
						$('#detEnergy').modal()

					}

				})

		})
	})
</script>

</html>