using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace EasyTransit.Admin
{
    public partial class ViewBusDetails : System.Web.UI.Page
    {
       
        

      

        SqlConnection sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ad-email"] ==null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                if (!IsPostBack)
                {

                    SerachView.Visible = true;
                    GridBusView.Visible = true;
                }
            }
           
        }

        protected void txtsearch_DataBinding(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SerachView.Visible = true;
            GridBusView.Visible = true;
        }

       


       
    }

}