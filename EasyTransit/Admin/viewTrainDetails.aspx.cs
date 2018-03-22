using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EasyTransit.Admin
{
    public partial class viewTrainDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["ad-email"] == null)
            {
                Session.Abandon();
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnedittrain_Click(object sender, ImageClickEventArgs e)
        {

        }
    }
}