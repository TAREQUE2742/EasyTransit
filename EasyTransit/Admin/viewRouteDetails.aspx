<%@ Page Title="Route Details" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="viewRouteDetails.aspx.cs" Inherits="EasyTransit.Admin.viewRouteDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div class="container" style="padding:0px; background-color:#67C8B7;">
                <div style="text-align:center;height:auto;padding:9px;background-color:teal; ">

                        <h2 style="color:white;">Route Details Information</h2>
                    </div>
                    <hr style="height:2px; background-color:#272323;" id="txtsearch"/>
                   <center>

                      

                       <asp:TextBox ID="txtSearch" runat="server" placeholder="Search By Origin or Destination" CssClass="form-control" Width="100%"></asp:TextBox>
                       <br />
                       <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" Text="Search Transporter Routes " Width="100%" />
                       <br />


                      

                   </center>
            </div>
</asp:Content>
