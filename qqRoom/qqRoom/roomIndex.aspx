<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="roomIndex.aspx.cs" Inherits="qqRoom.roomIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="./jquery/dist/jquery.min.js"></script>
    <script src="./iscroll-5.1.3/build/iscroll-probe.js"></script>
    <link rel="stylesheet" href="./index.css">
    <script src="./bootstrap/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="./bootstrap/dist/css/bootstrap.min.css">

    <script>
        $(function () {
            document.onselectstart = function () {
                return false;
            };
            $("#username").text(document.cookie.split("=")[1].split(",")[1].split(":")[1]
                .slice(1, -1));

            $("#logout").click(function () {
                window.location.href = "/login"
            });

            function getContents() {
                var arr = [];
                var li = "";
                $.ajaxSettings.async = false;
                $.get("/getAllActive.ashx", function (data) {
                    if (data) {
                        arr = JSON.parse(data);
                        for (var i = arr.length-1;i >0;   i--) {
                            li += `<li class="f-single f-s-s">
                                      ${arr[i].activeCon}------- ${arr[i].username}|${arr[i].activeTime}
                                 </li>`;
                        }
                    } else {
                        li += '<li class="f-single f-s-s">空间暂无动态</li>';
                    }
                })
                return li;
            }

            function appendContent(content) {
                var ul = document.getElementById('Content');
                ul.insertAdjacentHTML("afterbegin",content);
            }

            // 初始化body高度
            document.body.style.height = Math.max(document.documentElement.clientHeight, window
                .innerHeight || 0) + 'px';

            appendContent(getContents());

            var pullDown = document.querySelector("#PullDown"),
                pullUp = document.querySelector("#PullUp"),
                isPulled = false; // 拉动标记

            var myScroll = new IScroll('#MyScroller', {
                probeType: 3,
                mouseWheel: true,
                preventDefault: false,
                fadeScrollbars: true
            });

            myScroll.on('scroll', function () {
                var height = this.y,
                    bottomHeight = this.maxScrollY - height;

                // 控制下拉显示
                if (height >= 60) {
                    pullDown.style.display = "block";
                    isPulled = true;
                    return;
                } else if (height < 60 && height >= 0) {
                    pullDown.style.display = "none";
                    return;
                }
            });

            myScroll.on('scrollEnd', function () { // 滚动结束
                if (isPulled) { // 如果达到触发条件，则执行加载
                    isPulled = false;
                    myScroll.refresh();
                }
            });

            $("#submit").click(function () {
                if ($("[name=message]").val()) {
                    $.get("/submit.ashx", {
                        activeCon: $("[name=message]").val(),
                        username: document.cookie.split("=")[1].split(",")[1].split(":")[1]
                            .slice(1, -1),
                        activeTime: new Date().toLocaleDateString() + new Date()
                            .toLocaleTimeString()
                    }, function (data) {
                        if (data) {
                            alert("动态发布成功");
                            myScroll.refresh();
                        }
                    })
                } else {
                    alert("请先填写您的动态");
                }
            });
        })
    </script>
</head>

<body>
    <div class="container">
        <div class="writeBox">
            <div class="sign">
                <div class="fl"><a id="username">xxx</a>，欢迎回来您的空间</div>
                <div class="fr"><button class="btn" id="logout">退出</button></div>
            </div>
            <form role="form" id="message">
                <textarea placeholder="请输入发布内容" name="message" cols="60" rows="5"></textarea>
                <li>
                    <button id="submit" class="btn btn-success">发布</button>
                </li>
            </form>
        </div>
        <hr>
        <div style="text-align: center">好友动态-下拉刷新</div>
        <div id="MyScroller" class="main">
            <div class="warpper">
                <div id="PullDown" class="scroller-pullDown" style="display: none;">
                    <img style="width: 20px; height: 20px;"
                        src="http://wewoor.github.io/js-lab/iscroll-pulldown-load/rolling.svg" />
                    <span id="pullDown-msg" class="pull-down-msg">下拉刷新</span>
                </div>
                <ul id="Content" class="dropdown-list">

                </ul>
            </div>
        </div>
    </div>
</body>

</html>