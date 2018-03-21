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
    public partial class viewRouteDetails : System.Web.UI.Page
    {
        string routeID="ROUTE-";
        string sqlcon = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                IdGenerator();
            }
        }

        private void IdGenerator()
        {
            Label li = FormView1.FindControl("routeidlbl") as Label;
            SqlConnection con = new SqlConnection(sqlcon);

            con.Open();
            SqlCommand cmd = new SqlCommand("select count(routeid) from route_details", con);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            i++;
           
            li.Text = routeID + i.ToString();
        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            IdGenerator();
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            IdGenerator();
        }
    }
}