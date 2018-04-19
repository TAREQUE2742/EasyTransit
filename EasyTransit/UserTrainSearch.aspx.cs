using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace EasyTransit
{
    public partial class UserTrainSearch : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["route"] != null && Session["day"] != null)
            {
                td1.Visible = false;
                td2.Visible = false;
                td1.Text = Session["route"].ToString();
                td2.Text = Session["day"].ToString();
                td3.ForeColor = System.Drawing.Color.Black;
                td3.Font.Bold = true;
                td4.Font.Bold = true;
                td4.ForeColor = System.Drawing.Color.Black;
                td3.Text = "Journey Trip : " + Session["Ori"].ToString() + " -TO- " + Session["Desti"].ToString();
                td4.Text = "On - " + Session["JourneyDate"];

           
                TrainSearchView.Visible = true;

            }
        }
    }
}