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
    public partial class TSuccess : System.Web.UI.Page
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
                    cmd.CommandText = "insert into train_reservation(passenger_id,Transport_id,routeid,date,seat) values(@passenger_id,@Transport_id,@routeid,@date,@seat)";
                    cmd.Parameters.AddWithValue("@passenger_id", Session["user-id"]);
                    cmd.Parameters.AddWithValue("@Transport_id", Session["ttrans"]);
                    cmd.Parameters.AddWithValue("@routeid", Session["troute"]);
                    cmd.Parameters.AddWithValue("@date", Session["tJourneyDate"]);
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
            Response.Redirect("RUserTrain.aspx");
        }
    }
}