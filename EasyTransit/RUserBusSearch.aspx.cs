﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EasyTransit
{
    public partial class RUserBusSearch : System.Web.UI.Page
    {
        string buscom;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["route"] != null && Session["day"] != null)
            {
                td1.Visible = false;
                td2.Visible = false;
                td1.Text = Session["route"].ToString();
                td2.Text = Session["day"].ToString();
                td3.ForeColor = System.Drawing.Color.Black;
                td3.Font.Bold = true;
                td4.Font.Bold = true;
                td4.ForeColor = System.Drawing.Color.Black;
                td3.Text = "Journey Trip : " + Session["Ori"].ToString() + " -TO- " + Session["Desti"].ToString();
                td4.Text = "On - " + Session["JourneyDate"];

                //if (con.State == ConnectionState.Closed)
                //{

                //    con.Open();
                //    SqlCommand cmd = new SqlCommand();
                //    cmd.Connection = con;
                //    cmd.CommandText = "SELECT Bus_company.bcompany_name, Bus_routes.origin, Bus_routes.destination, Bus_schedule.weekday, Bus_schedule.time, Bus_schedule.fare, Bus_schedule.Transport_id FROM Bus_company INNER JOIN bus_details ON Bus_company.bcompany_id = bus_details.bcompany_id INNER JOIN Bus_schedule ON bus_details.bus_id = Bus_schedule.Transport_id INNER JOIN Bus_routes ON Bus_schedule.routeid = Bus_routes.routeid WHERE (Bus_schedule.weekday = '" +td2.Text+ "') AND (Bus_schedule.routeid = '" +td1.Text+ "')";
                //    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                //    DataTable dt = new DataTable();
                //    sda.Fill(dt);
                //    BusSResult.DataSource = dt;
                //    BusSResult.DataBind();

                //}
                BusSResult.Visible = true;

            }

          

        }

        protected void BusSResult_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Select"))
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
                string firstArgVal = commandArgs[0];
                string secondArgVal = commandArgs[1];
                Session["bcompany"] = firstArgVal;
                Session["btrans"] = secondArgVal;
                Response.Write(firstArgVal+" "+secondArgVal);
                //Response.Redirect("RUserpayment.aspx");
            }
        }

        protected void BusSResult_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {


            //Response.Redirect("RUserpayment.aspx");
        }
    }
}