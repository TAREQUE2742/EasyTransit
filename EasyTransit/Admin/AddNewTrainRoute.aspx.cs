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
    public partial class AddNewTrainRoute : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            lblTroutesms.Text = "";
            if(!IsPostBack)
            {
                GridViewTroute.Visible = true;
            }
        }

        protected void btnTroute_Click(object sender, EventArgs e)
        {
            if (txtaddTroute.Text == "" || txtTdestination.Text == "")
            {
                lblTroutesms.Text = "Invalid Route Info";
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "select routeid from Train_routes where origin='"+txtaddTroute.Text+"' and destination='"+txtTdestination.Text+"'";
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {
                    lblTroutesms.ForeColor = System.Drawing.Color.Yellow;
                    lblTroutesms.Font.Bold = true;
                    lblTroutesms.Text = "This Route Already Assign In Route Table.";
                }
                else
                {
                    con.Close();
                    AddTrainRoute();
                }
            }
        }
        private void AddTrainRoute()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "insert into Train_routes (origin, destination) values(@origin, @destination)";
                cmd.Parameters.AddWithValue("@origin", txtaddTroute.Text);
                cmd.Parameters.AddWithValue("@destination", txtTdestination.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                lblTroutesms.Text = "Data Recorded..!";

                txtaddTroute.Text = "";
                txtTdestination.Text = "";

                Response.Redirect(Request.RawUrl);

            }
        }
    }
}