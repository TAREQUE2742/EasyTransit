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
    public partial class RUserTrainSearch : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["troute"] != null && Session["tday"] != null)
            {
                td1.Visible = false;
                td2.Visible = false;
                td1.Text = Session["troute"].ToString();
                td2.Text = Session["tday"].ToString();
                td3.ForeColor = System.Drawing.Color.Black;
                td3.Font.Bold = true;
                td4.Font.Bold = true;
                td4.ForeColor = System.Drawing.Color.Black;
                td3.Text = "Journey Trip : " + Session["tOri"].ToString() + " -TO- " + Session["tDesti"].ToString();
                td4.Text = "On - " + Session["tJourneyDate"];

                TrainSResult.Visible = true;

            }



        }

        protected void TrainSResult_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void TrainSResult_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Select"))
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
                string firstArgVal = commandArgs[0];
                string secondArgVal = commandArgs[1];
                string thirdArgVal = commandArgs[2];
                int cap = Convert.ToInt32(thirdArgVal);
                string FourthArgVal = commandArgs[3];
                Session["tcompany"] = firstArgVal;
                Session["ttrans"] = secondArgVal;
                Session["tcapa"] = thirdArgVal;
                Session["tfare"] = FourthArgVal;


                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "SELECT  SUM(seat) FROM train_reservation WHERE(Transport_id ='" + secondArgVal + "') AND(date ='" + Session["JourneyDate"] + "')";
                    try
                    {
                        string seatsum = cmd.ExecuteScalar().ToString();
                        int seatSUM = Convert.ToInt32(seatsum);
                        int availableseat = (cap - seatSUM);
                        Session["tavailablese"] = availableseat.ToString();
                    }
                    catch
                    {
                        string availableseat = Session["tcapa"].ToString();
                        Session["tavailablese"] = availableseat;
                    }




                }

                Response.Redirect("TrainPayment.aspx");
            }
        }
    }
}