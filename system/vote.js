$(function() {
  var index = 1;
 judge(index);
  $("#next").click(function() {
    if (index >= 3) {
      $(this).prop("disabled", "true");
    } else {
      index++;
      $("#prev").prop("disabled", false);
      $(this).prop("disabled", false);
      $("[data-num=" + index + "]").show().siblings().hide();
      judge(index);
    }
  });
  $("#prev").click(function() {
      if (index <= 1) {
          $(this).prop("disabled", "true");
      } else {
      index--;
      $("#next").prop("disabled", false);
      $(this).prop("disabled", false);
      $("[data-num=" + index + "]").show().siblings().hide();
      judge(index);
    }
  });
  function judge(index){
    if(index==1){
        $("[data-num=" + index + "]").show().siblings().hide();
        $("#prev").prop("disabled", "true");
    }
    if(index==3){
        $("[data-num=" + index + "]").show().siblings().hide();
        $("#next").prop("disabled", "true");
    }
  }
  //提交
  $("#submit").click(function(){
      var isFull=0;
      var data={};
      $("[name=brand]:checked").toArray().forEach(function(item,index,a){
          var isfill=0;
          if($(item).val()){
            data.brand=$(item).val();
            isfill=1;
          }
          isFull+=isfill;
      });
      $("[name=Qbrand]:checked").toArray().forEach(function(item,index,a){
          var isfill=0
        if($(item).val()){
          data.Qbrand=$(item).val();
          isfill=1;
        }
        isFull+=isfill;
     });
     data.Mbrand="";
     var isfill=0
      $("[name=Mbrand]:checked").toArray().forEach(function(item,index,a){
        if($(item).val()){
            data.Mbrand += $(item).val()+",";
          isfill=1;
        }
      });
      data.dateTime = new Date().toLocaleString();
      console.log(data.dateTime)
     isFull+=isfill;
     console.log(isFull);
      if (isFull == 3) {//发送请求
          layer.confirm("您确定提交这份问卷吗？", function () {
              layer.load();
              $.ajax({
                  method: 'get',
                  url: "/submit.ashx",
                  contentType: "application/x-www-form-urlencoded",
                  data: data,
                  success: function (data) {
                      layer.closeAll();
                      layer.msg("提交成功", { time: 2000 }, function () {
                          window.location.href = "/result"
                      });
                  },
                  error: function (xhr) {
                      layer.closeAll();
                      console.log(xhr.status);
                      layer.msg("服务器可能出现了问题，请稍后再试", { time: 2000 });
                  }
              })
          })
     }else{
         layer.msg("请认真填完问卷。",{time:2000});
     }
  })
});
