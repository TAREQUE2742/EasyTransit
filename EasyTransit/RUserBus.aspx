<%@ Page Title="Search Bus" Language="C#" MasterPageFile="~/RUser.Master" AutoEventWireup="true" CodeBehind="RUserBus.aspx.cs" Inherits="EasyTransit.RUserBus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container" style="background:#E0DCEB; text-align:center; color:#140028;height:auto;">
      <h3>Online Booking System for Multiple Transport Services</h3>
      <br />
     
     <div class="row" style="margin-bottom:10px;">
             <div class="col-lg-6" style="float:left;">
                      <div class="form-group">
                          <asp:Label ID="lblRBusStart" runat="server" style="font-size:17px;font-weight:bold;color:#140028;">Starting Place:</asp:Label> 
                          <asp:DropDownList ID="ddlRbusStrat" CssClass="form-control" runat="server" placeholder="Where we can pick-up you?" style="margin-left:155px;" DataSourceID="SqlDataSourceBUsRoute" DataTextField="origin" DataValueField="origin">
                         
                          </asp:DropDownList>
         
                      </div>
                      <div class="form-group">
                          <asp:Label ID="Destination" runat="server"  style="font-size:17px;font-weight:bold; color:#140028;">Destination Place:</asp:Label>
                           <asp:DropDownList ID="BusDestination" CssClass="form-control" runat="server" placeholder="Where do you go?" style="margin-left:155px;" DataSourceID="SqlDataSourceBUsRoute" DataTextField="destination" DataValueField="destination">
                          </asp:DropDownList>
       
                      </div>
                       <div class="form-group">
                           <asp:Label ID="JourneyDate" runat="server" Text="Pick a Journey Date:" style="font-size:17px;font-weight:bold; color:#140028;"></asp:Label>

                           <asp:TextBox ID="BusDate" Type="date" CssClass="form-control" runat="server" style="margin-left:155px;"></asp:TextBox>
        
                      </div>
                      <%--------- <button class="btn btn-primary">Search</button>--------%>
                 <asp:Button ID="btnuserSearch" runat="server" Width="60%" Text="Search" CssClass="btn btn-primary" PostBackUrl="#" />
                      <br />
                      <asp:SqlDataSource ID="SqlDataSourceBUsRoute" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT * FROM [route_details] ORDER BY [fare]"></asp:SqlDataSource>
                 </div>
             <div class="col-lg-6" style="float:right;background-color:mediumorchid;">

                 
             </div>
      </div>
  </div>
</asp:Content>
