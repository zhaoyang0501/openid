<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - 登录</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.staticfile.org/font-awesome/4.4.0/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.min.css?v=4.1.0" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/><![endif]-->
    <script>if (window.top !== window.self) {
        window.top.location = window.location;
    }</script>
    
    <style type="text/css">
	    .icons.qq {
	    background-position: 0 -85px;
	    background-size: 43px;
		}
	
	.icons {
	    background: url(https://www.processon.com/assets/images/login/login.png) no-repeat;
	    display: inline-block;
	    width: 42px;
	    height: 42px;
	}
	.icons.weibo {
    background-position: 0 -131px;
    background-size: 44px;
}
.icons.weixin {
    background-position: 0 0;
    background-size: 42px;
}
    </style>
</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>

        </div>
        <h3>基于openid的留言板系统</h3>

        <form class="m-t" role="form" action="index.html">
            <div class="form-group">
                <input type="email" class="form-control" placeholder="用户名" required="">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="密码" required="">
            </div>
            <button type="submit" class="btn btn-primary block full-width m-b">登 录</button>


            
            <div >
				<div class="sep"><div style="margin-top:-9px;"><label>第三方账号登录</label></div></div>
				<div style="position: relative;">
					<a href="#" class="icons weixin"></a>&nbsp;&nbsp;
					<a href="#"  class="icons qq"></a>&nbsp;&nbsp;
					
					<a href="https://api.weibo.com/oauth2/authorize?client_id=3881612511&amp;response_type=code&amp;redirect_uri=http://www.panzhaoyang.top/openid/weibo"  class="icons weibo"></a>&nbsp;&nbsp;
				
				</div>
				</div>

        </form>
    </div>
</div>
<script src="https://cdn.staticfile.org/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</body>

</html>

