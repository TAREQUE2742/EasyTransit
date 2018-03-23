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
    public partial class AddNewFlightRoute : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            lblFroutesms.Text = "";
            if (!IsPostBack)
            {
                GridViewFlight.Visible = true;
            }
        }

        protected void btnFroute_Click(object sender, EventArgs e)
        {
            if (txtaddFroute.Text == "" || txtFdestination.Text == "")
            {
                lblFroutesms.Text = "Invalid Route Info";
            }
            else
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "insert into Flight_routes (origin, destination,Transport_id) values(@origin, @destination,@Transport_id)";
                    cmd.Parameters.AddWithValue("@origin", txtaddFroute.Text);
                    cmd.Parameters.AddWithValue("@destination", txtFdestination.Text);
                    cmd.Parameters.AddWithValue("@Transport_id", dropdownFtransport.SelectedValue);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    lblFroutesms.Text = "Data Recorded..!";

                    txtaddFroute.Text = "";
                    txtFdestination.Text = "";
                    dropdownFtransport.SelectedIndex = 0;

                    Response.Redirect(Request.RawUrl);

                }
            }
        }
    }
}