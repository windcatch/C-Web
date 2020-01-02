using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;//引入JavaScriptSerializer对象

namespace musicPlayer
{
    /// <summary>
    /// getMusic 的摘要说明
    /// </summary>
    /// 
    class Data
    {
        public int musicId = 0;
        public String musicAuthor = "";
        public String musicName = "";
        public String musicUrl = "";
        public String musicImg = "";
    }
    public class getMusic : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            int userId = int.Parse(context.Request.QueryString["userId"]);
            DataClasses1DataContext dc = new DataClasses1DataContext();
            var data = new Data();
            var q = from c in dc.music
                    where c.userId == userId
                    select c;
            foreach (var item in q)
            {
                data.musicId = item.musicId;
                data.musicAuthor = item.musicAuthor;
                data.musicName = item.musicName;
                data.musicUrl = item.musicUrl;
                data.musicImg = item.musicImg;
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