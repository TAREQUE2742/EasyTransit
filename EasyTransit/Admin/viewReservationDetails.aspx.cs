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

namespace EasyTransit.Admin
{
    public partial class viewReservationDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ReservationView.Visible = true;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ReservationView.Visible = true;
        }

        protected void btnPassengerSearch_Click(object sender, EventArgs e)
        {
            if (txtBusIDSearch.Text == "")
            {
                lblemailsearchsms.ForeColor = System.Drawing.Color.Red;
                lblemailsearchsms.Text = "Please provide Search Value.";
            }
            else
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "Select DISTINCT Passenger_Details.email FROM bus_reservation INNER JOIN Passenger_Details ON bus_reservation.passenger_id = Passenger_Details.userid WHERE (bus_reservation.Transport_id = @transport_id) ";
                    cmd.Parameters.AddWithValue("@transport_id", txtBusIDSearch.Text);
                    SqlDataReader rdr = cmd.ExecuteReader();
                    if(rdr.Read())
                    {
                        txtEmails.Text = Convert.ToString(rdr["email"]);
                        //string emails = Convert.ToString(rdr["email"]);
                        //lblemailsearchsms.Text = emails;
                        rdr.Close();
                       
                    }
                    else
                    {
                        lblemailsearchsms.Text = "Please Provide Valid Information.";
                    }
                }
               

            }
        }

        protected void btnSendMail_Click(object sender, EventArgs e)
        {

        }
        protected void mailsend()
        {
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("easytransitbd@gmail.com", "Sondip.1005199535");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "Bus Unavailable for some unwanted situation";
            msg.Body = "Hi, We are really sorry for this situation, We will Provide You The Latest Update.Thanks for Ticket Booking at EasyTransit.";
            string toaddress = txtEmails.Text;
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
    }
}