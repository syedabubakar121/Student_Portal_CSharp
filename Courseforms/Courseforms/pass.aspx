<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="pass.aspx.cs" Inherits="Courseforms.WebForm10" %>
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
  padding-top:90px;
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
                <asp:Button ID="OKButton" runat="server" CssClass="btn btn-primary" Text="OK" OnClick="OKButton_Click"    data-dismiss="modal" />
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
        Enter New Password
      </p>
      <div class="form-outline">
        <asp:TextBox ID="pass" runat="server" CssClass="form-control my-3"  placeholder="New Password"></asp:TextBox>
        <asp:Label ID="lblpass" runat="server" AssociatedControlID="pass" CssClass="form-label"></asp:Label>
      </div>
        <div class="form-outline">
        <asp:TextBox ID="cpass" runat="server" CssClass="form-control my-3" placeholder="Confirm Password" ></asp:TextBox>
        <asp:Label ID="lblcpass" runat="server" AssociatedControlID="cpass" CssClass="form-label"></asp:Label>
      </div>
      <asp:Button ID="change" runat="server" Text="Reset password" CssClass="btn btn-primary w-100" OnClick="change_Click"   style="background-color: #1c1b3b;" />
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
