<%@ Page Title="Pessenger Details" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="viewPessengerDetails.aspx.cs" Inherits="EasyTransit.Admin.viewPessengerDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container" style="padding:0px;">
            <div style="text-align:center;height:auto;padding:9px;background-color:teal;width:auto; ">

                <h2 style="color:white;">Passenger Details Information</h2>
            </div>
            <hr style="height:2px; background-color:#272323;"/>
            <div>
                <asp:GridView ID="ViewPassenger" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="1"
                    CellPadding="0" ForeColor="#333333" GridLines="None" CssClass="table-condensed" PageSize="6" Width="919px">
                    <AlternatingRowStyle BackColor="Window" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#008080" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
         </div>
    </div>
</asp:Content>
