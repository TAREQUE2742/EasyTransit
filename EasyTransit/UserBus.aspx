<%@ Page Title="Bus Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserBus.aspx.cs" Inherits="EasyTransit.UserBus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

  <div class="container" style="background:#E0DCEB; text-align:center; color:#140028;height:inherit;">
      <div class="col-lg-6 col-md-6 col-sm-8">
      <h3>Online Booking System for Multiple Transport Services</h3>
      <br />
     
    <center>
      <div class="form-group">
          <asp:Label ID="lblstartingBUS" runat="server" Width="100%" style="font-size:17px;">Starting Place:</asp:Label>
          <input type="search" class="form-control" id="exampleFormControlInput1"  style="margin-left:452px;" />
          <asp:TextBox ID="txtstartingBUS" placeholder="Where we can pick-up you?" CssClass="form-control" Width="100%" runat="server"></asp:TextBox>
      </div>
      <div class="form-group">
          <asp:Label ID="lbldestinationBUS" runat="server" Width="100%" style="font-size:17px;">Destination Place:</asp:Label>
          <input type="search" class="form-control" id="exampleFormControlInput2" placeholder="Where do you go?" style="margin-left:452px;" />
          <asp:TextBox runat="server" ID="txtdetinationBUS" placeholder="Where do you go?" Width="100%" ></asp:TextBox>
      </div>
       <div class="form-group">
          <label for="exampleFormControlSelect1" style="font-size:17px;">Pick a Journey Date:</label>
          <input type="date" class="form-control" id="exampleFormControlSelect1"style="margin-left:452px;" />
      </div>
      <button class="btn btn-primary">Search</button>
      </div>
      <div class="col-lg-6 col-md-6 col-sm-4">
          </center>
      </div>
  </div>
</asp:Content>
