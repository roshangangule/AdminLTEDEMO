<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>JavaByKiran | User</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/skins/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<header class="main-header">
			<!-- Logo -->
			<a href="dashboard" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>JBK</b></span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>Java By Kiran</b></span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<div class="navbar-custom-menu">

					<ul class="nav navbar-nav">
						<li class="dropdown user user-menu"><a href="logout" class="">LOGOUT</a></li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="pull-left image">
						<img
							src="${pageContext.request.contextPath}/dist/img/user2-160x160.jpg"
							class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<p>${username}</p>
						<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
					</div>
				</div>
				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<li class="header">MAIN NAVIGATION</li>
					<li class="treeview"><a href="dashboard"> <i
							class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
					<li class="active"><a href="getlist"><i class="fa fa-user"></i>
							<span>Users</span></a></li>
					<li><a href="operator"><i class="fa fa-retweet"></i> <span>Operators</span></a></li>
					<li class="treeview"><a href="links"><i
							class="fa fa-external-link"></i> <span> Useful Links</span></a></li>
					<li class="treeview"><a href="downloads"> <i
							class="fa fa-download"></i> <span>Downloads</span></a></li>
					<li><a href="logout"><i class="fa fa-power-off"></i> <span>Logout</span></a></li>
				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Users</h1>
				<ol class="breadcrumb">
					<li><a href="dashboard"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li class="active">Users</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">User List</h3>
								<a href="adduser"><button
										class="btn btn-block btn-primary btn-sm pull-right"
										style="width: 100px;">Add User</button></a>
								<div class="box-tools"></div>
							</div>
							<%-- <%
								String message = null;
								message = (String) request.getAttribute("msg");
								if(message == null){
									
								}else{
									%>
										<p><%=message %></p>
									<% 
								}
							%> --%>

							<!-- /.box-header -->
							<div class="box-body table-responsive no-padding">
								<table class="table table-hover">
									<tr>
										<th>#</th>
										<th>Username</th>
										<th>Email</th>
										<th>Mobile</th>
										<th>Course</th>
										<th>Gender</th>
										<th>State</th>
										<th>Action</th>
									</tr>
									<%
										int i = 0;
									%>
									<c:forEach var="tempAdmin" items="${admins}">
										<%
											i++;
										%>
										<tr>
											<td><%=i%></td>
											<td>${tempAdmin.username}</td>
											<td>${tempAdmin.email}</td>
											<td>${tempAdmin.mobileNumber}</td>
											<td>${tempAdmin.course}</td>
											<td>${tempAdmin.gender}</td>
											<td>${tempAdmin.state}</td>
											<td><a href="delete?id=${tempAdmin.id}"><span
													class="label label-danger" data-toggle="tooltip"
													data-placement="top" title="Click to Delete"
													onclick="
													if('${tempAdmin.isDefault}' == 'Y'){
														return alert('You can not delete Default User')
													}
													return delete_user('${tempAdmin.id}')">Delete</span></a>
												| <a href="update?id=${tempAdmin.id}"><span
													class="label label-danger" data-toggle="tooltip"
													data-placement="top" title="Click to Update">Update</span></a>

											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Design for Selenium Automation Test</b> V 2.3.0
			</div>
			<strong>Copyright &copy; 2005-2019 <a
				href="https://www.javabykiran.com/" target="_blank">JavaByKiran</a>.
			</strong> All rights reserved.
		</footer>
		<!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<div class="example-modal">
		<div class="modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Modal Default</h4>
					</div>
					<div class="modal-body">
						<p>One fine body&hellip;</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default pull-left"
							data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- /.example-modal -->
	<!-- jQuery 2.1.4 -->
	<script
		src="${pageContext.request.contextPath}/pluginsjQuery/jQuery-2.1.4.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<!-- Bootstrap 3.3.5 -->
	<script
		src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	<!-- Morris.js charts -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script
		src="${pageContext.request.contextPath}/pluginsmorris/morris.min.js"></script>
	<!-- Sparkline -->
	<script
		src="${pageContext.request.contextPath}/pluginssparkline/jquery.sparkline.min.js"></script>
	<!-- jvectormap -->
	<script
		src="${pageContext.request.contextPath}/pluginsjvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/pluginsjvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<!-- jQuery Knob Chart -->
	<script
		src="${pageContext.request.contextPath}/pluginsknob/jquery.knob.js"></script>
	<!-- daterangepicker -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/pluginsdaterangepicker/daterangepicker.js"></script>
	<!-- datepicker -->
	<script
		src="${pageContext.request.contextPath}/pluginsdatepicker/bootstrap-datepicker.js"></script>
	<!-- Bootstrap WYSIHTML5 -->
	<script
		src="${pageContext.request.contextPath}/pluginsbootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<!-- Slimscroll -->
	<script src="../../pluginsslimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="../../pluginsfastclick/fastclick.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../../dist/js/app.min.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<%-- <script
		src="${pageContext.request.contextPath}/dist/js/pages/dashboard.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="${pageContext.request.contextPath}/dist/js/demo.js"></script>

	<!-- jQuery 2.1.4 --> --%>
	<script
		src="${pageContext.request.contextPath}/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<script>
		function delete_user() {
			if (!confirm("Are you sure you want to delete this user"))
				return false;

			$("#" + id).hide();
			alert("User deleted successfully.");
			return false;
		};
	</script>
</body>
</html>
