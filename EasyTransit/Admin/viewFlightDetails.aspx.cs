using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EasyTransit.Admin
{
    public partial class viewFlightDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsearchflight_Click(object sender, EventArgs e)
        {
            GridViewFlight.Visible = true;
        }
    }
}