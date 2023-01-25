using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace PracticaDP2.Class
{
    public class Conexion
    {

        private static SqlConnection conn;
        private static string error;

        public static SqlConnection getConexion()
        {            
            try
            {
                conn = new SqlConnection();
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["connDBDP"].ConnectionString;
                conn.Open();

                return conn;
            }
            catch(Exception ex)
            {
                error = ex.Message;
                return null;
            }

        }

    }
}