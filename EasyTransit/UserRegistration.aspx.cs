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
    public partial class UserRegistration : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void rsubmit_Click(object sender, EventArgs e)
        {
            if(rname.Text=="" || rpassword.Text=="" || rage.Text=="" || rcontact.Text=="" || remail.Text=="")
            {
                lblRegistrationsms.Text = "Please Provide Valid Information";
            }
            else
            {

            
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "INSERT INTO Passenger_Details(name,password ,Age ,Gender ,address,contact ,email) values(@name,@password ,@Age ,@Gender ,@address,@contact ,@email)";
                    cmd.Connection = con;
                    cmd.Parameters.AddWithValue("@name", rname.Text);
                    cmd.Parameters.AddWithValue("@password", rpassword.Text);
                    cmd.Parameters.AddWithValue("@Age", rage.Text);
                    cmd.Parameters.AddWithValue("@Gender", rgender.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@contact", rcontact.Text);
                    cmd.Parameters.AddWithValue("@address", raddress.InnerText);
                    cmd.Parameters.AddWithValue("@email", remail.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
               
                    rname.Text = "";
                    rpassword.Text = "";
                    rage.Text = "";
                    rgender.SelectedItem.Text = "";
                    rcontact.Text = "";
                    raddress.InnerText = "";
                    remail.Text = "";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Registration successfully.....');window.location.href = 'Userlogin.aspx'", true);
               
                }
            }

        }
    }
}