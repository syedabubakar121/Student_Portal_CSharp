<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="OTP.aspx.cs" Inherits="Courseforms.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <style>

 html,body{
background-image: url('http://getwallpapers.com/wallpaper/full/a/5/d/544750.jpg');
background-size: cover;
background-repeat: no-repeat;
height: 100%;
font-family: 'Numans', sans-serif;

}



.password-reset-page {
 display: flex;
  justify-content: center;
  align-items: center;
  height: 40vh;
}





    </style>


    <%--	RESET PASSWORD--%>

   
       <!DOCTYPE html>








<html>

    <div class="modal fade" id="invalidInputModal" tabindex="-1" role="dialog" aria-labelledby="invalidInputModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="invalidInputModalLabel">Invalid Input</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p id="invalidInputMessage"></p>
            </div>
            <div class="modal-footer">
                <asp:Button ID="OKButton" runat="server" CssClass="btn btn-primary" Text="OK" OnClick="OKButton_Click"   data-dismiss="modal" />
            </div>
        </div>
    </div>
</div>



<body>



    <section>
<%-- Password Reset Page --%>
<div class="password-reset-page">
  <div id="resetPasswordDiv" runat="server" class="card text-center">
    <div class="card-header h5 text-white "  style="background-color: #1c1b3b;">Password Reset</div>
    <div class="card-body px-5">
      <p class="card-text py-2">
        Enter The OTP sent on your Email Adress
      </p>
      <div class="form-outline">
        <asp:TextBox ID="txtotp" runat="server" CssClass="form-control my-3" ></asp:TextBox>
        <asp:Label ID="OTP" runat="server" AssociatedControlID="txtotp" CssClass="form-label"></asp:Label>
      </div>
      <asp:Button ID="verify" runat="server" Text="Verify Email" CssClass="btn btn-primary w-100" OnClick="verify_Click"  style="background-color: #1c1b3b;" />
      <div class="d-flex justify-content-between mt-4">
        <a href="login.aspx">Login</a>
        <a href="signup.aspx">Sign Up</a>
      </div>
    </div>
  </div>
</div>

</section>

    </body>

    </html>





</asp:Content>
