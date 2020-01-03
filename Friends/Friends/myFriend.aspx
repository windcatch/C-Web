<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myFriend.aspx.cs" Inherits="Friends.myFriend" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <title>Document</title>
   <script src="./jquery/dist/jquery.min.js"></script>
   <script src="./art-template/lib/template-web.js"></script>
   <script>
      $(function () {
         $("#friendList").on("click", '.rm', function (e) { //删除
            var isTrue = window.confirm("确定要删除这位好友吗？");
            if (isTrue) {
               var str = "";
               $(e.target).remove();
               $('.rm').toArray().forEach(function (item, index, a) {
                  str += $(item).prev().text()+',';
               });
               operate(str, localStorage.getItem("id"));               
               $(e.target).prev().remove();
            }
         });
         $("#userList").on("click", '.add', function (e) { //添加
            var str = "";
            $(".rm").toArray().forEach(function (item, index, a) {
               str += $(item).prev().text()+',';
            });
            str += $(e.target).prev().text();
            operate(str, localStorage.getItem("id"));
         });

         function paintFriends(id) { //渲染列表
            $.get("/getFriends.ashx", {
               "id": id
            }, function (data) {
               if (data) {
                  var html = template("temp1", {
                     Friends: data.split(",")
                  });
                  $("#friendList").html(html);
               }else{
                  $("#friendList").html("");
               }
            });
         }

         function operate(str, id) {
            if(str[str.length-1]==","){
               str=str.slice(0,-1);
            }
            $.get("/rmFriend.ashx", {
               id: id,
               friendsName: str
            }, function (data) {
               paintFriends(id); /* 删除/添加 成功之后 重新获取朋友列表进行渲染 */
            });
         }
         paintFriends(localStorage.getItem("id"));
         $.get("/getAll.ashx", {
            username: $(name).val()
         }, function (data) {
            if (data) {
               var html = template("temp2", {
                  allList: JSON.parse(data)
               });
               $("#userList").html(html);
            }
         });
      });
   </script>
   <style>
      * {
         margin: 0;
         padding: 0;
         list-style-type: none;
      }

      ul>li {
         text-align: center;
         height: 30px;
         line-height: 30px;
      }

      ul>li:hover {
         background-color: #ccc;
         cursor: default;
      }
   </style>
</head>

<body>
   <div style="float: left">
      我的好友列表
      <ul style="width: 180px;max-height: 200px;overflow: auto" id="friendList">
      </ul>
      <template id="temp1">
         {{each Friends item index}}
         <li><span>{{item}}</span><span class="rm" style="float: right;margin-right: 20px;cursor: pointer;">-</span>
         </li>
         {{/each}}
      </template>
   </div>
   <div style="float: right;margin-right: 20px">
      <div>
         交朋友
         <ul style="width: 200px;max-height: 200px;overflow: auto" id="userList">

         </ul>
         <template id="temp2">
            {{each allList item index}}
            <li><span>{{item}}</span> <span class="add"
                  style="float: right;margin-right: 20px;cursor: pointer;">+</span></li>
            {{/each}}
         </template>
      </div>
   </div>
</body>

</html>