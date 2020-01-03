using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Friends
{
    /// <summary>
    /// rmFriend 的摘要说明
    /// </summary>
    public class rmFriend : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataClasses1DataContext db = new DataClasses1DataContext();
            Table cust = db.Table.First(c => c.id == int.Parse(context.Request.QueryString["id"]));

            cust.friendsNames = context.Request.QueryString["friendsName"];

            db.SubmitChanges();
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