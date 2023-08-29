using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Courseforms
{
    public partial class WebForm5 : System.Web.UI.Page
    {     protected string userName;


       

        protected void Page_Load(object sender, EventArgs e)
        {     
            if(Session["UserID"] == null)
            {
                // Redirect to the login page
                Response.Redirect("~/login.aspx");
            }

            string id = Session["UserID"].ToString();



            string connectionString = GetConnectionString(); // Replace with your actual database connection string

            string studentId = id; // Replace with the actual ID of the student



            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT firstname, lastname FROM student WHERE regid = @Id";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id", studentId);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string fname = reader["firstname"].ToString();
                            string lname = reader["lastname"].ToString();
                            userName = fname + " " + lname;
                        }
                    }
                }
               
            }


        }
        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            
                // Clear session or authentication-related data
                Session.Clear();
                Session["UserID"] = null;
                FormsAuthentication.SignOut();

                // Redirect the user to the login page or another page
                Response.Redirect("~/login.aspx");
            

        }

        protected void btnHome_Click(object sender, EventArgs e)
        {

        }
    }
    
}