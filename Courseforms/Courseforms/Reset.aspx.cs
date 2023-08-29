using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Courseforms
{
    public partial class WebForm9 : System.Web.UI.Page
    {

        String randomCode;

        public static String to;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        }


        protected void btnResetPassword_Click(object sender, EventArgs e)
        { 
            
            

            string mail =txtEmail.Text.ToLower().Trim();
            bool valid = IsEmailAndRegistrationIDValid(mail);
            bool exist = IsEmailExists(mail);

            //SendEmail();

            if (!valid)
            {
                ShowInvalidInputMessage("Invalid Email");

                return;
            }
            else if (!exist)
            {
                ShowInvalidInputMessage("No account is Registered with this Email, Signup First");

                return;

            }
            else
            {
                String from, pass, messageBody;
                Random rand = new Random();
                randomCode = (rand.Next(999999)).ToString();
                MailMessage message = new MailMessage();
                to = mail;
                from = "abubakarsyed332@gmail.com";
                pass = "rofdcpuzwjxeipzd";
                messageBody = "Your OTP is \n--> " + randomCode +" <--";
                message.To.Add(to);
                message.From = new MailAddress(from);
                message.Body = messageBody;
                message.Subject = "Password Reset Code";
                SmtpClient smtp = new SmtpClient("smtp.gmail.com");
                smtp.EnableSsl = true;
                smtp.Port = 587;
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential(from, pass);

                Session["OTP"] = randomCode;
                Session["email"] = mail;

                smtp.Send(message);

                Response.Redirect("OTP.aspx");




            }




        }



        

        protected bool IsEmailExists(string email)
        {
            string connectionString = GetConnectionString(); // Replace with your actual database connection string
            string query = "SELECT COUNT(*) FROM email WHERE email = @Email";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);

                    connection.Open();

                    int count = (int)command.ExecuteScalar();

                    return count > 0;
                }
            }
        }

        public bool IsEmailAndRegistrationIDValid(string email)
        {
            string emailEnding = "@fecid.paf-iast.edu.pk";
           

            if (email.EndsWith(emailEnding))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
     
        protected void ShowInvalidInputMessage(string message)
        {

            ScriptManager.RegisterStartupScript(this, GetType(), "ShowInvalidInputModal", "$('#invalidInputModal').modal('show'); $('#invalidInputMessage').text('" + message + "');", true);

        }
        protected void OKButton_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "HideInvalidRegistrationModal", "$('#invalidRegistrationModal').modal('hide');", true);

        }
    }
}