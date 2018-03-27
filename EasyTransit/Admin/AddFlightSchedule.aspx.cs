using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace EasyTransit.Admin
{
    public partial class AddFlightSchedule : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FSCschedule.Visible = true;
            }
        }

        protected void btnTSCadd_Click(object sender, EventArgs e)
        {
            if(ddlFSCroute.SelectedValue=="0"|| txtFSCweekday.Text==""|| ddlFSCtime.SelectedValue=="0"|| ddlFSCtransport.SelectedValue=="0" || txtFSCfare.Text == "")
            {
                lblFSCsms.ForeColor = System.Drawing.Color.Red;
                lblFSCsms.Text = "Please Provide Valid Information";
            }
            else
            {
                lblFSCsms.ForeColor = System.Drawing.Color.Green;
                lblFSCsms.Text = "Data Saved..!";
            }
        }
    }
}