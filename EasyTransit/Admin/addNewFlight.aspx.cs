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
    public partial class addNewFlight : System.Web.UI.Page
    {
        string sqlcon = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString();
        string flightid = "Flight-";

        protected void Page_Load(object sender, EventArgs e)
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
            SqlCommand cmd = new SqlCommand("select MAX(Sl) from flight_details ", con);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            i++;
            lblflightnum.Text = flightid + i.ToString();

            //string tableColumnName = "flight_id";
            //string defColValue = "Flight";
            //string tableName = "flight_details";
            //autogenerateid autoid = new autogenerateid();
            //string _get = autoid.AutogenerateID(tableColumnName, defColValue, tableName);
            //string[] _sepID = _get.Split('0');
            //int i = Convert.ToInt32(_sepID[1]);
            //i++;
            //txtFlightNum.Text = flightid + 1;

        }

        protected void btnaddFlight_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(sqlcon);
            SqlCommand cmd = new SqlCommand("insert into flight_details (flight_id, fcompany_id, flight_type, capacity) values(@flight_id, @fcompany_id,@flight_type,@capacity)", con);
            cmd.Parameters.AddWithValue("@flight_id", lblflightnum.Text);
            cmd.Parameters.AddWithValue("@fcompany_id", DropDownlistcom.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@flight_type", DropDownlistcategory.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@capacity", lblflightcap.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            lblsms.Text = "Record Inserted Successfully..!";

            DropDownlistcom.SelectedIndex = 0;
            DropDownlistcategory.SelectedIndex = 0;
            lblflightcap.Text = "";
            //ClearTextBox();
            GenerateAutoID();
        }

        protected void DropDownlistcategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblflightcap.Text = DropDownlistcategory.SelectedItem.Value;
        }
    }
}