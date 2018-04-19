using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text;
using System.Security.Cryptography;

namespace EasyTransit
{
    public partial class TrainPayment : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Random random = new Random();
                txnid.Value = (Convert.ToString(random.Next(10000, 20000)));
                txnid.Value = "Sondip" + txnid.Value.ToString();
                try
                {
                    string useremail = Session["user-email"].ToString();
                    string username = Session["user-name"].ToString();
                    string usercontact = Session["user-contact"].ToString();
                    string routeId = Session["troute"].ToString();
                    string jourdate = Session["tJourneyDate"].ToString();
                    string tcom = Session["tcompany"].ToString();
                    string jourday = Session["tday"].ToString();
                    string jourori = Session["tOri"].ToString();
                    string jourDes = Session["tDesti"].ToString();
                    string ttransid = Session["ttrans"].ToString();
                    string cap = Session["tcapa"].ToString();
                    string TRAINfare = Session["tfare"].ToString();
                    string TRAINavailable = Session["tavailablese"].ToString();
                    lbluserNAME.Text = username;
                    lbluserCOntact.Text = usercontact;
                    lbluseremail.Text = useremail;
                    lbltraincom.Text = tcom;
                    lbltrainid.Text = ttransid;
                    lbldestinationstation.Text = jourDes;
                    lbljourdate.Text = jourdate;
                    lbljourday.Text = jourday;
                    lbloriginstation.Text = jourori;
                    lblTrainfare.Text = TRAINfare;
                    lblavailableS.Text = TRAINavailable;
                }
                catch
                {
                    Response.Redirect("RUserTrain.aspx");
                }
            }
        }


        protected void ddlseatsQuantity_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Trainfare = Session["tfare"].ToString();
            int far = Convert.ToInt32(Trainfare);
            string quantity = ddlseatsQuantity.SelectedValue;
            int quan = Convert.ToInt32(quantity);
            lblTrainfare.Text = (far * quan).ToString();
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            double amount = Convert.ToDouble(lblTrainfare.Text);
            Session["seatQuantity"] = ddlseatsQuantity.SelectedValue;


            String text = key.Value.ToString() + "|" + txnid.Value.ToString() + "|" + amount + "|" + ddlseatsQuantity.SelectedValue + "|" + lbluserNAME.Text + "|" + lbluseremail.Text + "|" + "1" + "|" + "1" + "|" + "1" + "|" + "1" + "|" + "1" + "||||||" + salt.Value.ToString();
            //Response.Write(text);
            byte[] message = Encoding.UTF8.GetBytes(text);

            UnicodeEncoding UE = new UnicodeEncoding();
            byte[] hashValue;
            SHA512Managed hashString = new SHA512Managed();
            string hex = "";
            hashValue = hashString.ComputeHash(message);
            foreach (byte x in hashValue)
            {
                hex += String.Format("{0:x2}", x);
            }
            hash.Value = hex;

            System.Collections.Hashtable data = new System.Collections.Hashtable(); // adding values in gash table for data post
            data.Add("hash", hex.ToString());
            data.Add("txnid", txnid.Value);
            data.Add("key", key.Value);
            // string AmountForm = ;// eliminating trailing zeros

            data.Add("amount", amount);
            data.Add("firstname", lbluserNAME.Text.Trim());
            data.Add("email", lbluseremail.Text.Trim());
            data.Add("phone", lbluserCOntact.Text.Trim());
            data.Add("productinfo", ddlseatsQuantity.SelectedValue);
            data.Add("udf1", "1");
            data.Add("udf2", "1");
            data.Add("udf3", "1");
            data.Add("udf4", "1");
            data.Add("udf5", "1");

            data.Add("surl", "http://localhost:7742/TSuccess.aspx");
            data.Add("furl", "http://localhost:7742/TFailure.aspx");

            data.Add("service_provider", "");


            string strForm = PreparePOSTForm("https://test.payu.in/_payment", data);
            Page.Controls.Add(new LiteralControl(strForm));
        }
        private string PreparePOSTForm(string url, System.Collections.Hashtable data)      // post form
        {
            //Set a name for the form
            string formID = "PostForm";
            //Build the form using the specified data to be posted.
            StringBuilder strForm = new StringBuilder();
            strForm.Append("<form id=\"" + formID + "\" name=\"" +
                           formID + "\" action=\"" + url +
                           "\" method=\"POST\">");

            foreach (System.Collections.DictionaryEntry key in data)
            {

                strForm.Append("<input type=\"hidden\" name=\"" + key.Key +
                               "\" value=\"" + key.Value + "\">");
            }


            strForm.Append("</form>");
            //Build the JavaScript which will do the Posting operation.
            StringBuilder strScript = new StringBuilder();
            strScript.Append("<script language='javascript'>");
            strScript.Append("var v" + formID + " = document." +
                             formID + ";");
            strScript.Append("v" + formID + ".submit();");
            strScript.Append("</script>");
            //Return the form and the script concatenated.
            //(The order is important, Form then JavaScript)
            return strForm.ToString() + strScript.ToString();
        }
    }
}