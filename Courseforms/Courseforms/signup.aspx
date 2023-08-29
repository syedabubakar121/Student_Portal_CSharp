<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="Courseforms.WebForm2" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


     <%--  INVALID TEST TES TES TES TEST--%>
                
              <!-- Modal -->
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
                <asp:Button ID="OKButton" runat="server" CssClass="btn btn-primary" Text="OK" OnClick="OKButton_Click" data-dismiss="modal" />
            </div>
        </div>
    </div>
</div>



<!-- Section: Design Block -->
<section class="text-center">
  <!-- Background image -->
  <div class="p-5 bg-image" style="
        background-image: url('data:image/jpeg;base64,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');
        background-repeat=no-repeat;
       height: 300px;
        
        "></div>
  <!-- Background image -->

  <div class="card mx-4 mx-md-5 shadow-5-strong" style="
        margin-top: -100px;


        background: hsla(0, 0%, 100%, 0.8);
        backdrop-filter: blur(30px);
        ">
    <div class="card-body py-5 px-md-5">

      <div class="row d-flex justify-content-center">
        <div class="col-lg-8">
          <h2 class="fw-bold mb-5">Sign up now</h2>
          <form>
            <!-- 2 column grid layout with text inputs for the first and last names -->
            <div class="row">
              <div class="col-md-6 mb-4">
                <div class="form-outline">
                 <%-- <input type="text" id="form3Example1" class="form-control" />
                    
                  <label class="form-label" for="form3Example1">First name</label>--%>

                    <asp:TextBox ID="FirstName" runat="server" CssClass="form-control"></asp:TextBox>
                     <asp:Label runat="server"  CssClass="form-label">First name</asp:Label>

                </div>
              </div>
              <div class="col-md-6 mb-4">
                <div class="form-outline">
                 <%-- <input type="text" id="form3Example2" class="form-control" />

                  <label class="form-label" for="form3Example2">Last name</label>--%>

                    <asp:TextBox ID="LastName" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:Label  runat="server" A CssClass="form-label">Last name</asp:Label>

                </div>
              </div>
            </div>
             

             <%-- Reg no--%>

               <div class="form-outline mb-4">
             <%-- <input type="email" id="form3Example3" class="form-control" />
              <label class="form-label" for="form3Example3">Email address</label>--%>
                   <asp:TextBox ID="Regno" runat="server" AutoCompleteType ="Email" CssClass="form-control"></asp:TextBox >
                   <asp:Label Text="Registraion no" runat="server" CssClass="form-label" for="form3Example" />
            </div>

            <!-- Email input -->
            <div class="form-outline mb-4">
              <%--<input type="email" id="form3Example3" class="form-control" />
              <label class="form-label" for="form3Example3">Email address</label>--%>
                <asp:TextBox ID="Email" runat="server" AutoCompleteType ="Email" CssClass="form-control"></asp:TextBox >
                   <asp:Label Text="Official Email " runat="server" CssClass="form-label" for="form3Example" />
            </div>

            <!-- Password input -->
            <div class="form-outline mb-4">
             <%-- <input type="password" id="form3Example4" class="form-control" />
              <label class="form-label" for="form3Example4">Password</label>--%>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                 <asp:Label ID="lblPassword" runat="server"  CssClass="form-label">Password</asp:Label>



            </div>

            <!-- Checkbox -->
            

          

              <asp:Button ID="btnSignUp" runat="server" Text="Sign up" CssClass="btn btn-primary btn-block mb-4" OnClick="btnSignUp_Click" />


            <!-- Register buttons -->
            
          </form>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Section: Design Block -->
<!-- Section: Design Block -->
</asp:Content>
