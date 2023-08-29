<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="Panel.aspx.cs" Inherits="Courseforms.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!DOCTYPE html>
<html lang="en">
<head>
  <title>Left-Sided Panel with Prominent Buttons</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <style>
    body {
     
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
                <a class="nav-link" href="Webform3.aspx" onclick="highlightButton(this)">
                  <i class="fas fa-home" style="color:white"></i>
                  Home
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#" onclick="highlightButton(this)">
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
            </ul>
          </div>
          <div class="panel-footer">
            <a class="btn btn-danger" href="#">
              <i class="fas fa-sign-out-alt"></i>
              Logout
            </a>
          </div>
        </div>
      </div>
      <div class="col-md-9">
         
        <!-- Main content goes here -->
          

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


    </html></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
