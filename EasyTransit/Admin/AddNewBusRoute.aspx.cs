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
                lblroutesms.ForeColor = System.Drawing.Color.Yellow;
                lblroutesms.Font.Bold = true;
                lblroutesms.Text = "Invalid Route Info";
            }
            else
            {
                if (txtaddbroute.Text == txtbdestination.Text)
                {
                    lblroutesms.ForeColor = System.Drawing.Color.Yellow;
                    lblroutesms.Font.Bold = true;
                    lblroutesms.Text = "The Origin and Destination must not Same.!";
                }
                else
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "select routeid from Bus_routes where origin='" + txtaddbroute.Text + "' and destination='" + txtbdestination.Text + "'";
                    SqlDataReader rdr = cmd.ExecuteReader();
                    if (rdr.Read())
                    {
                        lblroutesms.ForeColor = System.Drawing.Color.Yellow;
                        lblroutesms.Font.Bold = true;
                        lblroutesms.Text = "This Route is Already Assign In Route Table.";
                    }
                    else
                    {
                        con.Close();
                        AddBusRoute();
                    }
                }
               
            }
        }
        private void AddBusRoute()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "insert into Bus_routes (origin, destination) values(@origin, @destination)";
                cmd.Parameters.AddWithValue("@origin", txtaddbroute.Text);
                cmd.Parameters.AddWithValue("@destination", txtbdestination.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                lblroutesms.Text = "Data Recorded..!";

                txtaddbroute.Text = "";
                txtbdestination.Text = "";

                Response.Redirect(Request.RawUrl);

            }
        }
    }
}