using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EasyTransit
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["user-email"] == null)
            //{
            //    Response.Redirect("Userlogin.aspx");
            //}
            //else
            //{
            //    lbluserWelcome.Text = "Welcome" + " " + Session["ad-email"].ToString();
            //    //Response.Cache.SetNoStore();
            //}
        }
    }
}