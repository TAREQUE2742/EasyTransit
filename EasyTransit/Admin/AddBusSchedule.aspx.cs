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
    public partial class AddBusSchedule : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            lblbschedulesms.Text = "";
           
        }

        protected void btnBSC_Click(object sender, EventArgs e)
        {
            lblbschedulesms.Text = "";
            if(txtbscfare.Text=="" || ddlBSClist.SelectedValue=="0" || ddlbschedule.SelectedValue=="0" || dropdownbsctransport.SelectedValue=="0" || ddlBSCtime.SelectedValue=="0")
            {
                lblbschedulesms.ForeColor = System.Drawing.Color.Yellow;
                lblbschedulesms.Font.Bold=true;
                lblbschedulesms.Text = "Please Provide valid Information";
                
            }
            else
            {

                con.Open();
                SqlCommand cmd1 = new SqlCommand();
                cmd1.Connection = con;
                cmd1.CommandText = "select scheduleid from Bus_schedule where weekday='" + ddlBSClist.SelectedItem.Text + "' and Transport_id = '" + dropdownbsctransport.SelectedItem.Text + "'";
                SqlDataReader rdr = cmd1.ExecuteReader();
                if (rdr.Read())
                {
                    lblbschedulesms.ForeColor = System.Drawing.Color.Yellow;
                    lblbschedulesms.Font.Bold = true;

                    lblbschedulesms.Text = "This Bus Already Have a Schedule.";
                }

                else
                {

                    con.Close();
                    DoBusSchedule();
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Record Inserted Successfully...!')</script>");
                    //int bscid = 0;
                    //bscid = Convert.ToInt32(rdr["scheduleid"]);
                    //if(bscid !=0)
                    //{
                    //    lblbschedulesms.Text = "Choose another Schedule.";
                    //}
                    //else
                    //{
                    //    lblbschedulesms.Text = "0k.";
                    //}


                    //SqlDataReader rdr = cmd.ExecuteReader();

                    ////while (rdr.Read())
                    ////{
                    ////    if (rdr["weekday"].ToString() == ddlBSClist.SelectedItem.Text && rdr["Transport_id"].ToString()==dropdownbsctransport.SelectedItem.Text)
                    ////    {
                    ////        lblbschedulesms.Text = "THis day and BUS is already in Database";
                    ////    }
                    ////    else if(rdr["weekday"].ToString() == ddlBSClist.SelectedItem.Text && rdr["Transport_id"].ToString() != dropdownbsctransport.SelectedItem.Text)
                    ////    {
                    ////        lblbschedulesms.Text = "The Bus Not Assign that Day";
                    ////        Response.Redirect(Request.Url.AbsoluteUri);
                    ////    }
                    ////}

                    //while (rdr.Read())
                    //{
                    //    if (rdr.HasRows)
                    //    {

                    //        if (rdr["weekday"].ToString() == ddlBSClist.SelectedItem.Text && rdr["Transport_id"].ToString() == dropdownbsctransport.SelectedItem.Text)
                    //        {
                    //            lblbschedulesms.Text = "THis day and BUS is already in Database";
                    //        }
                    //        else if (rdr["weekday"].ToString() == ddlBSClist.SelectedItem.Text && rdr["Transport_id"].ToString() != dropdownbsctransport.SelectedItem.Text)
                    //        {
                    //            lblbschedulesms.Text = "The Bus Not Assign that Day";

                    //        }
                    //    }
                    //}

                }

                //lblbschedulesms.ForeColor = System.Drawing.Color.Green;
                //lblbschedulesms.Text = "data saved"; 
            }
        }

        private void DoBusSchedule()
        {
            if (con.State == ConnectionState.Closed)
            {

                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "insert into Bus_schedule (routeid, weekday, time, Transport_id, fare) values(@routeid, @weekday, @time, @transport_id,@fare)";
                cmd.Parameters.AddWithValue("@routeid", ddlbschedule.SelectedValue);
                cmd.Parameters.AddWithValue("@weekday", ddlBSClist.SelectedValue);
                cmd.Parameters.AddWithValue("@time", ddlBSCtime.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@transport_id", dropdownbsctransport.SelectedValue);
                cmd.Parameters.AddWithValue("@fare", txtbscfare.Text);
                cmd.ExecuteNonQuery();
                con.Close();
              
            }

        }

        protected void ddlbschedule_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}