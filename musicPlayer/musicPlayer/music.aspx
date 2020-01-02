<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="music.aspx.cs" Inherits="musicPlayer.music" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>首页-zyw音乐网</title>
    <link rel="stylesheet" href="/Scripts/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/music.css">
    <link rel="stylesheet" href="https:////at.alicdn.com/t/font_1377778_9yibpn6fj8i.css">
    <script src="/Scripts/jquery-3.4.1.min.js"></script>
    <script src="/Scripts/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="/Scripts/art-template/lib/template-web.js"></script>
    <script src="/music.js"></script>
</head>
<body style="background-image: url(https://www.catchwindblog.com/content/templates/dy_monkey/img/bg.gif);
    background-size: 10%;
    background-repeat: repeat;">
        <div class="box">
        <div class="head" style="background-color: rgba(245,200,184,0.8);border:0">
            <div class="left">
                <img src="" alt="" class="pic">
                <span class="iconfont icon-bofang"></span>
            </div>
            <div class="right">
                <div class="r_top">
                    <span class="title"></span>
                    <span class="autor"></span>
                </div>
                <div class="r_middle">
                    <span class="lrc">欢迎登录 <a id="username"></a></span>
                </div>
                <div class="r_bottom">
                    <div class="progress"></div>
                    <div class="time">
                        <span class="cur_time">00:00</span><span class="duration">/00:00</span>
                    </div>
                    <span class="iconfont icon-yinliang-di"></span>
                    <span class="iconfont icon-youjiantou"></span>
                    <span class="iconfont icon-icon--"></span>
                </div>
            </div>
        </div>
        <audio src="" id="music" autoplay></audio>
    </div>
</body>
</html>
