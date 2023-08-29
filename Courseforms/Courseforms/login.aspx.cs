using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

namespace Courseforms
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        }


        protected void OKButton_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "HideInvalidRegistrationModal", "$('#invalidRegistrationModal').modal('hide');", true);

        }
        protected void ShowInvalidInputMessage(string message)
        {

            ScriptManager.RegisterStartupScript(this, GetType(), "ShowInvalidInputModal", "$('#invalidInputModal').modal('show'); $('#invalidInputMessage').text('" + message + "');", true);

        }
        protected void btnLogin_Click1(object sender, EventArgs e)
        {
            string providedUsername = txtUsername.Text.ToUpper().Trim();
            string providedPassword = txtPassword.Text.Trim();



            if (providedUsername == "" || providedPassword == "")
            {
                ShowInvalidInputMessage("Enter Some Value");
            }

            else
            {
                string connectionString = GetConnectionString(); // Replace with your actual connection string

                string query = "SELECT * FROM email WHERE regid = @ProvidedUsername AND password = @ProvidedPassword;";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Set parameter values
                        command.Parameters.AddWithValue("@ProvidedUsername", providedUsername);
                        command.Parameters.AddWithValue("@ProvidedPassword", providedPassword);

                        connection.Open();

                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.HasRows)
                        {
                            // Login successful
                            while (reader.Read())
                            {
                                // Access user data if needed
                                string username = reader["regid"].ToString();
                                // ...
                            }

                            Session["UserID"] = providedUsername;

                            Response.Redirect("home.aspx");
                        }
                        else
                        {
                            // Login failed

                            ShowInvalidInputMessage("Incorrect Credential");
                        }

                        reader.Close();
                    }
                }


            }
        }

        protected void btnForgotPassword_Click(object sender, EventArgs e)
        {

            Response.Redirect("Reset.aspx");

        }

      


    }
    }
