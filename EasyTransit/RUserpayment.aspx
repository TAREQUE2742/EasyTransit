<%@ Page Title="Bus Payment" Language="C#" MasterPageFile="~/RUser.Master" AutoEventWireup="true" CodeBehind="RUserpayment.aspx.cs" Inherits="EasyTransit.RUserpayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            font-size: large;
            text-align: right;
        }
        .auto-style3 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container" style="background:#8fcbf2; text-align:center; color:#140028;height:inherit;">
        <div class="col-lg-6 col-md-6 col-sm-6">
            <br />
            <h4>Bus Payment Page</h4>
            <br />
            <br />


            <table class="auto-style1">
                <tr>
                    <td class="auto-style2"><strong>User Name:</strong></td>
                    <td class="auto-style3">
                        <asp:Label ID="lbluserNAME" runat="server" ForeColor="green" Font-Bold="true"></asp:Label>
                    </td>
                </tr>
                &nbsp;
                <tr>
                    <td class="auto-style2"><strong>User Contact :</strong></td>
                    <td class="auto-style3">
                        <asp:Label ID="lbluserCOntact" runat="server" ForeColor="green" Font-Bold="true"></asp:Label>
                    </td>
                </tr>
                &nbsp;
                <tr>
                    <td class="auto-style2"><strong>User email :</strong></td>
                    <td class="auto-style3">
                        <asp:Label ID="lbluseremail" runat="server" ForeColor="green" Font-Bold="true"></asp:Label>
                    </td>
                </tr>
                &nbsp;
                <tr>
                    <td class="auto-style2"><strong>Bus Company Name :</strong></td>
                    <td class="auto-style3">
                        <asp:Label ID="lblbuscom" runat="server" ForeColor="green" Font-Bold="true"></asp:Label>
                    </td>
                </tr>
                &nbsp;
                <tr>
                    <td class="auto-style2"><strong>Bus ID :</strong></td>
                    <td class="auto-style3">
                        <asp:Label ID="lblbusid" Font-Bold="true" ForeColor="green" runat="server" ></asp:Label>
                    </td>
                </tr>
                &nbsp;
                <tr>
                    <td class="auto-style2"><strong>Journey Date :</strong></td>
                    <td class="auto-style3">
                        <asp:Label ID="lbljourdate" Font-Bold="true" ForeColor="green" runat="server"></asp:Label>
                    </td>
                </tr>
                &nbsp;
                <tr>
                    <td class="auto-style2"><strong>Journey Day :</strong></td>
                    <td class="auto-style3">
                        <asp:Label ID="lbljourday" Font-Bold="true" ForeColor="green" runat="server" ></asp:Label>
                    </td>
                </tr>
                &nbsp;
                <tr>
                    <td class="auto-style2"><strong>Origin Place :</strong></td>
                    <td class="auto-style3">
                        <asp:Label ID="lblorigin" Font-Bold="true" ForeColor="green" runat="server" ></asp:Label>
                    </td>
                </tr>
                &nbsp;
                <tr>
                    <td class="auto-style2"><strong>Destination :</strong></td>
                    <td class="auto-style3">
                        <asp:Label ID="lbldestination" Font-Bold="true" ForeColor="green" runat="server" ></asp:Label>
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
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvseatQuantity" ControlToValidate="ddlseatsQuantity" ErrorMessage="Please Select Seats" Font-Bold="true" InitialValue="0" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                &nbsp;
                <tr>
                    <td class="auto-style2"><strong>Fare:</strong></td>
                    <td class="auto-style3">
                        <asp:Label ID="lblBusfare" runat="server" CssClass="form-control" Height="28px" Width="100%"></asp:Label>
                    </td>
                </tr>
                &nbsp;
                <tr>
                    <td class="auto-style2"><strong>Available Seats:</strong></td>
                    <td class="auto-style3">
                        <asp:Label ID="lblavailableS" runat="server" Font-Bold="true" ForeColor="green" Width="100%"></asp:Label>
                    </td>
                </tr> 
                <tr>
                    <td class="auto-style3">
                        <input type="hidden" runat="server" id="key" name="key" value="gtKFFx" />
                        <input type="hidden" runat="server" id="salt" name="salt" value="eCwWELxi" />
                        <input type="hidden" runat="server" id="hash" name="hash" value=""  />
                        <input type="hidden" runat="server" id="txnid" name="txnid" value="" />
                    </td>
                </tr> 
                <tr>
                    <td class="auto-style2"><strong>Available Seats:</strong></td>
                    <td class="auto-style3">
                          <asp:Button ID="btnPay" runat="server" CssClass="btn btn-primary" Text="Pay Now" Width="100%" OnClick="btnPay_Click" />
                    </td>
                </tr>
            </table>
            <br />
          
            <br />


            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">

            </div>
    </div>
    </asp:Content>

