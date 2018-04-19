using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EasyTransit
{
    public partial class RUserFlightSearch : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["froute"] != null && Session["fday"] != null)
            {
                td1.Visible = false;
                td2.Visible = false;
                td1.Text = Session["froute"].ToString();
                td2.Text = Session["fday"].ToString();
                td3.ForeColor = System.Drawing.Color.Black;
                td3.Font.Bold = true;
                td4.Font.Bold = true;
                td4.ForeColor = System.Drawing.Color.Black;
                td3.Text = "Journey Trip : " + Session["fOri"].ToString() + " -TO- " + Session["fDesti"].ToString();
                td4.Text = "On - " + Session["fJourneyDate"];

                FlightSResult.Visible = true;

            }



        }

        protected void FlightSResult_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Select"))
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
                string firstArgVal = commandArgs[0];
                string secondArgVal = commandArgs[1];
                string thirdArgVal = commandArgs[2];
                int cap = Convert.ToInt32(thirdArgVal);
                string FourthArgVal = commandArgs[3];
                Session["fcompany"] = firstArgVal;
                Session["ftrans"] = secondArgVal;
                Session["fcapa"] = thirdArgVal;
                Session["ffare"] = FourthArgVal;


                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "SELECT  SUM(seat) FROM flight_reservation WHERE(Transport_id ='" + secondArgVal + "') AND(date ='" + Session["JourneyDate"] + "')";
                    try
                    {
                        string seatsum = cmd.ExecuteScalar().ToString();
                        int seatSUM = Convert.ToInt32(seatsum);
                        int availableseat = (cap - seatSUM);
                        Session["favailablese"] = availableseat.ToString();
                    }
                    catch
                    {
                        string availableseat = Session["fcapa"].ToString();
                        Session["favailablese"] = availableseat;
                    }


                    

                }

                Response.Redirect("FlightPayment.aspx");
            }
        }

        protected void FlightSResult_SelectedIndexChanged(object sender, EventArgs e)
        {
          
        }
    }
}