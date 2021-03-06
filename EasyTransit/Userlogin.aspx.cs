﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace EasyTransit
{
    public partial class Userlogin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginbtn_Click(object sender, EventArgs e)
        {
            if(tusername.Text=="" || tpassword.Text == "")
            {
                lblusersms.Text = "Please Provide Email or Password";
            }
            else { 
                if (con.State == ConnectionState.Closed)
                {

                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "select * from Passenger_Details where email = @email and password = @password";
                    cmd.Parameters.AddWithValue("@email", tusername.Text);
                    cmd.Parameters.AddWithValue("@password", tpassword.Text);
                    SqlDataReader dr = cmd.ExecuteReader();
                    
                    if (dr.HasRows)
                    {
                        if (dr.Read())
                        {
                            Session["user-email"] = tusername.Text;
                            HttpContext.Current.Session["user-name"] = dr["name"].ToString();
                            HttpContext.Current.Session["user-contact"] = dr["contact"].ToString();
                            HttpContext.Current.Session["user-id"] = dr["userid"].ToString();
                            Response.Redirect("ruserslide.aspx");
                            dr.Close();
                        }
                      
                    }
                    else
                    {
                        dr.Close();
                        Response.Write("<script LANGUAGE='JavaScript' >alert('Login Failed')</script>");

                    }
                    con.Close();

                }

            }
        }
    }
}