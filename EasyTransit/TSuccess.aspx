<%@ Page Title="Transaction Successfull" Language="C#" MasterPageFile="~/RUser.Master" AutoEventWireup="true" CodeBehind="TSuccess.aspx.cs" Inherits="EasyTransit.TSuccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background:#E0DCEB">
                <div class="col-lg-5 col-sm-5 col-md-5">
                    <br />
                    <p>Thanks For Purchasing Train Ticket.</p>
                    <br />
                <asp:Label runat="server" ID="lblsuccessmessage" Width="100%" ForeColor="Green" Font-Bold="true"></asp:Label>
                     <br />
            <br />
            <asp:Button runat="server" ID="btnback" Width="100%" CssClass="btn btn-success" Text="Buy More Train Ticket" OnClick="btnback_Click" />
                </div>
                <div class="col-lg-7 col-sm-7 col-md-7">
                    <img src="BUS/Tsuccess.gif" style="height:100%; width:100%;" />
                </div>
    </div>
</asp:Content>
