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
    public partial class AddFlightSchedule : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FSCschedule.Visible = true;
            }
        }

        protected void btnTSCadd_Click(object sender, EventArgs e)
        {
            if(ddlFSCroute.SelectedValue=="0"|| ddlFSCweekday.SelectedValue=="0"|| ddlFSCtime.SelectedValue=="0"|| ddlFSCtransport.SelectedValue=="0" || txtFSCfare.Text == "")
            {
                lblFSCsms.ForeColor = System.Drawing.Color.Yellow;
                lblFSC.Font.Bold = true;
                lblFSCsms.Text = "Please Provide Valid Information";
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "select scheduleid from Flight_schedule where weekday='"+ddlFSCweekday.SelectedItem.Text+"' and Transport_id = '"+ddlFSCtransport.SelectedValue+"'";
                SqlDataReader rdr = cmd.ExecuteReader();
                if(rdr.Read())
                {
                    lblFSCsms.ForeColor = System.Drawing.Color.Yellow;
                    lblFSCsms.Font.Bold = true;
                    lblFSCsms.Text = "This Schedule is already Assign.";
                }
                else
                {
                    con.Close();
                    DoFlightSchedule();
                    Response.Write("<script language='Javascript'>alert('Record Inserted Successfully...!')</script>");
                }
            }
        }
        private void DoFlightSchedule()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "insert into Flight_schedule (routeid, weekday, time, Transport_id, fare) values(@routeid, @weekday, @time, @transport_id,@fare)";
                cmd.Parameters.AddWithValue("@routeid", ddlFSCroute.SelectedValue);
                cmd.Parameters.AddWithValue("@weekday", ddlFSCweekday.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@time", ddlFSCtime.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@transport_id", ddlFSCtransport.SelectedValue);
                cmd.Parameters.AddWithValue("@fare", txtFSCfare.Text);
                cmd.ExecuteNonQuery();
                con.Close();

            }
        }

        protected void btnFReset_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}