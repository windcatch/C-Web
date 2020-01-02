using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;//引入JavaScriptSerializer对象

namespace system
{
    /// <summary>
    /// getData 的摘要说明
    /// </summary>
    /// 

    class Data
    {
        public String brand="";
        public String Mbrand="";
        public String Qbrand="";
        public String dateTime="";
    }
    public class getData : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataClasses1DataContext dc = new DataClasses1DataContext();
            var data = new Data();
            var brandInfo= from table in dc.Table select table;
            foreach(var item in brandInfo)
            {
                data.brand += item.brand+"  ";
                data.Mbrand += item.Mbrand + "  ";
                data.Qbrand += item.Qbrand + "  ";
                data.dateTime += item.dateTime + "  ";
            }
            JavaScriptSerializer jss = new JavaScriptSerializer();
            string json = jss.Serialize(data);
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