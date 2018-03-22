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
    public partial class addNewTrain : System.Web.UI.Page
    {

        string sqlcon = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString();
        string trainid = "Train-";
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
            SqlCommand cmd = new SqlCommand("select MAX(Sl) from train_details ", con);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            i++;
            lbltrainnum.Text = trainid + i.ToString();

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


        protected void DropDownListcetagory_SelectedIndexChanged(object sender, EventArgs e)
        {
            lbltraincap.Text = DropDownListcetagory.SelectedItem.Value;
        }

        protected void btnaddTrain_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(sqlcon);
            SqlCommand cmd = new SqlCommand("insert into train_details (train_id, tcompany_id, train_type, capacity) values(@train_id, @tcompany_id,@train_type,@capacity)", con);
            cmd.Parameters.AddWithValue("@train_id", lbltrainnum.Text);
            cmd.Parameters.AddWithValue("@tcompany_id", DropDownListcom.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@train_type", DropDownListcetagory.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@capacity", lbltraincap.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            lblsms.Text = "Record Inserted Successfully..!";

            DropDownListcom.SelectedIndex = 0;
            DropDownListcetagory.SelectedIndex = 0;
            lbltraincap.Text = "";
            //ClearTextBox();
            GenerateAutoID();
        }
    }
}