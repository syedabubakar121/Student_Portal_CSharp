using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.NetworkInformation;
using System.Runtime.InteropServices;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Courseforms
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        }

        protected void ShowInvalidInputMessage(string message)
        {

            ScriptManager.RegisterStartupScript(this, GetType(), "ShowInvalidInputModal", "$('#invalidInputModal').modal('show'); $('#invalidInputMessage').text('" + message + "');", true);

        }

        public bool IsRegistrationIDValid(string registrationID)
        {
            // Define the regular expression pattern for the registration ID format
            string pattern = @"^B2\d[SF]\d{4}(CS|SE|AI|DS)\d{3}$";

            // Check if the registration ID matches the pattern
            bool isValid = Regex.IsMatch(registrationID, pattern);

            return isValid;
        }

        public bool IsEmailAndRegistrationIDValid(string email, string registrationID)
        {
            string emailEnding = "@fecid.paf-iast.edu.pk";
            string expectedRegistrationID = email.Split('@')[0];

            if (email.EndsWith(emailEnding) && registrationID.Equals(expectedRegistrationID, StringComparison.OrdinalIgnoreCase))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        protected void btnSignUp_Click(object sender, EventArgs e)
        {



                // Retrieve form data
                string firstName = FirstName.Text.Trim();
                string lastName = LastName.Text.Trim();

            string pattern = @"[0-9!@#$%^&*(),.?""':{}|<>]";
            bool cont = Regex.IsMatch(firstName, pattern) || Regex.IsMatch(lastName, pattern);









            string email = Email.Text.ToLower().Trim();
                string password = txtPassword.Text.Trim();
            string Regid = Regno.Text.ToUpper().Trim();
                 bool idvalid = IsRegistrationIDValid(Regid);
                  bool mailvaid = IsEmailAndRegistrationIDValid(email,Regid);

            if(cont)
            {
                ShowInvalidInputMessage("Name does not allow numbres or spcial charachter");
                return;
            }

            else if (!idvalid)
            {

                //Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowInvalidRegistrationModal", "$('#invalidRegistrationModal').modal('show');", true);

                ShowInvalidInputMessage("Invalid Registration ID");
                return;
            }
            else if (!mailvaid)
            {
                ShowInvalidInputMessage("Invalid Email ID");
                return;
            }


            // Create connection

            else
            {

                try
                {
                    string connectionString = GetConnectionString(); ; // Replace with your actual connection string
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        // Create INSERT statement
                        string insertQuery = @"
                     BEGIN TRANSACTION;
                        
                    
                      INSERT INTO student (firstname, lastname, regid) VALUES (@FirstName, @LastName, @regid);


                   INSERT INTO  email (email,password,regid) Values (@Email,@txtPassword,@regid1);
                    

                            COMMIT;";


                        // Create command and parameters
                        using (SqlCommand command = new SqlCommand(insertQuery, connection))
                        {
                            command.Parameters.AddWithValue("@FirstName", firstName);
                            command.Parameters.AddWithValue("@LastName", lastName);
                            command.Parameters.AddWithValue("@regid", Regid);

                            command.Parameters.AddWithValue("@Email", email);
                            command.Parameters.AddWithValue("@txtPassword", password);
                            command.Parameters.AddWithValue("@regid1", Regid);
                            // Open connection and execute INSERT statement
                            connection.Open();
                            command.ExecuteNonQuery();
                        }

                        //using (SqlCommand command2 =new SqlCommand (emailQuery,connection))
                        //{


                        //command2.ExecuteNonQuery();
                        //}

                    }

                    // Redirect or show success message

                    ShowInvalidInputMessage("Sign Up Successfull");
                    return;
                    Response.Redirect("login.aspx");

                }

                catch (Exception ex)
                {

                    ShowInvalidInputMessage("SIGN UP FAILED ! TRY AGAIN :)");
                    return;


                }
            }












        }

        protected void OKButton_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "HideInvalidRegistrationModal", "$('#invalidRegistrationModal').modal('hide');", true);

        }
    }
}