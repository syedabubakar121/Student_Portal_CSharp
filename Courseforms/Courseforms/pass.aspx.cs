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
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"]==null)
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void OKButton_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "HideInvalidRegistrationModal", "$('#invalidRegistrationModal').modal('hide');", true);

        }

        protected void change_Click(object sender, EventArgs e)
        {

            string password = pass.Text.Trim();
            string cpassword = cpass.Text.Trim();
            string email = Session["email"].ToString();

            if(password==cpassword)
            {

                string connectionString = GetConnectionString(); // Replace with your actual database connection string

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string updateQuery = "UPDATE email SET password = @NewPassword WHERE email = @Email";

                    using (SqlCommand command = new SqlCommand(updateQuery, connection))
                    {
                        command.Parameters.AddWithValue("@NewPassword", password);
                        command.Parameters.AddWithValue("@Email", email);

                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();

                       
                            ShowInvalidInputMessage("Password Changed Successfully");
                        Session["email"] = null;
                            Response.Redirect("login.aspx");
                        
                       
                    }







                }


            }


            else

            {

                ShowInvalidInputMessage("Passwords doesn't Match");
            }
        }

        protected void ShowInvalidInputMessage(string message)
        {

            ScriptManager.RegisterStartupScript(this, GetType(), "ShowInvalidInputModal", "$('#invalidInputModal').modal('show'); $('#invalidInputMessage').text('" + message + "');", true);

        }

        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        }
    }
}