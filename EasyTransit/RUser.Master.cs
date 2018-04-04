using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EasyTransit
{
    public partial class RUser : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user-email"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                lbluserwelcome.ForeColor = System.Drawing.Color.Yellow;
                lbluserwelcome.Font.Bold = true;
                lbluserwelcome.Text = "Welcome" + " " +" "+Session["user-name"].ToString();
            }
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
}