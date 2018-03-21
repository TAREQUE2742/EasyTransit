using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace EasyTransit
{
    public class autogenerateid
    {
        public int increment_id()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["mycon"].ToString());
            SqlCommand cmds = new SqlCommand("select max(question_id) from p_topic)", conn);
            conn.Open();
            int create;
            int cal;
            SqlDataReader sdr = cmds.ExecuteReader();  //Exception Occurs Here
            if (sdr.Read())
            {
                string num = sdr[0].ToString();
                if (num == "")
                {
                    create = 1;
                    return create;
                }
                else
                {
                    cal = Convert.ToInt32(sdr[0].ToString());
                    cal = cal + 1;
                    return cal;
                }
            }
            return 0;

            
        }

    }
}