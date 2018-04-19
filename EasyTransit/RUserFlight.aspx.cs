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
    public partial class RUserFlight : System.Web.UI.Page
    {
        string Day;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtjourneyDate.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }

        protected void btnFLIGHTsearch_Click(object sender, EventArgs e)
        {

            //


            //lblbusSearchsms.Text = a+b;

            if (ddlOriginAirport.SelectedIndex == ddlDestinationAirport.SelectedIndex)
            {
                lblflightSearchsms.ForeColor = System.Drawing.Color.Purple;
                lblflightSearchsms.Text = "Orign and Destination shouldn't Same.";
            }
            else
            {
                if (ddlOriginAirport.SelectedValue == "0" || ddlDestinationAirport.SelectedValue == "0" || txtjourneyDate.Text == "")
                {
                    lblflightSearchsms.ForeColor = System.Drawing.Color.Purple;
                    lblflightSearchsms.Text = "Provide Valid Information";
                }
                else
                {
                    Session["fJourneyDate"] = txtjourneyDate.Text;
                    Day = Convert.ToDateTime(txtjourneyDate.Text).DayOfWeek.ToString();

                    DoFlightSearch();

                }
            }
        }

        private void DoFlightSearch()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "SELECT routeid from Flight_routes where origin='" + ddlOriginAirport.SelectedItem.Text + "' and destination='" + ddlDestinationAirport.SelectedItem.Text + "' ";
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {
                    string route = Convert.ToString(rdr["routeid"]);
                    string Ori = Convert.ToString(ddlOriginAirport.Text);
                    string Desti = Convert.ToString(ddlDestinationAirport.Text);
                    Session["froute"] = route;
                    Session["fday"] = Day;
                    Session["fOri"] = Ori;
                    Session["fDesti"] = Desti;
                    Response.Redirect("RUserFlightSearch.aspx");

                }
                else
                {
                    lblflightSearchsms.Text = "This Route is not available";
                }
                con.Close();
            }
        }
    }
}