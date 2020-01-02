using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace qqRoom
{
    /// <summary>
    /// submit 的摘要说明
    /// </summary>
    public class submit : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataClasses1DataContext db = new DataClasses1DataContext();
            var active = new active
            {
                activeCon = context.Request.QueryString["activeCon"],
                username = context.Request.QueryString["username"],
                activeTime = context.Request.QueryString["activeTime"],
            };
            db.active.InsertOnSubmit(active);
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