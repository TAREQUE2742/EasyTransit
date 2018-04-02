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
    public partial class RUserBus : System.Web.UI.Page
    {
        string Day;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtBusDate.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }

        private void DoBusSearch()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "SELECT routeid from Bus_routes where origin='" + ddlRbusStrat.SelectedItem.Text + "' and destination='" + BusDestination.SelectedItem.Text + "' ";
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {
                    string route = Convert.ToString(rdr["routeid"]);
                    string Ori = Convert.ToString(ddlRbusStrat.Text);
                    string Desti = Convert.ToString(BusDestination.Text);
                    Session["route"] = route;
                    Session["day"] = Day;
                    Session["Ori"] = Ori;
                    Session["Desti"] = Desti;
                    Response.Redirect("RUserBusSearch.aspx");

                }
                else
                {
                    lblRBusSms.Text = "This Route is not available";
                }
                con.Close();
            }
        }

        protected void txtjourneyDate_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnuserSearch_Click(object sender, EventArgs e)
        {
            if (ddlRbusStrat.SelectedIndex == BusDestination.SelectedIndex)
            {
                lblRBusSms.ForeColor = System.Drawing.Color.Red;
                lblRBusSms.Text = "Orign and Destination shouldn't Same.";
            }
            else
            {
                if (ddlRbusStrat.SelectedValue == "0" || BusDestination.SelectedValue == "0" || txtBusDate.Text == "")
                {
                    lblRBusSms.ForeColor = System.Drawing.Color.Red;
                    lblRBusSms.Font.Bold = true;
                    lblRBusSms.Text = "Provide Valid Information";
                }
                else
                {
                    Session["JourneyDate"] = txtBusDate.Text;
                    Day = Convert.ToDateTime(txtBusDate.Text).DayOfWeek.ToString();

                    DoBusSearch();

                }
            }
        }
    }
}