<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Courseforms.WebForm5" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <!DOCTYPE html>
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

      
        background: linear-gradient(to bottom, #2980b9, #3498db, #85c1e9);
        font-family: Arial, sans-serif;


     
      background-repeat: no-repeat;
      background-attachment: fixed;
      
    }

    .panel {
      background-color:#1e272e;
      border-radius: 5px;
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
      margin-top: 70px;
      
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
    body {
  background: linear-gradient(to bottom, #3498db, #2c3e50);
  font-family: Arial, sans-serif;
}

.welcome-container {
  text-align: center;
  margin-top: 200px;
}

.welcome-heading {
  font-size: 48px;
  color: #fff;
  margin-bottom: 20px;
  animation: fade-in 1s ease-in-out;
}

.welcome-text {
  font-size: 24px;
  color: #eee;
  margin-bottom: 40px;
  animation: slide-up 1s ease-in-out;
}

.welcome-button {
  display: inline-block;
  padding: 12px 24px;
  background-color: #fff;
  color: #333;
  font-size: 18px;
  text-decoration: none;
  border-radius: 4px;
  transition: background-color 0.3s;
  animation: scale-in 1s ease-in-out;
}

.welcome-button:hover {
  background-color: #ddd;
}

@keyframes fade-in {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

@keyframes slide-up {
  from {
    transform: translateY(50px);
  }
  to {
    transform: translateY(0);
  }
}

@keyframes scale-in {
  from {
    transform: scale(0.5);
  }
  to {
    transform: scale(1);
  }
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

       <asp:Button ID="btnLogout" runat="server" CssClass="btn btn-danger" OnClick="btnLogout_Click" Text='Logout'></asp:Button>



          </div>
        </div>
      </div>
      <div class="col-md-9">
         
        <!-- Main content goes here -->



<%--          <iframe width="560" height="315" src="https://www.youtube.com/embed/XWPcThqqZwM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>--%>
           <%-- <h1>Welcome, <%: userName %></h1>--%>
  
 
 

  <div class="welcome-container">
    <h1 class="welcome-heading">Welcome Back <%: userName %></h1>
    <p class="welcome-text"> To the Most Innovative University Ever </p>
     
  </div>




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

