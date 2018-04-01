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
    public partial class AddTrainSchedule : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            TSCView.Visible = true;
        }

        protected void btnTSCsearch_Click(object sender, EventArgs e)
        {
            TSCsearchgridview.Visible = true;
            TSCView.Visible = true;
        }

        protected void btnTSCadd_Click(object sender, EventArgs e)
        {
            if(ddlTSCroute.SelectedValue=="0" || ddlTSCweekday.SelectedValue=="0" || ddlTSCtime.SelectedValue=="0" || ddlTSCtransport.SelectedValue == "0" || txtTSCfare.Text=="")
            {
                lblTSCsms.ForeColor = System.Drawing.Color.Red;
                lblTSCsms.Text = "Provide Valid Information";
            }
            else
            {
               con.Open();
                SqlCommand cmd1 = new SqlCommand();
                cmd1.Connection = con;
                cmd1.CommandText = "select scheduleid from Train_schedule where weekday='" + ddlTSCweekday.SelectedItem.Text + "' and Transport_id = '" + ddlTSCtransport.SelectedItem.Text + "'";
                SqlDataReader rdr = cmd1.ExecuteReader();
                if (rdr.Read())
                {

                    lblTSCsms.Text = "THis day and BUS is already in Database";
                }
                else
                {

                    con.Close();
                    DoTrainSchedule();
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Record Inserted Successfully...!')</script>");
                }

            }
        }

        private void DoTrainSchedule()
        {
            if (con.State == ConnectionState.Closed)
            {

                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "insert into Train_schedule (routeid, weekday, time, Transport_id, fare) values(@routeid, @weekday, @time, @transport_id,@fare)";
                cmd.Parameters.AddWithValue("@routeid", ddlTSCroute.SelectedValue);
                cmd.Parameters.AddWithValue("@weekday", ddlTSCweekday.SelectedValue);
                cmd.Parameters.AddWithValue("@time", ddlTSCtime.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@transport_id", ddlTSCtransport.SelectedValue);
                cmd.Parameters.AddWithValue("@fare", txtTSCfare.Text);
                cmd.ExecuteNonQuery();
                con.Close();

            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}