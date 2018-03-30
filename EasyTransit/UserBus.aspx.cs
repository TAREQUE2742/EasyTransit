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
    public partial class UserBus : System.Web.UI.Page
    {
        string Day;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                txtjourneyDate.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }

        protected void btnBUSsearch_Click(object sender, EventArgs e)
        {

            //


            //lblbusSearchsms.Text = a+b;

            if (ddlOrigin.SelectedIndex == ddlDestination.SelectedIndex)
            {
                lblbusSearchsms.ForeColor = System.Drawing.Color.Red;
                lblbusSearchsms.Text = "Orign and Destination shouldn't Same.";
            }
            else
            {
               if(ddlOrigin.SelectedValue=="0" || ddlDestination.SelectedValue=="0" || txtjourneyDate.Text=="")
                {
                    lblbusSearchsms.ForeColor = System.Drawing.Color.Red;
                    lblbusSearchsms.Font.Bold = true;
                    lblbusSearchsms.Text = "Provide Valid Information";
                }
                else
                {
                    Session["JourneyDate"] = txtjourneyDate.Text;
                    Day = Convert.ToDateTime(txtjourneyDate.Text).DayOfWeek.ToString();

                    DoBusSearch();
                   
                }
            }
        }

        private void DoBusSearch()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "SELECT routeid from Bus_routes where origin='" + ddlOrigin.SelectedItem.Text + "' and destination='" + ddlDestination.SelectedItem.Text + "' ";
                SqlDataReader rdr = cmd.ExecuteReader();              
                if (rdr.Read())
                {
                    string route = Convert.ToString(rdr["routeid"]);
                    string Ori = Convert.ToString(ddlOrigin.Text);
                    string Desti = Convert.ToString(ddlDestination.Text);
                    Session["route"] = route;
                    Session["day"] = Day;
                    Session["Ori"] = Ori;
                    Session["Desti"] = Desti;
                    Response.Redirect("UserSearch.aspx");
                   
                }
                else
                {
                    lblbusSearchsms.Text ="This Route is not available";
                }
                con.Close();
            }
        }

        protected void txtjourneyDate_TextChanged(object sender, EventArgs e)
        {
            
        }
    }
}