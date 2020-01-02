<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="qqRoom.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>登录QQ邮箱</title>
	<link rel="icon" type="images/png"
		href="https://www.catchwindblog.com/%E5%85%B6%E4%BB%96/QQ%E9%82%AE%E7%AE%B1%E7%99%BB%E5%BD%95%E9%A1%B5/img/qqmail_favicon_48h.png" />
	<style type="text/css">
		* {
			margin: 0;
			padding: 0;
			list-style-type: none;
		}

		.clearfix::after {
			/*在样式之后*/
			content: '';
			/* 添加一个空字符*/
			display: block;
			clear: both;
			/* 相当于在样式之后添加了一个块级元素，利用它来清除浮动*/
		}

		.header,
		.footer {
			height: 62px;
			line-height: 62px;
			background-color: rgb(239, 244, 250);
			border-bottom: 1px solid rgb(214, 223, 234);
		}

		.logo {
			margin-left: 30px;
			vertical-align: middle;
		}

		.rightMenu>li {
			float: left;
		}

		.rightMenu>li:not(:last-child)::after {
			content: "|";
			margin: 0 5px;
			color: #b6b6b6;
			font-size: 12px;
		}

		.rightMenu a {
			text-decoration: none;
			color: #1d5494;
			font-size: 12px;
			font-family: "微软雅黑";
		}

		.rightMenu {
			float: right;
			margin-right: 30px;
		}

		.footer {
			position: fixed;
			bottom: 0;
			/*脱流以后的元素宽度由内容撑开，不再是默认的百分之百，需要再设置*/
			width: 100%;
			border-top: 1px solid #d6dfea;
			border-bottom: 0;
			height: 32px;
			line-height: 32px;
			text-align: center;
		}

		.bottomMenu {
			float: none;
			display: inline-block;
			/*转为行内-块级元素，因为text-align居中是针对块级元素中的行内元素*/
		}

		.bottomMenu>li:last-child {
			font-size: 12px;
			color: #B6B6B6;
		}

		.content {
			position: fixed;
			top: 63px;
			width: 100%;
			bottom: 37px;
			overflow: auto;
			/*难点就是缩小时有滚轮 */
			text-align: center;
		}

		.innerBox {
			min-width: 1000px;
			display: inline-block;
			/*转为行间-块级元素，以便text-align：center*/
			margin-top: 70px;
		}

		.content_left {
			width: 560px;
			height: 420px;
			background: url(https://www.catchwindblog.com/%E5%85%B6%E4%BB%96/QQ%E9%82%AE%E7%AE%B1%E7%99%BB%E5%BD%95%E9%A1%B5/img/tg-chang1ea8a2.png);
			background-repeat: no-repeat;
			background-position: right bottom;
			float: left;
			text-align: left;
		}

		.content_left>h2 {
			color: #6f95c8;
			margin-bottom: 20px;
			margin-top: 40px;
		}

		.content_left>p {
			font-size: 14px;
			line-height: 1.9;
			/*行间距1.9倍*/
		}

		.content_right {
			width: 340px;
			height: 388px;
			border: 1px solid #a0b1c4;
			float: left;
			margin-left: 80px;
			position: relative;
		}

		.switchLoginType {
			height: 50px;
			border-bottom: 1px solid #a0b1c4;
			line-height: 50px;
		}

		.switchLoginType>a {
			width: 50%;
			display: inline-block;
			float: left;
			text-decoration: none;
			color: #999999;
		}

		.loginByQQ,
		.loginByWeChat {
			padding: 27px;
			/*利用盒子内边距将盒子内元素往内挤*/
			box-sizing: border-box;
			overflow: hidden;
			/*解决margin的穿透问题*/
			text-align: left;
			display: none;
		}

		.txt {
			width: 100%;
			height: 40px;
			margin-top: 10px;
			padding: 5px;
			box-sizing: border-box;
			/*为元素设定的宽度和高度决定了元素的边框盒。
				就是说，为元素指定的任何内边距和边框都将在已设定的宽度和高度内进行绘制。*/
		}

		#saveMe {
			margin-top: 10px;
		}

		.btnLogin {
			height: 40px;
			width: 284px;
			border: 0;
			background-color: #5a98de;
			color: white;
			font-size: 18px;
			letter-spacing: 10px;
			/*字间距可以用letter-spacing也可以用word-spacing*/
			margin-top: 10px;
		}

		.scanCodeFastLogin {
			margin-top: 10px;
			text-align: center;
			font-size: 12px;
		}

		.scanCodeFastLogin>a {
			text-decoration: none;
			color: #225592;
		}

		.forgetPwd {
			position: absolute;
			right: 27px;
			bottom: 27px;
			text-decoration: none;
			font-size: 12px;
			color: #225592;
		}

		.loginByWeChat {
			text-align: center;
		}

		.wechatImg {
			width: 180px;
			height: 180px;
			border: 1px solid lightgray;
		}

		.loginByWeChat>p {
			font-size: 12px;
			color: #959da6;
			margin-top: 10px;
		}

		.loginByWeChat>p:last-child {
			position: absolute;
			bottom: 27px;
			width: 100%;
			/*脱流之后的元素宽度不再是默认的100%而是由内容决定，所以重新设置宽度*/
			/*将宽度重新定义为100%之后才能再被父级padding挤压到中间*/
			left: 0;
		}

		#qq:target,
		#wechat:target {
			display: block;
		}
	</style>
	<script>
		window.onload = function () {
			window.location = '#qq';
		}
	</script>
