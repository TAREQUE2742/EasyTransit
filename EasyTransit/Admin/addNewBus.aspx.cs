using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace EasyTransit.Admin
{
    public partial class addNewBus : System.Web.UI.Page
    {
        string sqlcon = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        string busID = "BUS-";
        public void Page_Load(object sender, EventArgs e)
        {

            lblsms.Text = "";
            if (!IsPostBack)
            {

                
                GenerateAutoID();
                

            }
        }

        private void GenerateAutoID()
        {

            SqlConnection con = new SqlConnection(sqlcon);

            con.Open();
            SqlCommand cmd = new SqlCommand("select count(capacity) from bus_details", con);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            i++;
            lblbusid.Text = busID + i.ToString();
            

        }

        protected void btnAddBus(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(sqlcon);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into bus_details (bus_id,bcompany_id, bus_type,capacity) values(@bus_id,@bcompany_id, @bus_type,@capacity)", con);
            cmd.Parameters.AddWithValue("@bus_id", lblbusid.Text);
            cmd.Parameters.AddWithValue("@bcompany_id", DropDownListcom.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@bus_type", DropDownListcetagory.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@capacity", txtBusCap.Text);
            cmd.Parameters.AddWithValue("@capacity", lblcap.Text);
            //lblsms.Text = "Record Insterted successfully..!";
            cmd.ExecuteNonQuery();

            con.Close();


            lblsms.Text = "Record Inserted Successfully..!";

            DropDownListcom.SelectedIndex = 0;
            DropDownListcetagory.SelectedIndex = 0;
            lblcap.Text = "";
            //ClearTextBox();
            GenerateAutoID();

            //Response.Redirect(Request.Url.AbsoluteUri);


            //Response.Write("<script LANGUAGE='JavaScript' >alert('Record Inserted Successfully...!')</script>");


        }


        protected void DropDownListcetagory_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblcap.Text = DropDownListcetagory.SelectedItem.Value;
        }



    }
}