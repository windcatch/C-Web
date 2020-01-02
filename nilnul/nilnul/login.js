$(function () {
    $("#loginIn").click(function () {
        layer.load();
        $.ajax(
            {
                method:"get",
                url:"/Login.ashx",
                data:{
                    "username":$("[name=username]").val(),
                    "password":$("[name=password]").val()
                },
                dataType:'json',
                contentType:'application/x-www-form-urlencoded',
                success: function (data) {
                    layer.closeAll('loading')
                    layer.msg("Landing success!");
                    document.cookie ="userInfo="+ JSON.stringify(data);
                    window.location.href = "/Default.aspx";
                },
                error: function (xhr) {
                    layer.closeAll('loading');
                    layer.msg("Account number or password error, please check your login information!");
                    console.log(xhr.status);
                }
            }
        )
    });
});