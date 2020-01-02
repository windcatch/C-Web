using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;//引入JavaScriptSerializer对象

namespace messageBoard
{
    /// <summary>
    /// login1 的摘要说明
    /// </summary>
    /// 
    class Data
    {
        public int userId;
        public String username;
        public Boolean isFalse=false;
    }
    public class login1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataClasses1DataContext dc = new DataClasses1DataContext();
            var user = from c in dc.userInfo select c;
            Data data = new Data();
            foreach (var item in user)
            {
                if (item.username == context.Request.QueryString["username"] && item.password == context.Request.QueryString["password"])
                {
                    data.userId = item.userId;
                    data.username = item.username;
                    JavaScriptSerializer jss = new JavaScriptSerializer();
                    string json = jss.Serialize(data);
                    context.Response.Write("<script language='JavaScript'>" +
                        "document.cookie ='userInfo = '+ JSON.stringify("+json+");" +
                        "alert('登陆成功！');" +
                        "window.location.href = '/messageBoard';" +
                        "</script>");
                    data.isFalse = true;
                }
            };


            if(data.isFalse==false)
            {
                context.Response.Write("<script language='JavaScript'>" +
                    "alert('账号或密码错误！')" +
                    "</script>");
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}