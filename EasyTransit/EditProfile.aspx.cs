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
    public partial class EditProfile : System.Web.UI.Page
    {
        string strUser = "";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (HttpContext.Current.Session["user-email"] != null)
            {
                    strUser = HttpContext.Current.Session["user-id"].ToString();
                    lblRegistrationsms.Text = "";
                if (!IsPostBack)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "Select *from Passenger_Details where userid= @strUser";
                    cmd.Parameters.AddWithValue("@strUser", strUser);
                    SqlDataReader rdr;

                    rdr = cmd.ExecuteReader();
                    if (rdr.Read())
                    {
                        rname.Text = rdr[1].ToString();
                        rpassword.Text = rdr[2].ToString();
                        rage.Text = rdr[3].ToString();
                        rgender.SelectedValue = rdr[4].ToString();
                        raddress.InnerText = rdr[5].ToString();
                        rcontact.Text = rdr[6].ToString();
                        remail.Text = rdr[7].ToString();
                        con.Close();
                    }
                    else
                    {
                        Response.Redirect("Userlogin.aspx");
                    }
                    con.Close();
                }
            }
             
           

        }

        protected void rsubmit_Click(object sender, EventArgs e)
        {
            if(rname.Text==""|| rpassword.Text==""|| rage.Text==""|| rgender.SelectedValue==""|| rcontact.Text==""|| raddress.InnerText==""|| remail.Text=="")
            {
                lblRegistrationsms.ForeColor = System.Drawing.Color.Red;
                lblRegistrationsms.Font.Bold = true;
                lblRegistrationsms.Text = "Please Provide All the information";
            }
            else
            {
                con.Open();
                SqlCommand cmd1 = new SqlCommand();
                cmd1.Connection = con;
                cmd1.CommandText = "Select *from Passenger_Details where contact= @contact";
                cmd1.Parameters.AddWithValue("@contact", rcontact.Text);
                SqlDataReader rdr;
                rdr = cmd1.ExecuteReader();
                if (rdr.Read())
                {
                    lblRegistrationsms.ForeColor = System.Drawing.Color.Red;
                    lblRegistrationsms.Font.Bold = true;
                    lblRegistrationsms.Text = "Choose Different Phone Number";
                    con.Close();
                }
                else
                {
                    con.Close();
                    if (con.State == ConnectionState.Closed)
                    {

                        SqlCommand cmd = new SqlCommand();
                        cmd.Connection = con;
                        //cmd.CommandText = string.Format("update Passenger_Details set name='{0}', password='{1}', Age='{2}',Gender='{3}',contact='{4}',address='{5}',email='{6}' where userid='{7}'",rname.Text,rpassword.Text,rage.Text,rgender.SelectedValue,rcontact.Text,raddress.InnerText,remail.Text,strUser);
                        cmd.CommandText = "Update Passenger_Details set name='" + rname.Text + "', password='" + rpassword.Text + "', Age='" + rage.Text + "', Gender='" + rgender.SelectedValue + "', contact='" + rcontact.Text + "', address='" + raddress.InnerText + "', email='" + remail.Text + "' where userid='" + strUser + "'";
                        con.Open();
                        try
                        {
                            cmd.ExecuteNonQuery();
                            con.Close();
                            rname.Text = "";
                            rpassword.Text = "";
                            rage.Text = "";
                            rgender.SelectedItem.Text = "";
                            rcontact.Text = "";
                            raddress.InnerText = "";
                            remail.Text = "";

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Update successfull.....');", true);
                        }
                        catch
                        {
                            lblRegistrationsms.Text = "Sorry Try With Another Gmail..!";
                        }


                    }
                }
            }
           
        }
    }
}