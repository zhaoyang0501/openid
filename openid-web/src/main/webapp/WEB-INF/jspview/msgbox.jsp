<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>  
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - 首页示例四</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.staticfile.org/font-awesome/4.4.0/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.min.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg top-navigation">

<div id="wrapper">
    <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom white-bg">
            <nav class="navbar navbar-static-top" role="navigation">
                <div class="navbar-header">
                    <button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse" class="navbar-toggle collapsed" type="button">
                        <i class="fa fa-reorder"></i>
                    </button>
                    <a href="#" class="navbar-brand">基于openid的留言板系统</a>
                </div>
                <div class="navbar-collapse collapse" id="navbar">
                    <ul class="nav navbar-nav">
                       
                        <li class="dropdown">
                            <a aria-expanded="false" role="button" href="#" class="dropdown-toggle" data-toggle="dropdown">
                               欢迎[${currentUser.weiboId }]登录 <span class="caret"></span></a>
                            <ul role="menu" class="dropdown-menu">
                                <li>
                                    <a href="">退出</a>
                                </li>
                            </ul>
                        </li>

                    </ul>
                    <ul class="nav navbar-top-links navbar-right">
                        <li>
                            <a href="login.html">
                                <i class="fa fa-sign-out"></i> 退出
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        
<div class="wrapper wrapper-content  animated fadeInRight article">
    <div class="row">
        <div class="col-lg-10 col-lg-offset-1">
            <div class="ibox">
                <div class="ibox-content">

                    <div class="row">
                        <div class="col-lg-12">

                            <h2>评论：</h2>
                            <div class="social-feed-box">
                                <div class="social-avatar">
                                    <a href="" class="pull-left">
                                        <img alt="image" src="http://ozwpnu2pa.bkt.clouddn.com/a1.jpg">
                                    </a>
                                    <div class="media-body">
                                        <a href="#">
                                            逆光狂胜蔡舞娘
                                        </a>
                                        <small class="text-muted">17 小时前</small>
                                    </div>
                                </div>
                                <div class="social-body">
                                    <p>
                                        好东西，我朝淘宝准备跟进，1折开卖 </p>
                                </div>
                            </div>
                            <div class="social-feed-box">
                                <div class="social-avatar">
                                    <a href="" class="pull-left">
                                        <img alt="image" src="http://ozwpnu2pa.bkt.clouddn.com/a2.jpg">
                                    </a>
                                    <div class="media-body">
                                        <a href="#">
                                            避雷范儿
                                        </a>
                                        <small class="text-muted"> 16 小时前</small>
                                    </div>
                                </div>
                                <div class="social-body">
                                    <p>
                                        第一个真的好美 就是噪音太大了 挺唯美的意境瞬间变成工厂了 </p>
                                </div>
                            </div>
                            <div class="social-feed-box">
                                <div class="social-avatar">
                                    <a href="" class="pull-left">
                                        <img alt="image" src="http://ozwpnu2pa.bkt.clouddn.com/a3.jpg">
                                    </a>
                                    <div class="media-body">
                                        <a href="#">
                                            kamppi
                                        </a>
                                        <small class="text-muted"> 6 小时前</small>
                                    </div>
                                </div>
                                <div class="social-body">
                                    <p>
                                        好美的装置艺术，第二个让我想起了海中缓缓游动的鲸鱼。 </p>
                                </div>
                            </div>
                            <div class="social-feed-box">
                                <div class="social-avatar">
                                    <a href="" class="pull-left">
                                        <img alt="image" src="http://ozwpnu2pa.bkt.clouddn.com/a5.jpg">
                                    </a>
                                    <div class="media-body">
                                        <a href="#">
                                            kamppi
                                        </a>
                                        <small class="text-muted">6 小时前</small>
                                    </div>
                                </div>
                                <div class="social-body">
                                    <p>
                                        “Flylight 的灯管并不固定，由一套软件控制：每一个灯管都根据与其它灯管的互动进行移动，就像一群真正的鸟群一样。”
                                        好像介绍的描述不对，灯管是固定的，控制的只是点亮和熄灭的时间，模拟成一团亮点移动 </p>
                                </div>
                            </div>


                        </div>
                        
                        <div class='col-lg-12' style="padding-top: 30px">
                        
			                        	
								<form class="form-horizontal">
										  <div class="form-group">
										    <label for="inputEmail3" class="col-sm-2 control-label">内容</label>
										    <div class="col-sm-10">
										      <textarea class="form-control" rows="3"></textarea>
										    </div>
										  </div>
									  
									 
										  <div class="form-group">
										    <div class="col-sm-offset-2 col-sm-10">
										      <button type="submit" class="btn btn-default">提交</button>
										    </div>
										  </div>
								</form>
                        </div>
                    </div>
					
					
					
					
                </div>
            </div>
        </div>
    </div>

</div>
        <div class="footer">
            <div class="pull-right">
                By：
                <a href="http://www.zi-han.net" target="_blank">zihan's blog</a>
            </div>
            <div>
                <strong>Copyright</strong> H+ &copy; 2014
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.staticfile.org/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</body>

</html>
