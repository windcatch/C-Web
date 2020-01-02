<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="musicPlayer.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录页-zyw音乐网</title>
    <link rel="stylesheet" href="/Scripts/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/music.css">
    <link rel="stylesheet" href="https:////at.alicdn.com/t/font_1377778_9yibpn6fj8i.css">
    <script src="/Scripts/jquery-3.4.1.min.js"></script>
    <script src="/Scripts/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="/login.js"></script>
    
</head>
<body style="background-image: url(https://www.catchwindblog.com/content/templates/dy_monkey/img/bg.gif);
    background-size: 10%;
    background-repeat: repeat;">
    <div class="container" style="margin:150px auto">
        <form  class="form" style="
    padding-left: 317px;
    padding-right: 133px;
">
            <div class="form-group" >
                <div>
                    <label class="control-label" for="username" style="color:white" >用户名</label>
                </div>               
                <div style="width:70%">
                    <input class="form-control"  type="text" name="username" placeholder="请输入您的用户名" />            
                </div>
            </div>
            <div class="form-group">
                <div>
                    <label class="control-label" for="password" style="color:white">密码</label>
                </div>
                <div style="width:70%">
                    <input class="form-control" type="password" name="password" placeholder="请输入您的密码" />        
                </div>
            </div>
            <button type="button" class="btn btn-default" id="loginIn">登录</button>
        </form>
    </div>
</body>
</html>
