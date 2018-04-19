<%@ Page Title="Edit Profile" Language="C#" MasterPageFile="~/RUser.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="EasyTransit.EditProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="container" style="background-image:url(images/secure.jpg);background-position: center;">
                <div id="signup-box" style="width:690px;">
              <div class="left">
                <h1 class="sign">Sign up</h1>
                  <asp:TextBox ID="remail" CssClass="semail" placeholder="Your E-mail" Type="email" runat="server"></asp:TextBox>
                  <asp:RegularExpressionValidator runat="server" ID="revemail" ControlToValidate="remail" ErrorMessage="Invalid Email Address" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                  <asp:TextBox ID="rpassword" CssClass="spassword" placeholder="Password" Type="password" runat="server"></asp:TextBox>
                  
                  <asp:DropDownList ID="rgender" CssClass="sgender" runat="server">
                      <asp:ListItem>Male</asp:ListItem>
                      <asp:ListItem>Female</asp:ListItem>
                  </asp:DropDownList>
                  <asp:Button ID="rsubmit" CssClass="ssignup" OnClick="rsubmit_Click" type="submit" name="signup_submit" runat="server" Text="Edit Profile" />

               <%--- <input type="submit" class="ssignup" name="signup_submit" value="Sign me up" />----%> 
              </div>
  
              <div class="right">
                  <asp:TextBox ID="rname" CssClass="sname" placeholder="Your Name" runat="server"></asp:TextBox>
               <textarea id="raddress" class="saddress" placeholder="Your Address" Type="text" runat="server"></textarea>
                  <asp:TextBox ID="rcontact" CssClass="scontact" placeholder="Your Phone no." Type="tel" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revcontact" ControlToValidate="rcontact" runat="server" ErrorMessage="Invalid Mobile Number" ForeColor="Red" ValidationExpression="^(?:\+?88|0088)?01[15-9]\d{8}$"></asp:RegularExpressionValidator>
                <asp:TextBox ID="rage" CssClass="sage" placeholder="Your Age" runat="server"></asp:TextBox>
                  <asp:RangeValidator runat="server" ControlToValidate="rage" ErrorMessage="Age Must be Between 18 to 80" ForeColor="Red" MaximumValue="80" MinimumValue="18" SetFocusOnError="True"></asp:RangeValidator>
                  <asp:Label runat="server" ID="lblRegistrationsms" ForeColor="Red" Width="100%"></asp:Label>
              </div>
              <div class="or">&</div>
            </div>
     <br />
     <br />
</div>
</asp:Content>
