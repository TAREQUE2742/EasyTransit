<%@ Page Title="Search Flight" Language="C#" MasterPageFile="~/RUser.Master" AutoEventWireup="true" CodeBehind="RUserFlight.aspx.cs" Inherits="EasyTransit.RUserFlight" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background:#E0DCEB; text-align:center; color:#140028;height:auto;">
      <h3>Online Booking System for Multiple Transport Services</h3>
      <br />
         <h4>Welcome To Flight Ticket Booking System</h4>
         <div class="row">
             <div class="col-lg-6" style="float:left;">
                      <div class="form-group">
                          <asp:Label ID="Sta" runat="server" Text="Label" style="font-size:17px;font-weight:bold;color:#140028;">Starting Airport:</asp:Label>
    
                          <%-------------- <asp:TextBox ID="flightsStarting" CssClass="form-control" runat="server" placeholder="Where we can pick-up you?" style="margin-left:155px;"></asp:TextBox>--------%>
                          <asp:DropDownList ID="flightStarting" CssClass="form-control" runat="server" placeholder="Where we can pick-up you?" style="margin-left:155px;">
                              <asp:ListItem>Abdullahpur</asp:ListItem>
                              <asp:ListItem>Gabtoli</asp:ListItem>
                              <asp:ListItem>Shyamoli</asp:ListItem>
                          </asp:DropDownList>
         
                      </div>
                      <div class="form-group">
                          <asp:Label ID="Label1" runat="server" Text="Label" style="font-size:17px;font-weight:bold; color:#140028;">Destination Airport:</asp:Label>
        
                          <%-------  <asp:TextBox ID="flightdestination" CssClass="form-control" runat="server" placeholder="Where do you go?" style="margin-left:155px;"></asp:TextBox>------%>
                           <asp:DropDownList ID="flightdestination" CssClass="form-control" runat="server" placeholder="Where do you go?" style="margin-left:155px;">
                              <asp:ListItem>Abdullahpur</asp:ListItem>
                              <asp:ListItem>Gabtoli</asp:ListItem>
                              <asp:ListItem>Shyamoli</asp:ListItem>
                          </asp:DropDownList>
       
                      </div>
                       <div class="form-group">
                           <asp:Label ID="Label2" runat="server" Text="Label" style="font-size:17px;font-weight:bold; color:#140028;">Pick a Journey Date:</asp:Label>

                           <asp:TextBox ID="flightdate" Type="date" CssClass="form-control" runat="server" style="margin-left:155px;"></asp:TextBox>
        
                      </div>
                      <%--------- <button class="btn btn-primary">Search</button>--------%>
                 <asp:Button ID="btnuserSearch" runat="server" Text="Search" CssClass="btn btn-primary" PostBackUrl="~/UserSearch.aspx" />
                 </div>
             <div class="col-lg-6" style="float:right;background-color:mediumorchid;">

                 
             </div>
      </div>
  </div>
</asp:Content>
