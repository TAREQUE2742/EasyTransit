<%@ Page Title="Bus Search" Language="C#" MasterPageFile="~/RUser.Master" AutoEventWireup="true" CodeBehind="RUserBusSearch.aspx.cs" Inherits="EasyTransit.RUserBusSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background:#E0DCEB; text-align:center; color:#140028;height:inherit;">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <br />
            <br />
            <br />
         <asp:Label runat="server" ID="td1"></asp:Label>&nbsp;
        <asp:Label runat="server" ID="td2"></asp:Label>
            <br />
            &nbsp;
        <asp:Label runat="server" ID="td3" Width="40%"></asp:Label>&nbsp;
        <asp:Label runat="server" ID="td4" Width="30%"></asp:Label>
           
            <br />
            <br />
            <asp:GridView ID="BusSResult" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table table-responsive table-hover" DataSourceID="SqlDataSource1" Width="100%" BorderStyle="None" CellPadding="5" CellSpacing="25" GridLines="None" ShowHeader="False" Font-Bold="True" Font-Size="Medium">
                <Columns>
                    <asp:BoundField DataField="bcompany_name" HeaderText="bcompany_name" SortExpression="bcompany_name" />
                    <asp:BoundField DataField="bus_type" HeaderText="bus_type" SortExpression="bus_type" />
                    <asp:BoundField DataField="origin" HeaderText="origin" SortExpression="origin" />
                    <asp:BoundField DataField="destination" HeaderText="destination" SortExpression="destination" />
                    <asp:BoundField DataField="weekday" HeaderText="weekday" SortExpression="weekday" />
                    <asp:BoundField DataField="time" HeaderText="time" SortExpression="time" />
                    <asp:BoundField DataField="fare" HeaderText="fare" SortExpression="fare" />
                    <asp:BoundField DataField="Transport_id" HeaderText="Transport_id" SortExpression="Transport_id" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Select" Text="Book"></asp:LinkButton>
                        </ItemTemplate>
                        <ControlStyle CssClass="btn btn-primary" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT Bus_company.bcompany_name, bus_details.bus_type, Bus_routes.origin, Bus_routes.destination, Bus_schedule.weekday, Bus_schedule.time, Bus_schedule.fare, Bus_schedule.Transport_id FROM Bus_company INNER JOIN bus_details ON Bus_company.bcompany_id = bus_details.bcompany_id INNER JOIN Bus_schedule ON bus_details.bus_id = Bus_schedule.Transport_id INNER JOIN Bus_routes ON Bus_schedule.routeid = Bus_routes.routeid WHERE (Bus_schedule.weekday = @weekday) AND (Bus_schedule.routeid = @routeid)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="td2" Name="weekday" PropertyName="Text" />
                    <asp:ControlParameter ControlID="td1" Name="routeid" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            
            </div>
 
    </div>
</asp:Content>
