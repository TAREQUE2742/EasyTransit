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
            Session.Clear();
        }

        protected void Unnamed3_Click(object sender, EventArgs e)
        {
            Session["ad-email"] = ademail.Text;
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from Admin_info where email = @email and password = @password";
            cmd.Parameters.AddWithValue("@email", ademail.Text);
            cmd.Parameters.AddWithValue("@password",adpass.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("ViewBusDetails.aspx");
            
        }
    }
}