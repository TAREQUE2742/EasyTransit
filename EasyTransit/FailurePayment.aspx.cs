using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EasyTransit
{
    public partial class FailurePayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblfailuremessage.Text = "Transaction" + Request.Form["txnid"] + " has been  Failed";
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("RUserBus.aspx");
        }
    }
}