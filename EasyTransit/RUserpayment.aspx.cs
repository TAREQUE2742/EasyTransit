using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EasyTransit
{
    public partial class RUserpayment : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {

                
                string routeId = Session["route"].ToString();
                string jourdate = Session["JourneyDate"].ToString();
                string bcom = Session["bcompany"].ToString();
                string jourday = Session["day"].ToString();
                string jourori = Session["Ori"].ToString();
                string jourDes = Session["Desti"].ToString();
                string btrans = Session["btransid"].ToString();

                lblpaysms.Text = routeId + " " + jourdate + " " + jourday + " " + jourori+" "+jourDes+" "+bcom+" "+btrans;
                }
                catch
                {
                    Response.Redirect("RUserBus.aspx");
                }
            }
        }
    }
}