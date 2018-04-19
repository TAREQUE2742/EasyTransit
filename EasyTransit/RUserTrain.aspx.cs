using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EasyTransit
{
    public partial class RUserTrain : System.Web.UI.Page
    {
        string Day;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtTjourneyDate.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
            }

        }

        protected void btnTrainSearch_Click(object sender, EventArgs e)
        {
            if (ddlOriginTrain.SelectedIndex == ddlDestination.SelectedIndex)
            {
                lbltrainSearchsms.ForeColor = System.Drawing.Color.Red;
                lbltrainSearchsms.Font.Bold = true;
                lbltrainSearchsms.Text = "Orign and Destination shouldn't Same.";
            }
            else
            {
                if (ddlOriginTrain.SelectedValue == "0" || ddlDestination.SelectedValue == "0" || txtTjourneyDate.Text == "")
                {
                    lbltrainSearchsms.ForeColor = System.Drawing.Color.Red;
                    lbltrainSearchsms.Font.Bold = true;
                    lbltrainSearchsms.Text = "Provide Valid Information";
                }
                else
                {
                    Session["tJourneyDate"] = txtTjourneyDate.Text;
                    Day = Convert.ToDateTime(txtTjourneyDate.Text).DayOfWeek.ToString();

                    DoTrainSearch();
                }
            }

        }

        private void DoTrainSearch()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "select routeid from Train_routes where origin = '" + ddlOriginTrain.SelectedItem.Text + "' and destination = '" + ddlDestination.SelectedItem.Text + "'";
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {
                    string Troute = Convert.ToString(rdr["routeid"]);
                    string TOri = Convert.ToString(ddlOriginTrain.Text);
                    string TDesti = Convert.ToString(ddlDestination.Text);
                    Session["troute"] = Troute;
                    Session["tday"] = Day;
                    Session["tOri"] = TOri;
                    Session["tDesti"] = TDesti;
                    Response.Redirect("RUserTrainSearch.aspx");

                }
                else
                {
                    lbltrainSearchsms.Text = "This Route is not available";

                }
                con.Close();
            }
        }
    }
}