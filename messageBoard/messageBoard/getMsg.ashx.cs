using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;//引入JavaScriptSerializer对象

namespace messageBoard
{
    /// <summary>
    /// getMsg 的摘要说明
    /// </summary>
    /// 
    class msgData
    {
        public String msgCon = "";
        public String userName = "";
        public String dateTime = "";
    }
    public class getMsg : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataClasses1DataContext dc = new DataClasses1DataContext();
            var all = from c in dc.msgInfo
                    select c;
            List<msgData> arr = new List<msgData>();
            foreach (var item in all)
            {
                var data = new msgData();
                data.msgCon = item.msgCon;
                data.userName = item.userName;
                data.dateTime = item.dateTime;
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