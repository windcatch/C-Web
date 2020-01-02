using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;//引入JavaScriptSerializer对象

namespace musicPlayer
{
    /// <summary>
    /// login1 的摘要说明
    /// </summary>
    public class login1 : IHttpHandler
    {
        class Data
        {
            public int userId;
            public String username;
        }
        public void ProcessRequest(HttpContext context)
        {
            DataClasses1DataContext dc = new DataClasses1DataContext();
            var user = from c in dc.userInfo select c;
            foreach (var item in user)
            {
                if (item.username == context.Request.QueryString["username"] && item.password == context.Request.QueryString["password"])
                {
                    Data data = new Data();
                    data.userId = item.userId;
                    data.username = item.username;
                    JavaScriptSerializer jss = new JavaScriptSerializer();
                    string json = jss.Serialize(data);
                    context.Response.Write(json);
                }
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