<%@ Page Title="Search Bus" Language="C#" MasterPageFile="~/RUser.Master" AutoEventWireup="true" CodeBehind="RUserBus.aspx.cs" Inherits="EasyTransit.RUserBus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container" style="background:#E0DCEB; text-align:center; color:#140028;height:auto;">
      <h3>Bus Ticket Booking System</h3>
      <br />  <center>
             <div class="col-lg-6 col-md-6 col-sm-8" >
                      <div class="form-group">
                          <asp:Label ID="lblRBusStart" runat="server" style="font-size:17px;font-weight:bold;color:#140028;" Width="100%">Starting Place:</asp:Label> 
                          <asp:DropDownList ID="ddlRbusStrat" AppendDataBoundItems="true" CssClass="form-control" runat="server" placeholder="Where we can pick-up you?" DataSourceID="sdsRBusOrigin" DataTextField="origin" DataValueField="origin">
                              <asp:ListItem Value="0">Select Origin Place</asp:ListItem>
                         
                          </asp:DropDownList>
                          <asp:SqlDataSource ID="sdsRBusOrigin" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="select distinct origin from Bus_routes"></asp:SqlDataSource>
         
                      </div>
                      <div class="form-group">
                          <asp:Label ID="Destination" runat="server"  style="font-size:17px;font-weight:bold; color:#140028;" Width="100%">Destination Place:</asp:Label>
                           <asp:DropDownList ID="BusDestination" AppendDataBoundItems="true" CssClass="form-control" runat="server" placeholder="Where do you go?" width="100%" DataSourceID="sdsRbusDetination" DataTextField="destination" DataValueField="destination">
                               <asp:ListItem Value="0">Select Destination Place</asp:ListItem>
                          </asp:DropDownList>
                          <asp:SqlDataSource ID="sdsRbusDetination" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT DISTINCT destination FROM Bus_routes"></asp:SqlDataSource>
       
                      </div>
                       <div class="form-group">
                           <asp:Label ID="JourneyDate" runat="server" Text="Pick a Journey Date:" Width="100%" style="font-size:17px;font-weight:bold; color:#140028;"></asp:Label>

                           <asp:TextBox ID="txtBusDate" Type="date" CssClass="form-control" runat="server" Width="100%"></asp:TextBox>
        
                      </div>
                      <%--------- <button class="btn btn-primary">Search</button>--------%>
                 <asp:Button ID="btnuserSearch" runat="server" Width="100%" Text="Search Bus" CssClass="btn btn-primary" OnClick="btnuserSearch_Click" />
                      <br />
                      <br />
                      <asp:Label ID="lblRBusSms" runat="server" Font-Bold="True"></asp:Label>
                      <br />
                 </div>
          </center>
             <div class="col-lg-6 col-md-6 col-sm-4" >

                 
             </div>
  </div>
</asp:Content>
