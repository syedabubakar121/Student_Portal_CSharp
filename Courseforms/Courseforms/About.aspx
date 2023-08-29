<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Courseforms.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <html>
<head>
  <title>Left-Sided Panel with Prominent Buttons</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

	<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

  <style>
    body {
     
      background-repeat: no-repeat;
      background-attachment: fixed;
      
    }

    .panel {
      background-color:#1e272e;
      border-radius: 2px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
      padding: 5px;
      color:white;
      height:85vh;
      
    }

  

    .nav-sidebar {
      padding-left: 0;
      margin-bottom: 0;
      list-style: none;
      margin-top:8vh;
    }

    .nav-sidebar li {
      margin-bottom: 10px;
      font-size:20px;
    }

    .nav-sidebar .nav-link {
      color: white;
      border-radius: 4px;
      padding: 20px;
      display: flex;
      align-items: center;
    }

    .nav-sidebar .nav-link i {
      margin-right: 10px;
    }

    .nav-sidebar .nav-link:hover {
      background-color: #d6d6d6;
    }

    .panel-footer {
      text-align: center;
      margin-top: 50px;
      
    }

    .nav-link {
    font-size: 20px; /* Adjust the font size to increase the button size */
    line-height: 2; /* Adjust the line height to increase the vertical spacing */
  }

  .nav-item.active {
    background-color:black; /* Set the background color of the active button */
    font-weight: bold; /* Apply a different style to the active button */
  }
    .col-md-3{
        padding-left:0px;
        padding-right:0px;
    }

    .col-md-9{

        
        background-image:url('images/cloud.jpg');
        background-size:cover;
        background-repeat:no-repeat;
        justify-content:center;
        
    }
    .col-lg-5{
        justify-content:center;
        justify-self:center;
        color:black;
        font-style:

    }
  </style>
</head>
<body>
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-3">
        <div class="panel" >
        
          <div class="panel-body">
            <ul class="nav-sidebar">
              <li class="nav-item">
                <a class="nav-link" href="home.aspx" onclick="highlightButton(this)">
                  <i class="fas fa-home" style="color:white" ></i>
                  Home
                </a>


                 <%-- <asp:Button ID="btnHome" runat="server" CssClass="nav-link" Text="Home"  OnClick="btnHome_Click"  >
                   
                      </asp:Button>--%>

              </li>
              <li class="nav-item">
                <a class="nav-link" href="Courses.aspx" onclick="highlightButton(this)">
                  <i class="fas fa-book"></i>
                  Courses
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#" onclick="highlightButton(this)">
                  <i class="fas fa-poll"></i>
                  Results
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#" onclick="highlightButton(this)">
                  <i class="fas fa-cog"></i>
                  Settings
                </a>
              </li>
                <li>
                    <a class="nav-link" href="About.aspx" onclick="highlightButton(this)">
                   <i class="fas fa-info-circle"></i>
                   About
                </a>

                </li>


            </ul>
          </div>
          <div class="panel-footer">
            <%--<a class="btn btn-danger" href="login.aspx">
              <i class="fas fa-sign-out-alt"></i>
              Logout
            </a>--%>

       <asp:Button ID="btnLogout" runat="server" CssClass="btn btn-danger" OnClick="btnLogout_Click"     Text='Logout'></asp:Button>



          </div>
        </div>


      </div>
      
         
        <!-- Main content goes here -->
      








        <div class="col-md-9">
    <div class="container py-5">
        <div class="row mb-4 justify-content-center"> <!-- Add 'justify-content-center' class to center align the content -->
            <div class="col-lg-5 text-center">
                <h2 class="display-4 font-weight-light">Our team</h2>
                <p class="font-italic text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
            </div>
        </div>

        <div class="row text-center justify-content-center"> <!-- Add 'justify-content-center' class to center align the content -->
            <!-- Team item -->
            <div class="col-xl-3 col-sm-6 mb-5">
                <div class="bg-white rounded shadow-sm py-5 px-4">
                    <img src="images/bakar.jpeg" alt="" width="200" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
                    <h5 class="mb-0">Syed Abu Bakar</h5>
                    <span class="small text-uppercase text-muted">CEO - Founder</span>
                </div>
            </div>
            <!-- End -->

            <!-- Team item -->
            <div class="col-xl-3 col-sm-6 mb-5">
                <div class="bg-white rounded shadow-sm py-5 px-4">
                    <img src="images/abda.png" alt="" width="200" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
                    <h5 class="mb-0">Abdullah Sajid</h5>
                    <span class="small text-uppercase text-muted">CEO - Founder</span>
                </div>
            </div>
            <!-- End -->
        </div>
    </div>
</div>









  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>




 <script>
     document.addEventListener("DOMContentLoaded", function () {
         // Get the current URL
         const currentURL = window.location.href;

         // Get all nav links
         const navLinks = document.getElementsByClassName("nav-link");

         // Find the matching link and add the active class
         for (let i = 0; i < navLinks.length; i++) {
             if (navLinks[i].href === currentURL) {
                 navLinks[i].parentNode.classList.add("active");
                 break;
             }
         }
     });

     function highlightButton(link) {
         // Remove the active class from all nav-items
         const navItems = document.getElementsByClassName("nav-item");
         for (let i = 0; i < navItems.length; i++) {
             navItems[i].classList.remove("active");
         }

         // Add the active class to the clicked nav-item
         link.parentNode.classList.add("active");
        
     }
 </script>
</body>


 </html>





























    

</asp:Content>
