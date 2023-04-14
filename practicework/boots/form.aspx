<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form.aspx.cs" Inherits="practicework.boots.form" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Simple registration form</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



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
      max-width: 500px; 
      min-height: 460px; 
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
      width: calc(100% - 57px);
      height: 36px;
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
      <h1>Registration</h1>
        <hr>       
        <hr>
    
      
        <label id="icon" for="name"><i class="fas fa-user"></i></label>
        <asp:TextBox ID="name" placeholder ="Name" runat ="server"></asp:TextBox>
        <label id="icon" for="name"><i class="fas fa-envelope"></i></label>
       <asp:TextBox ID="emailid" placeholder ="Email-id"  runat ="server"></asp:TextBox>      
        <label id="icon" for="name"><i class="fas fa-unlock-alt"></i></label>
        <asp:TextBox ID="password" placeholder ="Password" runat="server"></asp:TextBox>
        <label id="icon" for="name"><i class="fas fa-user"></i></label>
        <asp:TextBox ID="city" placeholder ="City" runat="server"></asp:TextBox>
        <label id="icon" for="name"><i class="fas fa-user"></i></label>
        <asp:DropDownList ID="gender" runat="server" class="fas fa-user">
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
            <asp:ListItem>Others</asp:ListItem>
        </asp:DropDownList>

        <hr>     
        <hr>
        <div class="btn-block"> 
        <asp:Button ID="register" class="btn btn-dark" runat ="server" Text="Register" OnClick="register_Click"  />
        <asp:Button ID="update" class="button" runat="server" Text="View"  OnClick="update_Click" />
            <asp:Button ID="Delete" class="button" runat="server" Text="Delete" OnClick="Delete_Click" />
        &nbsp;<asp:Button ID="Search" class="button" runat="server" Text="Search" OnClick="Search_Click" />
        </div>          
    </div>       


        
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" DataKeyNames="id" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="785px">
              <Columns>
                  <asp:BoundField DataField="name" HeaderText="Name" />
                  <asp:BoundField DataField="emailid" HeaderText="EmailId" />
                  <asp:BoundField DataField="password" HeaderText="Password" />
                   <asp:BoundField DataField="gender" HeaderText="Gender" />
                  <asp:BoundField DataField="city" HeaderText="City" />
                  <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                  <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" />
              </Columns>
          </asp:GridView>


        
      </form>
  </body>
</html>

