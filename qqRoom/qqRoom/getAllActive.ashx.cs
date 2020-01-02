using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;//引入JavaScriptSerializer对象

namespace qqRoom
{
    /// <summary>
    /// getAllActive 的摘要说明
    /// </summary>
    /// 
    class Active
    {
        public String activeCon = "";
        public String username = "";
        public String activeTime = "";
    }
    public class getAllActive : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataClasses1DataContext dc = new DataClasses1DataContext();
            var all = from c in dc.active
                      select c;
            List<Active> arr = new List<Active>();
            foreach (var item in all)
            {
                var data = new Active();
                data.activeCon = item.activeCon;
                data.username = item.username;
                data.activeTime = item.activeTime;
                arr.Add(data);
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