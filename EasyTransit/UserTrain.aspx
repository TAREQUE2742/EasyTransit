<%@ Page Title="Train Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserTrain.aspx.cs" Inherits="EasyTransit.UserTrain" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
  <div class="container" style="background:#E0DCEB; text-align:center; color:#140028;height:inherit;">
      <div class="col-lg-6 col-md-6 col-sm-8">
      <h3>Online Booking System for Multiple Transport Services</h3>
      <br />
     
    <center>
      <div class="form-group">
          <asp:Label ID="lblstartingBUS" runat="server" Width="100%" style="font-size:17px;">Starting Place:</asp:Label>  

          <asp:DropDownList ID="ddlOriginTrain" runat="server" AppendDataBoundItems="True" CssClass="form-control" Width="100%" DataSourceID="sdsOrigin" DataTextField="origin" DataValueField="origin">
              <asp:ListItem Value="0">Select Origin Station</asp:ListItem>
          </asp:DropDownList>
          <asp:SqlDataSource ID="sdsOrigin" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT DISTINCT origin FROM Train_routes"></asp:SqlDataSource>
          <br />
         
          <br />
      </div>
      <div class="form-group">
          <asp:Label ID="lbldestinationTrain" runat="server" Width="100%" style="font-size:17px;">Destination Place:</asp:Label>
           <asp:DropDownList ID="ddlDestination" runat="server" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="sdsDestination" DataTextField="destination" DataValueField="destination" Width="100%">
              <asp:ListItem Value="0">Select Destination Station</asp:ListItem>
          </asp:DropDownList>
          <asp:SqlDataSource ID="sdsDestination" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT DISTINCT destination FROM Train_routes ORDER BY destination"></asp:SqlDataSource>
          <br />
         
      </div>
       <div class="form-group">
          <asp:Label ID="lbljurDateTrain" runat="server" style="font-size:17px;">Pick a Journey Date:</asp:Label>
           <asp:TextBox runat="server" ID="txtTjourneyDate" CssClass="form-control" Width="100%" TextMode="date" ></asp:TextBox>
      </div>
        <br />
      <asp:Button runat="server" ID="btnTrainSearch" CssClass="btn btn-primary" Width="100%" Text="Search Train" OnClick="btnTrainSearch_Click" />
        </center>
          <br />
          <asp:Label ID="lbltrainSearchsms" runat="server" Width="100%"></asp:Label>
          <br />
      </div>
       
      <div class="col-lg-6 col-md-6 col-sm-4">
         
          <br />
          d</div>
  </div>
</asp:Content>
