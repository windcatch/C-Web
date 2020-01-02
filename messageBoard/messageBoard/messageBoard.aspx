﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="messageBoard.aspx.cs" Inherits="messageBoard.messageBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>欢迎来留言-留言板</title>
    <link rel="stylesheet" href="/prism.css">
    <link rel="stylesheet" href="/node_modules/bootstrap/dist/css/bootstrap.min.css">
    <script src="/node_modules/jquery/dist/jquery.min.js"></script>
    <script src="/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="/node_modules/jquery-validation/dist/jquery.validate.min.js"></script>
    <script src="/node_modules/jquery-validation/dist/localization/messages_zh.min.js"></script>
    <script src="/prism.js"></script>
    <script src="/node_modules/art-template/lib/template-web.js"></script>
    <style>
        * {
            list-style-type: none;
            padding: 0;
        }

        .header {
            width: 100%;
            height: 186px;
            background-image: url("/topbg.jpg");
            background-repeat: no-repeat;
            background-size: 100%;
        }

        body {
            background-color: #FBFCF6;
            color: #333;
        }

        .writeBox {
            border: 1px solid #f1f1f1;
            width: 100%;
            height: 270px;
        }

        .writeBox>.sign {
            width: 100%;
            height: 75px;
            padding: 0 80px;
        }

        .writeBox .fl {
            font-family: \5FAE\8F6F\96C5\9ED1;
            font-size: 16px;
            line-height: 75px;
            float: left;
        }

        div {
            margin: 0 auto;
            text-align: left;
            font: normal 12px/180% \5FAE\8F6F\96C5\9ED1;
        }

        .writeBox .fr {
            float: right;
        }

        .writeBox .fr>button {
            height: 27px;
            line-height: 27px;
            border: 1px solid #c0c0c0;
            display: inline-block;
            padding: 0 9px;
            margin-top: 22px;
            margin-right: 10px;
        }

        #message {
            text-align: center;
        }

        #message>textarea {
            width: 60%;
            padding: 0 8px;
            border: 1px solid #ddd;
            border-left: 2px solid #eceded;
            border-right: 2px solid #eceded;
            resize: none;
            outline: none;
            color: rgb(153, 153, 153);
        }

        .error {
            color: rgb(250, 14, 14);
        }

        .messageData {
            margin-top: 5px;
            width: 100%;
            float: left;
            border: 1px solid #f1f1f1;
            background-color: #fff;
        }

        .subItem {
            line-height: 24px;
            background-color: #fff;
            padding-bottom: 12px;
        }

        .subTitle {
            line-height: 40px;
            border-bottom: 1px solid #f1f1f1;
            padding: 0 15px;
            font-size: 18px;
            background-color: #fbfbfb;
        }

        .allMsg {
            font-size: 16px;
            line-height: 24px;
            margin: 0 auto;
            max-height: 500px;
            overflow: auto;
        }
    </style>
    <script>
        $(function () {
            paint();
            $("#username").text(document.cookie.split("=")[1].split(",")[1].split(":")[1]
                .slice(1, -1));
            $("#message").validate({
                rules: {
                    message: {
                        required: true,
                        maxlength: 255
                    }
                },
                messages: {
                    message: {
                        required: "提交留言不能为空",
                        maxlength: "留言内容不能超过255个字符"
                    }
                }
            });
            $("#logout").click(function () {
                var isTrue=window.confirm("你确定要退出当前用户吗？");
                if(isTrue){
                    document.cookie = "userInfo=; expires=Thu, 01 Jan 1970 00:00:00 GMT";
                    window.location.href = "/Login"
                }
            });
            $("#submit").click(function () {
                var isFalse = $("#message").valid();
                if (isFalse) {
                    $.get("/subMsg.ashx", {
                        msgInfo: $("#message>textarea").val(),
                        username: document.cookie.split("=")[1].split(",")[1].split(":")[1]
                            .slice(1, -1),
                        dateTime: new Date().toLocaleDateString() + new Date()
                            .toLocaleTimeString()
                    }, function (data) {
                        if (data == "true") {
                            alert("提交成功！");
                            paint();
                        }
                    });
                }
            });

            function paint() {
                $.get('/getMsg.ashx', function (data) {
                    var html = template("temp1", {
                        allMsg: JSON.parse(data)
                    });
                    $("#allMsg").html(html);
                });
            }
        })
    </script>
</head>

<body>
    <div class="header"></div>
    <div class="container">
        <div class="writeBox">
            <div class="sign">
                <div class="fl"><span id="username">xxx</span>,欢迎你</div>
                <div class="fr"><button class="btn" id="logout">退出</button></div>
            </div>
            <form role="form" id="message">
                <textarea placeholder="请填写留言内容" name="message" cols="60" rows="5"></textarea>
                <li>
                    <img id="submit" src="/icon11.jpg" style="cursor: pointer;">
                    <img src="/icon12.jpg" style="cursor: pointer;" onclick="$('#message').find('textarea').val('')">
                </li>
            </form>
        </div>
        <div class="messageData">
            <div class="subItem">
                <div class="subTitle">
                    留言板所有留言
                </div>
            </div>
            <div class="allMsg" id="allMsg">
            </div>
            <template id="temp1">
                {{each allMsg item index}}
                <pre><code class="language-json">{{item.msgCon}}   ——{{item.userName}}_{{item.dateTime}}</code></pre>
                {{/each}}
            </template>
        </div>
    </div>
</body>

</html>