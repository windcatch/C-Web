$(function(){
    $.ajax({
        method:"get",
        url:'/getData.ashx',
        dataType:"json",
        success:function(data){
           var brandList=[];
           data.brand.split('  ').map(function(item,index,a){
             if(item){
                brandList.push({
                    brand:item,
                    Qbrand:data.Qbrand.split('  ')[index],
                    Mbrand:data.Mbrand.split(',  ')[index],
                    time:data.dateTime.split("  ")[index]
                });
             }
           });
           console.log(brandList);
           var html=template('temp1',{brandList:brandList});
           $("#box").html(html);
        },
        error:function(xhr){
            console.log(xhr.status);
        }
    })
})