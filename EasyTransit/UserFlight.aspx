<%@ Page Title="Flight Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserFlight.aspx.cs" Inherits="EasyTransit.UserFlight" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container" style="background:#E0DCEB; text-align:center; color:#140028;height:inherit;">
      <div class="col-lg-6 col-md-6 col-sm-8">
      <h3>Online Booking System for Multiple Transport Services</h3>
      <br />
     
    <center>
      <div class="form-group">
          <asp:Label ID="lblstartingFlight" runat="server" Width="100%" style="font-size:17px;">Starting Airport:</asp:Label>  

          <asp:DropDownList ID="ddlOriginAirport" runat="server" AppendDataBoundItems="True" CssClass="form-control" Width="100%" DataSourceID="SqlDataSource3" DataTextField="origin" DataValueField="origin">
              <asp:ListItem Value="0">Select Origin Airport</asp:ListItem>
          </asp:DropDownList>
          <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT DISTINCT origin FROM Flight_routes"></asp:SqlDataSource>
         <br />
          <br />
      </div>
      <div class="form-group">
          <asp:Label ID="lbldestinationFlight" runat="server" Width="100%" style="font-size:17px;">Destination Airport:</asp:Label>
           <asp:DropDownList ID="ddlDestinationAirport" runat="server" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="SqlDataSource4" DataTextField="destination" DataValueField="destination" Width="100%">
              <asp:ListItem Value="0">Select Destination Airport</asp:ListItem>
          </asp:DropDownList>
          <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT DISTINCT destination FROM Flight_routes"></asp:SqlDataSource>
<br />

         
      </div>
       <div class="form-group">
          <asp:Label ID="lbljurDate" runat="server" style="font-size:17px;">Pick a Journey Date:</asp:Label>
           <asp:TextBox runat="server" ID="txtjourneyDate" CssClass="form-control" Width="100%" TextMode="date"></asp:TextBox>
      </div>
        <br />
      <asp:Button runat="server" ID="btnFLIGHTsearch" CssClass="btn btn-primary" Width="100%" Text="Search Flight" OnClick="btnFLIGHTsearch_Click"/>
        </center>
          <br />
          <asp:Label ID="lblflightSearchsms" runat="server" Width="100%" Font-Bold="true"></asp:Label>
          <br />
      </div>
       
      <div class="col-lg-6 col-md-6 col-sm-4">

          <script type="text/javascript" src="Scripts/jquery-1.10.2.min.js"></script>
          <script type="text/javascript">
              

                    $("#slideshow > div:gt(0)").hide();

                    setInterval(function() {
                      $('#slideshow > div:first')
                        .fadeOut(1000)
                        .next()
                        .fadeIn(1000)
                        .end()
                        .appendTo('#slideshow');
                    }, 3000);


          </script>
          <br />
               <div id="slideshow" style="width:557px; height:340px;">
                   <div>
                       <img src="BUS/nabil.jpg" style="width:537px; height:320px;"  />
                   </div>
                   <div>
                       <img src="BUS/green.jpg" style="width:537px; height:320px;" />
                   </div>
                   <div>
                       <img src="BUS/ena.jpg" style="width:537px; height:320px;" />
                   </div>
                   <div>
                       <img src="BUS/sarker.jpg" style="width:537px; height:320px;" /> 
                   </div>
                   <div>
                       <img src="BUS/shah.jpg" style="width:537px; height:320px;" />
                   </div>
                   <div>
                       <img src="BUS/shyamoli.jpg" style="width:537px; height:320px;" />
                   </div>
                   <div>
                       <img src="BUS/sohag.jpg" style="width:537px; height:320px;" /> 
                   </div>
                   <div>
                       <img src="BUS/star.jpg" style="width:537px; height:320px;" />
                   </div>
                  
                </div>

          </div>
  </div>
</asp:Content>
