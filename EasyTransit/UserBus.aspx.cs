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
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

            }
        }

        protected void btnBUSsearch_Click(object sender, EventArgs e)
        {

            //string a = Convert.ToString(ddlOrigin.Text);
            //string b = Convert.ToString(ddlDestination.Text);


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
                    lblbusSearchsms.Text = "Provide Valid Information";
                }
                else
                {
                   string Day = Convert.ToDateTime(txtjourneyDate.Text).DayOfWeek.ToString();
               
                    if (con.State==ConnectionState.Closed)
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand();
                        cmd.Connection = con;
                        cmd.CommandText = "SELECT origin,destination,Transport_id,bcompany_name, weekday from Bus_routes,Bus_schedule,Bus_company  where weekday ='" + Day + "' and origin='" + ddlOrigin.SelectedItem.Text + "' and destination='" + ddlDestination.SelectedItem.Text + "' ";
                        SqlDataReader rdr = cmd.ExecuteReader();
                        if(rdr.Read())
                        {
                            lblbusSearchsms.Text = Day;
                            con.Close();

                        }
                        else
                        {
                            lblbusSearchsms.Text = Day+" "+"Not available";
                        }
                        con.Close();
                    }
                }
            }
        }

        protected void txtjourneyDate_TextChanged(object sender, EventArgs e)
        {
            
        }
    }
}