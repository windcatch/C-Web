using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace messageBoard
{
    /// <summary>
    /// register1 的摘要说明
    /// </summary>
    public class register1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataClasses1DataContext db = new DataClasses1DataContext();
            var userInfo = new userInfo
            {
                username = context.Request.QueryString["username"],
                password = context.Request.QueryString["password"]
            };
            db.userInfo.InsertOnSubmit(userInfo);
            db.SubmitChanges();

            context.Response.Write("<script language='JavaScript'>" +
                "alert('注册成功');" +
                "setTimeout(function(){window.location.href='/login';},1000)" +
                "</script>");
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