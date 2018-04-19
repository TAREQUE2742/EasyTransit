<%@ Page Title="Payment Falied" Language="C#" MasterPageFile="~/RUser.Master" AutoEventWireup="true" CodeBehind="FailurePayment.aspx.cs" Inherits="EasyTransit.FailurePayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background-color:#E0DCEB;">
        <div class="col-lg-5 col-md-5 col-sm-5">
            <br />
            <p>Thanks For Visiting EasyTransit.</p>
        <br />
        <asp:Label runat="server" ID="lblfailuremessage" Width="100%" ForeColor="Red" Font-Bold="true"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Button runat="server" ID="btnback" Text="Go Back to Bus Search" CssClass="btn btn-danger" Width="100%" OnClick="btnback_Click"  />
        </div>
        <div class="col-lg-7 col-md-7 col-sm-7">
            <img src="BUS/tfailed.jpg" style="height:100%; width:100%;" />
        </div>
        

    </div>
</asp:Content>
