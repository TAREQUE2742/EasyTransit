<%@ Page Title="Registration page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="EasyTransit.UserRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="container" style="background-image:url(images/secure.jpg);background-position: center;">
                <div id="signup-box">
              <div class="left">
                <h1 class="sign">Sign up</h1>
                  <asp:TextBox ID="rusername" CssClass="susername" placeholder="Username" runat="server"></asp:TextBox>
                  <asp:TextBox ID="remail" CssClass="semail" placeholder="Your E-mail" Type="email" runat="server"></asp:TextBox>
                  <asp:TextBox ID="rpassword" CssClass="spassword" placeholder="Password" Type="password" runat="server"></asp:TextBox>
                  
                  <asp:DropDownList ID="rgender" CssClass="sgender" runat="server">
                      <asp:ListItem>Male</asp:ListItem>
                      <asp:ListItem>Female</asp:ListItem>
                  </asp:DropDownList>
                  <asp:Button ID="rsubmit" CssClass="ssignup" type="submit" name="signup_submit" runat="server" Text="Sign me up" />

               <%--- <input type="submit" class="ssignup" name="signup_submit" value="Sign me up" />----%> 
              </div>
  
              <div class="right">
                  <asp:TextBox ID="rname" CssClass="sname" placeholder="Your Name" runat="server"></asp:TextBox>
               <textarea id="raddress" class="saddress" placeholder="Your Address" Type="text" runat="server"></textarea>
                  <asp:TextBox ID="rcontact" CssClass="scontact" placeholder="Your Phone no." Type="tel" runat="server"></asp:TextBox>
    
                <asp:TextBox ID="rage" CssClass="sage" placeholder="Your Age" runat="server"></asp:TextBox>
              </div>
              <div class="or">&</div>
            </div>
</div>
</asp:Content>