</head>

<body>
	<div class="header">
		<a href="#">
			<img src="https://www.catchwindblog.com/%E5%85%B6%E4%BB%96/QQ%E9%82%AE%E7%AE%B1%E7%99%BB%E5%BD%95%E9%A1%B5/img/qqmail_logo_default_35h206ff1.png"
				class="logo" />
		</a>
		<!--右侧菜单-->
		<ul class="rightMenu clearfix">
			<li><a href="#">基本版</a></li>
			<li><a href="#">English</a></li>
			<li><a href="#">手机版</a></li>
			<li><a href="#">企业邮箱</a></li>
		</ul>
	</div>
	<!--内容-->
	<div class="content clearfix">
		<div class="innerBox">
			<div class="content_left">
				<h2>QQ邮箱，常联系！</h2>
				<p>2500年前，人们飞鸽传书</p>
				<p>183年前，莫尔斯发明了电报</p>
				<p>50年前，第一封电子邮件发出</p>
				<p>今天，QQ邮箱联系你、我、他</p>
			</div>
			<div class="content_right">
				<div class="switchLoginType">
					<a href="#wechat">微信登录</a>
					<a href="#qq">QQ登录</a>
				</div>
				<!--QQ登录-->
				<div class="loginByQQ" id="qq">
					<!--给与id为qq配合target-->
					<form action="/login.ashx">
						<input type="text" name="username" class="txt" placeholder="支持QQ号/邮箱/手机登陆" />
						<input type="password" name="password" class="txt" placeholder="QQ密码" />
						<input type="checkbox" id="saveMe" />
						<label for="saveMe">下次自动登录</label>
						<button class="btnLogin" type="submit">登录</button>
						<div class="scanCodeFastLogin">
							<a href="#"><img
									src="https://www.catchwindblog.com/%E5%85%B6%E4%BB%96/QQ%E9%82%AE%E7%AE%B1%E7%99%BB%E5%BD%95%E9%A1%B5/img/qrcode.png" />扫码快捷登录</a>
						</div>
						<a href="#" class="forgetPwd">忘记密码?</a>
					</form>
				</div>
				<!--微信登录-->
				<div class="loginByWeChat" id="wechat">
					<!--给与id为wechat配合target-->
					<img src="https://www.catchwindblog.com/%E5%85%B6%E4%BB%96/QQ%E9%82%AE%E7%AE%B1%E7%99%BB%E5%BD%95%E9%A1%B5/img/011s6Opdzk2RUakV.jpg"
						class="wechatImg" />
					<p>
						请使用微信扫描二维码登录
					</p>
					<p>
						微信与QQ账号的邮箱数据不互通
					</p>
				</div>
			</div>
		</div>
	</div>
	<!--底部的-->
	<div class="footer clearfix">
		<ul class="rightMenu bottomMenu">
			<!--底部与头部大多样式都是一样的-->
			<li><a href="#">关于腾讯</a></li>
			<li><a href="#">服务条款</a></li>
			<li><a href="#">隐私政策</a></li>
			<li><a href="#">客服中心</a></li>
			<li><a href="#">联系我们</a></li>
			<li><a href="#">帮助中心</a></li>
			<li>
				&copy;1998 - 2019 Tencent Inc. All Rights Reserved.
			</li>
		</ul>
	</div>
</body>

</html>