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
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                // Redirect to the login page
                Response.Redirect("~/login.aspx");
            }
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
        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        }

        protected void btnAddNext_Click(object sender, EventArgs e)
        {
            bool exist = check_if_valid();
            bool enrolled = check_if_enroll();

            if(exist)
            {
                ShowInvalidInputMessage("Invalid Course");
                return;
            }

            else if (enrolled)
            {
                ShowInvalidInputMessage("Already Entrolled");
                return;
            }


            else
            {



                string connectionString = GetConnectionString(); // Replace with your actual database connection string

                string courseCode = txtCourseCode.Text.ToUpper().Trim(); // Replace with the course code
                string courseName = txtCourseName.Text.ToUpper().Trim(); // Replace with the course name
                string studentId = Session["UserID"].ToString(); // Replace with the student ID

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "INSERT INTO enrolement (couse_code, course_name, stid) VALUES (@CourseCode, @CourseName, @StudentId)";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@CourseCode", courseCode);
                        command.Parameters.AddWithValue("@CourseName", courseName);
                        command.Parameters.AddWithValue("@StudentId", studentId);

                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {

                            ShowInvalidInputMessage("Added");
                            txtCourseName.Text = " ";
                            txtCourseCode.Text = " ";
                            return;
                        }
                        else
                        {
                            ShowInvalidInputMessage("ERROR 404");
                            return;
                        }
                    }
                }

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
        protected bool  check_if_valid()
        {

            string connectionString = GetConnectionString(); // Replace with your actual database connection string

            string enteredCourseCode = txtCourseName.Text.ToUpper().Trim(); // Replace with the entered course code
            string enteredCourseName = txtCourseName.Text.ToUpper().Trim(); // Replace with the entered course name

            bool courseExists = false; // Variable to store the result of the existence check

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT COUNT(*) FROM course WHERE course_code = @CourseCode AND course_name = @CourseName";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CourseName", enteredCourseCode);
                    command.Parameters.AddWithValue("@CourseCode", enteredCourseName);

                    int count = Convert.ToInt32(command.ExecuteScalar());

                    if (count > 0)
                    {
                        // Course exists in the database
                        courseExists = true;
                        return courseExists;
                    }
                }
            }

            return courseExists;
        }
        protected bool check_if_enroll()
        {
            string connectionString =  GetConnectionString(); // Replace with your actual database connection string

            string studentId = Session["UserID"].ToString(); // Replace with the student ID
            string courseCode = txtCourseCode.Text.ToUpper().Trim(); // Replace with the course code

            bool alreadyEnrolled = false; // Variable to store the result of the enrollment check

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT COUNT(*) FROM enrolement WHERE stid = @StudentId AND couse_code = @CourseCode";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@StudentId", studentId);
                    command.Parameters.AddWithValue("@CourseCode", courseCode);

                    int count = Convert.ToInt32(command.ExecuteScalar());

                    if (count > 0)
                    {
                        // Student is already enrolled in the course
                        alreadyEnrolled = true;
                    }
                }
            }

            return alreadyEnrolled;

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }
    }
}