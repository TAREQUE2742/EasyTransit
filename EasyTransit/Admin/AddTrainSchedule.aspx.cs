﻿using System;
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
    public partial class AddTrainSchedule : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            TSCView.Visible = true;
        }

        protected void btnTSCsearch_Click(object sender, EventArgs e)
        {
            TSCsearchgridview.Visible = true;
            TSCView.Visible = true;
        }

        protected void btnTSCadd_Click(object sender, EventArgs e)
        {
            if(ddlTSCroute.SelectedValue=="0" || txtTSCweekday.Text=="" || ddlTSCtime.SelectedValue=="0" || ddlTSCtransport.SelectedValue == "0" || txtTSCfare.Text=="")
            {
                lblTSCsms.ForeColor = System.Drawing.Color.Red;
                lblTSCsms.Text = "Provide Valid Information";
            }
            else
            {
                lblTSCsms.Text = "data saved";
            }
        }

        
    }
}