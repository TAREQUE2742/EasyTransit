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
  
        string sqlcon = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
        }

      
    }
}