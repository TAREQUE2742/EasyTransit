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
    public partial class SuccessPayment : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());
       
        protected void Page_Load(object sender, EventArgs e)
        {
            lblsuccessmessage.Text = "Transaction" + Request.Form["txnid"] + " has been successfully Completed";
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "insert into bus_reservation(passenger_id,Transport_id,routeid,date,seat) values(@passenger_id,@Transport_id,@routeid,@date,@seat)";
                    cmd.Parameters.AddWithValue("@passenger_id", Session["user-id"]);
                    cmd.Parameters.AddWithValue("@Transport_id", Session["btrans"]);
                    cmd.Parameters.AddWithValue("@routeid", Session["route"]);
                    cmd.Parameters.AddWithValue("@date", Session["JourneyDate"]);
                    cmd.Parameters.AddWithValue("@seat", Session["seatQuantity"]);
                    cmd.ExecuteNonQuery();
                    con.Close();

                }
            }
            catch
            {
                Response.Redirect("Userlogin.aspx");
            }
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("RUserBus.aspx");
        }
    }
}