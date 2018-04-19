<%@ Page Title="Flight Search" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserFlightSearch.aspx.cs" Inherits="EasyTransit.UserFlightSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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

            <asp:GridView ID="TrainSearchView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" CellSpacing="25" CssClass="table table-responsive table-hover" DataSourceID="sdsSearchTrain" Font-Bold="True" Font-Size="Medium" GridLines="None" Width="100%">
                <Columns>
                    <asp:BoundField DataField="fcompany_name" HeaderText="fcompany_name" SortExpression="fcompany_name" />
                    <asp:BoundField DataField="weekday" HeaderText="weekday" SortExpression="weekday" />
                    <asp:BoundField DataField="time" HeaderText="time" SortExpression="time" />
                    <asp:BoundField DataField="fare" HeaderText="fare" SortExpression="fare" />
                    <asp:BoundField DataField="Transport_id" HeaderText="Transport_id" SortExpression="Transport_id" />
                    <asp:BoundField DataField="flight_type" HeaderText="flight_type" SortExpression="flight_type" />
                    <asp:BoundField DataField="origin" HeaderText="origin" SortExpression="origin" />
                    <asp:BoundField DataField="destination" HeaderText="destination" SortExpression="destination" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" href="UserRegistration.aspx" CommandName="Select" Text="Book Now"></asp:LinkButton>
                        </ItemTemplate>
                        <ControlStyle CssClass="btn btn-primary" />
                    </asp:TemplateField>
                </Columns>
                <RowStyle BorderStyle="None" />
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="sdsSearchTrain" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT Flight_company.fcompany_name, Flight_schedule.weekday, Flight_schedule.time, Flight_schedule.fare, Flight_schedule.Transport_id, flight_details.flight_type, Flight_routes.origin, Flight_routes.destination FROM Flight_company INNER JOIN flight_details ON Flight_company.fcompany_id = flight_details.fcompany_id INNER JOIN Flight_schedule ON flight_details.flight_id = Flight_schedule.Transport_id INNER JOIN Flight_routes ON Flight_schedule.routeid = Flight_routes.routeid WHERE (Flight_routes.routeid=@routeid AND Flight_schedule.weekday=@weekday)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="td1" Name="routeid" PropertyName="Text" />
                    <asp:ControlParameter ControlID="td2" Name="weekday" PropertyName="Text" />
                </SelectParameters>

            </asp:SqlDataSource>

            </div>
        </div>
</asp:Content>
