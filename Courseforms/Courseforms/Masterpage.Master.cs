using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Courseforms
{
    public partial class Masterpage : System.Web.UI.MasterPage
    {
        protected string userName;
        protected string id;
       
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserID"] != null)
            {

                id = Session["UserID"].ToString();



                string connectionString = GetConnectionString(); // Replace with your actual database connection string

                string studentId = id; // Replace with the actual ID of the student



                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "SELECT firstname FROM student WHERE regid = @Id";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Id", studentId);

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                userName = reader["firstname"].ToString();

                            }
                        }
                    }

                }
            }


        }
        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        }


    }
}