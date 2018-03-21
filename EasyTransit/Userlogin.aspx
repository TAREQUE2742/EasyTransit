<%@ Page Title="Login Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Userlogin.aspx.cs" Inherits="EasyTransit.Userlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container"  style="background-image:url(images/login1.jpg); background-position:center; background-size: contain;">
         <div id="login-box">
                <h1 class="log">Sign In</h1>
                  <asp:TextBox ID="lusername" CssClass="lusername" placeholder="Username" runat="server"></asp:TextBox>
                  <asp:TextBox ID="lpassword" CssClass="lpassword" placeholder="Password" Type="password" runat="server"></asp:TextBox>
               <asp:Button ID="loginbtn" CssClass="lsignin" type="submit" name="signin_submit" runat="server" Text="Login" />
        <asp:Button ID="btnNotReg" runat="server" CssClass="lbutton1" name="signup_submit1" Text="Not Registered?" />
    </div>
        </div>
</asp:Content>
