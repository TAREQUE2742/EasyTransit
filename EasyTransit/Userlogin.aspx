<%@ Page Title="Login Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Userlogin.aspx.cs" Inherits="EasyTransit.Userlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container"  style="background-image:url(images/login1.jpg); background-position:center; background-size: contain;">
         <div id="login-box">
             <center>
                <h1 class="log">Sign In</h1>
                  <asp:TextBox ID="tusername" CssClass="lusername" placeholder="Username" runat="server" Width="100%"></asp:TextBox>
                 <asp:RegularExpressionValidator runat="server" ID="revusername" ControlToValidate="tusername" ErrorMessage="Invalid Email Address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                  <asp:TextBox ID="tpassword" CssClass="lpassword" placeholder="Password" Type="password" runat="server" Width="100%"></asp:TextBox>
                 <asp:Label runat="server" ID="lblusersms" Width="100%" ForeColor="Red"></asp:Label>
                 </center>
             <center>                   
                 <asp:Button ID="loginbtn" CssClass="lsignin" type="submit" name="signin_submit" runat="server" Text="Login" OnClick="loginbtn_Click" />
                    <asp:Button ID="btnNotReg" runat="server" PostBackUrl="~/UserRegistration.aspx" CssClass="lbutton1" name="signup_submit1" Text="Not Registered?" />
                 </center>

    </div>
        </div>
</asp:Content>
