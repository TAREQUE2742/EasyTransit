<%@ Page Title="Train Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserTrain.aspx.cs" Inherits="EasyTransit.UserTrain" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container" style="background:#E0DCEB; text-align:center; color:#140028;height:inherit;">
      <h3>Online Booking System for Multiple Transport Services</h3>
      <br />
         <h4>Welcome To Train Ticket Booking System</h4>
       
      <div class="form-group">
          <label for="exampleFormControlInput1" style="font-size:17px; ">Starting Station:</label>
          <input type="search" class="form-control" id="exampleFormControlInput1" placeholder="Where we can pick-up you?" style="margin-left:452px;" />
      </div>
      <div class="form-group">
          <label for="exampleFormControlInput2" style="font-size:17px;">Destination Station:</label>
          <input type="search" class="form-control" id="exampleFormControlInput2" placeholder="Where do you go?" style="margin-left:452px;" />
      </div>
       <div class="form-group">
          <label for="exampleFormControlSelect1" style="font-size:17px; ">Pick a Journey Date:</label>
          <input type="date" class="form-control" id="exampleFormControlSelect1"style="margin-left:452px;" />
      </div>
      <button class="btn btn-primary">Search</button>
  </div>
</asp:Content>
