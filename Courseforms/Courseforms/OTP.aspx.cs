using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Courseforms
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if ( Session["OTP"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void verify_Click(object sender, EventArgs e)
        {
            if (Session["OTP"].ToString()==txtotp.Text.Trim())

            {
                Session["OTP"] = null;
                Response.Redirect("pass.aspx");

            }
            else
            {
                ShowInvalidInputMessage("Wrong OTP \n Try Again or Recheck your Email");
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