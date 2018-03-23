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
    public partial class AddNewBusRoute : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            lblroutesms.Text = "";
            if (!IsPostBack)
            {
                GridViewBRoute.Visible = true;
            }
        }

        protected void btnbroute_Click(object sender, EventArgs e)
        {
            if(txtaddbroute.Text==""|| txtbdestination.Text == "")
            {
                lblroutesms.Text = "Invalid Route Info";
            }
            else
            {
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "insert into Bus_routes (origin, destination,Transport_id) values(@origin, @destination,@Transport_id)";
                    cmd.Parameters.AddWithValue("@origin",txtaddbroute.Text);
                    cmd.Parameters.AddWithValue("@destination", txtbdestination.Text);
                    cmd.Parameters.AddWithValue("@Transport_id",dropdowntransport.SelectedValue);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    lblroutesms.Text = "Data Recorded..!";

                    txtaddbroute.Text = "";
                    txtbdestination.Text = "";
                    dropdowntransport.SelectedIndex = 0;

                    Response.Redirect(Request.RawUrl);

                }
            }
        }
    }
}