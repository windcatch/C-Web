using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace messageBoard
{
    /// <summary>
    /// subMsg 的摘要说明
    /// </summary>
    public class subMsg : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataClasses1DataContext db = new DataClasses1DataContext();
            var msg = new msgInfo
            {
                msgCon = context.Request.QueryString["msgInfo"],
                userName = context.Request.QueryString["username"],
                dateTime = context.Request.QueryString["dateTime"],
            };
            db.msgInfo.InsertOnSubmit(msg);
            db.SubmitChanges();

            context.Response.Write("true");
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