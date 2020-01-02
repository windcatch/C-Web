using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace system
{
    /// <summary>
    /// submit 的摘要说明
    /// </summary>
    /// 

    public class submit : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataClasses1DataContext dc=new DataClasses1DataContext();
            var list=new Table();
            list.brand = context.Request.QueryString["brand"];
            list.Qbrand = context.Request.QueryString["Qbrand"];
            list.Mbrand = context.Request.QueryString["Mbrand"];
            list.dateTime = context.Request.QueryString["dateTime"];
            context.Response.Write(list.dateTime);
            dc.Table.InsertOnSubmit(list);
            dc.SubmitChanges();
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