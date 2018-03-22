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
    public partial class Default : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            
            con.Open();
          
        }

        protected void Page_Unload(object sender, EventArgs e)
        {
            con.Close();
        }

        protected void Unnamed3_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from Admin_info where email = @email and password = @password";
            cmd.Parameters.AddWithValue("@email", ademail.Text);
            cmd.Parameters.AddWithValue("@password",adpass.Text);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
                Session["ad-email"] = ademail.Text;
                Response.Redirect("ViewBusDetails.aspx");
                dr.Close();
            }
            else
            {
                dr.Close();
                Response.Write("<script LANGUAGE='JavaScript' >alert('Login Failed')</script>");

            }
            
        }
    }
}