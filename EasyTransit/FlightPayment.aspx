<%@ Page Title="Flight Payment" Language="C#" MasterPageFile="~/RUser.Master" AutoEventWireup="true" CodeBehind="FlightPayment.aspx.cs" Inherits="EasyTransit.FlightPayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
           <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
               font-size: large;
               text-align: right;
               width: 419px;
           }
        .auto-style3 {
            text-align: center;
        }
           .auto-style4 {
               text-align: center;
               width: 419px;
               height: 38px;
           }
           .auto-style5 {
               font-size: large;
               text-align: right;
               width: 419px;
               height: 49px;
           }
           .auto-style6 {
               text-align: center;
               height: 49px;
           }
           .auto-style7 {
               font-size: large;
               text-align: right;
               width: 419px;
               height: 39px;
           }
           .auto-style8 {
               text-align: center;
               height: 39px;
           }
           .auto-style9 {
               font-size: large;
               text-align: right;
               width: 419px;
               height: 44px;
           }
           .auto-style10 {
               text-align: center;
               height: 44px;
           }
           .auto-style11 {
               font-size: large;
               text-align: right;
               width: 419px;
               height: 46px;
           }
           .auto-style12 {
               text-align: center;
               height: 46px;
           }
           .auto-style13 {
               font-size: large;
               text-align: right;
               width: 419px;
               height: 41px;
           }
           .auto-style14 {
               text-align: center;
               height: 41px;
           }
           .auto-style15 {
               font-size: large;
               text-align: right;
               width: 419px;
               height: 43px;
           }
           .auto-style16 {
               text-align: center;
               height: 43px;
           }
           .auto-style17 {
               font-size: large;
               text-align: right;
               width: 419px;
               height: 42px;
           }
           .auto-style18 {
               text-align: center;
               height: 42px;
           }
           .auto-style19 {
               font-size: large;
               text-align: right;
               width: 419px;
               height: 48px;
           }
           .auto-style20 {
               text-align: center;
               height: 48px;
           }
           .auto-style21 {
               font-size: large;
               text-align: right;
               width: 419px;
               height: 56px;
           }
           .auto-style22 {
               text-align: center;
               height: 56px;
           }
           .auto-style23 {
               font-size: large;
               text-align: right;
               width: 419px;
               height: 50px;
           }
           .auto-style24 {
               text-align: center;
               height: 50px;
           }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                <div class="container" style="background:#8fcbf2; text-align:center; color:#140028;height:inherit;">
        <div class="col-lg-6 col-md-6 col-sm-6">
            <br />
            <h4>Flight Payment Page</h4>
            <br />
            <br />


            <table class="auto-style1">
                <tr>
                    <td class="auto-style17"><strong>User Name:</strong></td>
                    <td class="auto-style18">
                        <asp:Label ID="lbluserNAME" runat="server" ForeColor="green" Font-Bold="true"></asp:Label>
                    </td>
                </tr>
                &nbsp;
                <tr>
                    <td class="auto-style19"><strong>User Contact :</strong></td>
                    <td class="auto-style20">
                        <asp:Label ID="lbluserCOntact" runat="server" ForeColor="green" Font-Bold="true"></asp:Label>
                    </td>
                </tr>
                &nbsp;
                <tr>
                    <td class="auto-style17"><strong>User email :</strong></td>
                    <td class="auto-style18">
                        <asp:Label ID="lbluseremail" runat="server" ForeColor="green" Font-Bold="true"></asp:Label>
                    </td>
                </tr>
                &nbsp;
                <tr>
                    <td class="auto-style15"><strong>Flight Company Name :</strong></td>
                    <td class="auto-style16">
                        <asp:Label ID="lbltraincom" runat="server" ForeColor="green" Font-Bold="true"></asp:Label>
                    </td>
                </tr>
                &nbsp;
                <tr>
                    <td class="auto-style13"><strong>flight No :</strong></td>
                    <td class="auto-style14">
                        <asp:Label ID="lbltrainid" Font-Bold="true" ForeColor="green" runat="server" ></asp:Label>
                    </td>
                </tr>
                &nbsp;
                <tr>
                    <td class="auto-style11"><strong>Journey Date :</strong></td>
                    <td class="auto-style12">
                        <asp:Label ID="lbljourdate" Font-Bold="true" ForeColor="green" runat="server"></asp:Label>
                    </td>
                </tr>
                &nbsp;
                <tr>
                    <td class="auto-style9"><strong>Journey Day :</strong></td>
                    <td class="auto-style10">
                        <asp:Label ID="lbljourday" Font-Bold="true" ForeColor="green" runat="server" ></asp:Label>
                    </td>
                </tr>
                &nbsp;
                <tr>
                    <td class="auto-style7"><strong>Origin Airport :</strong></td>
                    <td class="auto-style8">
                        <asp:Label ID="lbloriginairport" Font-Bold="true" ForeColor="green" runat="server" ></asp:Label>
                    </td>
                </tr>
                &nbsp;
                <tr>
                    <td class="auto-style5"><strong>Destination Airport:</strong></td>
                    <td class="auto-style6">
                        <asp:Label ID="lbldestinationairport" Font-Bold="true" ForeColor="green" runat="server" ></asp:Label>
                    </td>
                </tr>
                &nbsp;
                <tr>
                    <td class="auto-style2"><strong>Select Seats :</strong></td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="ddlseatsQuantity" runat="server" AppendDataBoundItems="True" CssClass="form-control" Width="100%" style="margin-left:0px;" AutoPostBack="True" OnSelectedIndexChanged="ddlseatsQuantity_SelectedIndexChanged">
                            <asp:ListItem Value="0">Select Quantity</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvseatQuantity" ControlToValidate="ddlseatsQuantity" ErrorMessage="Please Select Seats" Font-Bold="true" InitialValue="0" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                &nbsp;
                <tr>
                    <td class="auto-style21"><strong>Fare:</strong></td>
                    <td class="auto-style22">
                        <asp:Label ID="lblFlightfare" runat="server" CssClass="form-control" Height="28px" Width="100%"></asp:Label>
                    </td>
                </tr>
                &nbsp;
                <tr>
                    <td class="auto-style23"><strong>Available Seats:</strong></td>
                    <td class="auto-style24">
                        <asp:Label ID="lblavailableS" runat="server" Font-Bold="true" ForeColor="green" Width="100%"></asp:Label>
                    </td>
                </tr> 
                <tr>
                    <td class="auto-style4">
                        <input type="hidden" runat="server" id="key" name="key" value="gtKFFx" />
                        <input type="hidden" runat="server" id="salt" name="salt" value="eCwWELxi" />
                        <input type="hidden" runat="server" id="hash" name="hash" value=""  />
                        <input type="hidden" runat="server" id="txnid" name="txnid" value="" />
                    </td>
                </tr> 
                <tr>
                    <td class="auto-style2"><strong>Available Payment Method:</strong></td>
                    <td class="auto-style3">
                          <asp:Button ID="btnPay" runat="server" CssClass="btn btn-primary" Text="Pay With PayUBiz" Width="100%" OnClick="btnPay_Click" />
                    </td>
                </tr>
            </table>
            <br />
          
            <br />
            <asp:Label ID="lblsms" runat="server" Font-Bold="True" ></asp:Label>
          
            <br />


            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">

            </div>
    </div>
</asp:Content>
