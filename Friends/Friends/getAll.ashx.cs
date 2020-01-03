using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;//引入JavaScriptSerializer对象

namespace Friends
{
    /// <summary>
    /// getAll 的摘要说明
    /// </summary>
    public class getAll : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataClasses1DataContext db = new DataClasses1DataContext();
            var r = from t in db.Table
                select t;
            List<String> arr = new List<String>();
            foreach(var item in r)
            {
                arr.Add(item.username);
            }
            JavaScriptSerializer jss = new JavaScriptSerializer();
            string json = jss.Serialize(arr);
            context.Response.Write(json);
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