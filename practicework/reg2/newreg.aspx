<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newreg.aspx.cs" Inherits="practicework.reg2.newreg" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Simple registration form</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
      <!-- Option 1: Include in HTML -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

      <style>
        html, body {
      display: flex;
      justify-content: center;
      height: 280px;
      }
      body, div, h1, form, input, p { 
      padding: 0;
      margin: 0;
      outline: none;
      font-family: Roboto, Arial, sans-serif;
      font-size: 16px;
      color: #666;
      }
      h1 {
      padding: 10px 0;
      font-size: 32px;
      font-weight: 300;
      text-align: center;
      }
      p {
      font-size: 12px;
      }
      hr {
      color: #a9a9a9;
      opacity: 0.3;
      }
      .main-block {
      max-width: 510px; 
      min-height: 500px; 
      padding: 10px 0;
      margin: auto;
      border-radius: 5px; 
      border: solid 1px #ccc;
      box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
      background: #ebebeb; 
      }
      form {
      margin: 0 10px;
      }
      .account-type, .gender {
      margin: 15px 0;
      }
      input[type=radio] {
      display: none;
      }
      label#icon {
      margin: 0;
      border-radius: 5px 0 0 5px;
      }
     
     
      input[type=radio]:checked + label:after {
      opacity: 1;
      }
      input[type=text], input[type=password] {
      margin: 13px 0 0 -5px;
      padding-left: 10px; 
      border-radius: 0 5px 5px 0;
      border: solid 1px #cbc9c9; 
      box-shadow: 1px 2px 5px rgba(0,0,0,.09); 
      background: #fff; 
      }
      input[type=password] {
      margin-bottom: 15px;
      }
      #icon {
      display: inline-block;
      padding: 9.3px 15px;
      box-shadow: 1px 2px 5px rgba(0,0,0,.09); 
      background: #1c87c9;
      color: #fff;
      text-align: center;
      }
      .btn-block {
      margin-top: 10px;
      text-align: center;
            font-weight: 700;
        }
     .button {
        border-style: none;
            border-color: inherit;
            border-width: medium;
            padding: 4px 0;
            margin: 10px auto;
            border-radius: 5px; 
            background: #1c87c9; 
            font-size: 14px;
            font-weight: 600;
            color: #fff;
      }
      .button:hover {
      background: #26a9e0;
      }
    </style>
  </head>
  <body>
      <form id="form1" runat="server">
    <div class="main-block">
      <h1>Registration Form</h1>
        <hr>       
        <hr>
    
      <label id="icon" for="name"><i class="bi-person-circle"></i></label>
        <asp:TextBox ID="id" placeholder ="ID" runat ="server" autocomplete="off" Height="30px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="idval" runat="server" ControlToValidate="id" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        <label id="icon" for="name"><i class="fas fa-user"></i></label>
        <asp:TextBox ID="name" placeholder ="Name" runat ="server" autocomplete="off" Height="30px" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="nameval" runat="server" ControlToValidate="name" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        <label id="icon" for="name"><i class="fas fa-unlock-alt"></i></label>
        <asp:TextBox ID="password" placeholder ="Password" runat="server" autocomplete="off" Height="30px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="passwordval" runat="server" ControlToValidate="password" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        <label id="icon" for="name"> <i class="bi-geo-alt"></i></label>
        <asp:TextBox ID="city" placeholder ="City" runat="server" autocomplete="off" Height="30px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="cityval" runat="server" ControlToValidate="city" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
         <label id="icon" for="name"><i class="fas fa-envelope"></i></label>
       <asp:TextBox ID="emailid" placeholder ="Email-id"  runat ="server" autocomplete="off" Height="30px"></asp:TextBox>
         <asp:RequiredFieldValidator ID="emailval" runat="server" ControlToValidate="emailid" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="emailval2" runat="server" ControlToValidate="emailid" ErrorMessage="Invalid" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <label id="icon" for="name"><i class="fas fa-envelope"></i></label>
        <asp:DropDownList ID="gender" runat="server" Height="30px" Width="111px">
                <asp:ListItem>Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
                <asp:ListItem>Others</asp:ListItem>
            </asp:DropDownList>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="gender" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        <hr>     
        <hr>
        <div class="btn-block"> 
        <asp:Button ID="register" class="button" runat ="server" Text="Insert" OnClick="register_Click"  Height="35px" Width="90px" />
        <asp:Button ID="update" class="button" runat="server" Text="Update" OnClick="update_Click"  Height="35px" Width="90px" CausesValidation="False" />
            <asp:Button ID="delete" class="button" runat="server" Text="Delete" OnClick="delete_Click" Height="35px" Width="90px" CausesValidation="False" />
        &nbsp;<asp:Button ID="view" class="button" runat="server" Text="View" OnClick="view_Click"  Height="35px" Width="90px" CausesValidation="False"/>
            &nbsp;<asp:Button ID="reset" class="button" runat="server" Text="Reset" OnClick="reset_Click" Height="35px" Width="90px" CausesValidation="False" />
            <br />
            
            <br />
            <br />
                <asp:TextBox ID="search2" placeholder ="Enter Name.." runat ="server" Height="42px" Width="243px" autocomplete="off" ></asp:TextBox>        
    &nbsp;&nbsp;  
        <asp:Button ID="search" class="button" runat="server" Text="Search" Height="34px" Width="107px" OnClick="search_Click" CausesValidation="False" />   
  &nbsp;&nbsp;  
              &nbsp;&nbsp;  <asp:GridView ID="GridView1" runat="server" Width="498px"  Height="135px">              
            </asp:GridView>
           
           
        </div>  
        &nbsp;
        
      
    </div>       


        
         

        
      </form>
  </body>
</html>
