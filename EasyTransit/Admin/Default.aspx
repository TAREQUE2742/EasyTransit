<%@ Page Title="Admin Panel" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EasyTransit.Admin.Default" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
     <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%: Page.Title %> - Online Booking System for Multiple Transport Services</title>
     <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel="stylesheet" href="Contents/bootstrap.min.css" />
    <link rel="stylesheet" href="Contents/admin.css" />
</head>
<body>
        <div class="container-fluid" style="background-color:#52B7A5;height:1140px; width:100%; position:fixed;">
            <div class="ad-login">
               <div class="card-header">Admin Login</div>
                <div class="card-body">
                    <form id="form2" runat="server">
                        <div class="form-group">
                            <asp:Label runat="server" Style="padding-left:5px;padding-top:5px;font-size:16px;">Email Address</asp:Label>
                            <asp:TextBox runat="server" ID="ademail" placeholder="Please enter your email" CssClass="email" Type="email"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" Style="padding-left:5px;padding-top:5px;font-size:16px;">Password</asp:Label>
                            <asp:TextBox runat="server" ID="adpass" placeholder="Please enter your password" CssClass="form-control" Type="password"></asp:TextBox>
                        </div>
                        <asp:Button runat="server" Text="Login" CssClass="btn btn-primary btn-block" style="font-size:16px;margin-top:30px;" OnClick="Unnamed3_Click" />
                        <asp:HyperLink runat="server" href="#" Style="display:block;margin-top:5px; color:#000000;" >Forgot Password?</asp:HyperLink>
                    </form>
                </div>
            </div>
        </div>
</body>
</html>
