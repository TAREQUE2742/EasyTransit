using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.Collections.Specialized;

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
                    try
                    {
                        cmd.ExecuteNonQuery();
                        con.Close();
                        mailsend();
                        smssend();
                        rname.Text = "";
                        rpassword.Text = "";
                        rage.Text = "";
                        rgender.SelectedItem.Text = "";
                        rcontact.Text = "";
                        raddress.InnerText = "";
                        remail.Text = "";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Your Registration successful and Check your mail for Further information..!');window.location.href = 'Userlogin.aspx'", true);
                    }
                    catch
                    {
                        lblRegistrationsms.Text = "Please Use Another Phone Number";
                    }
                  
               
                }
            }

        }

        protected void mailsend()
        {
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("easytransitbd@gmail.com", "Sondip.1005199535");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "Hello " + rname.Text + "  Thanks for Register at EasyTransit";
            msg.Body = "Hi, Thanks For Your Registration at EasyTransit, Your Username: '" + remail.Text + "' and Password: '" + rpassword.Text + "', We will Provide You The Latest Update. Thanks.";
            string toaddress = remail.Text;
            msg.To.Add(toaddress);
            string fromaddress = "EasyTransit <easytransitbd@gmail.com>";
            msg.From = new MailAddress(fromaddress);
            try
            {
                smtp.Send(msg);
            }
            catch
            {
                throw;
            }
        }

        protected void smssend()
        {
            string destinationaddr = "+88" + rcontact.Text;
            string message = "Hi " + rname.Text + " , You Have Been Registered at EasyTransit. Thanks!!";

            String message1 = HttpUtility.UrlEncode(message);
            using (WebClient client = new WebClient())
            {
                byte[] response = client.UploadValues("http://textbelt.com/text", new NameValueCollection() {
                        { "phone", destinationaddr},
                        { "message", message1},
                        { "key", "textbelt" },
                      });

                string result = System.Text.Encoding.UTF8.GetString(response);
            }
        }
    }
}