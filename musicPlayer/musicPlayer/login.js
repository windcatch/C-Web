$(function () {
    $("#loginIn").click(function () {
        $.ajax(
            {
                method: "get",
                url: "/login.ashx",
                data: {
                    "username": $("[name=username]").val(),
                    "password": $("[name=password]").val()
                },
                dataType: 'json',
                contentType: 'application/x-www-form-urlencoded',
                success: function (data) {           
                    alert("登陆成功！");
                    localStorage.setItem("userInfo", JSON.stringify(data));
                    window.location.href = "/music";
                },
                error: function (xhr) {
                    alert("账号或密码错误！")
                    console.log(xhr.status);
                }
            }
        )
    });
});