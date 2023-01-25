using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

namespace PracticaDP2.Class
{
    public class DistributorService
    {

        public SqlConnection conexion;
        public SqlTransaction transaccion;
        public string error;

        public DistributorService()
        {
            this.conexion = Conexion.getConexion();
        }

        public bool addDistributor(Distributor distributor)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conexion;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.DISTIBUTORS_SAVE_SP";

                cmd.Parameters.Add("@p_id", SqlDbType.NVarChar).Value = distributor.id;
                cmd.Parameters.Add("@p_name", SqlDbType.NVarChar).Value = distributor.Name;
                cmd.Parameters.Add("@p_father_last_name", SqlDbType.NVarChar).Value = distributor.FatherLastName;
                cmd.Parameters.Add("@p_mother_last_name", SqlDbType.NVarChar).Value = distributor.MotherLasName;
                cmd.Parameters.Add("@p_street", SqlDbType.NVarChar).Value = distributor.Street;
                cmd.Parameters.Add("@p_number", SqlDbType.NVarChar).Value = distributor.Number;
                cmd.Parameters.Add("@p_neighborhood", SqlDbType.NVarChar).Value = distributor.Neighborhood;

                cmd.ExecuteNonQuery();

                conexion.Close();

                return true;

            }catch(SqlException ex)
            {
                this.error = ex.Message;
                return false;
            }
            
        }
        
        public Distributor getDistributor(string id)
        {
            try
            {
                Distributor dis = new Distributor();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conexion;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "dbo.DISTRIBUITOR_GET_SP";

                cmd.Parameters.Add("@p_id", SqlDbType.NVarChar).Value = id;

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        dis.id = dr.GetString(0);
                        dis.NameFull = dr.GetString(1);
                        dis.Street = dr.GetString(2);
                        dis.Number = dr.GetInt32(3);
                        dis.Neighborhood = dr.GetString(4);

                    }
                }

                return dis;

            }
            catch (SqlException ex)
            {
                this.error = ex.Message;
                return null;
            }
       
        }
         
    }
}