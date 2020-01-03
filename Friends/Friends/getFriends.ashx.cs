using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Friends
{
    /// <summary>
    /// getFriends 的摘要说明
    /// </summary>
    public class getFriends : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataClasses1DataContext db = new DataClasses1DataContext();
            var r = from t in db.Table
                    where t.id == int.Parse(context.Request.QueryString["id"])
                    select t.friendsNames;
            foreach (var item in r)
            {
                context.Response.Write(item);
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