using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;//引入JavaScriptSerializer对象

namespace nilnul
{
    /// <summary>
    /// Login1 的摘要说明
    /// </summary>
    public class Login1 : IHttpHandler
    {
        class Data
        {
            public string name;
        }
        public void ProcessRequest(HttpContext context)
        {
            DataClasses1DataContext dc = new DataClasses1DataContext();
            var userInfo = from table in dc.Table select table;
            foreach (var item in userInfo)
            {
                if (item.username == context.Request.QueryString["username"] && item.password == context.Request.QueryString["password"])
                {
                    Data data = new Data();
                    data.name= item.name;
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