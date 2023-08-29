using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Courseforms
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (Session["UserID"] == null)
            //{
            //    // Redirect to the login page
            //    Response.Redirect("~/login.aspx");
            //}
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear session or authentication-related data
            Session.Clear();
            Session["UserID"] = null;
            //FormsAuthentication.SignOut();

            // Redirect the user to the login page or another page
            Response.Redirect("~/login.aspx");
        }
    }
}