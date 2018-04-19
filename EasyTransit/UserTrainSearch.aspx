<%@ Page Title="Train Search" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserTrainSearch.aspx.cs" Inherits="EasyTransit.UserTrainSearch" %>
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
                    <asp:BoundField DataField="tcompany_name" HeaderText="tcompany_name" SortExpression="tcompany_name" />
                    <asp:BoundField DataField="train_type" HeaderText="train_type" SortExpression="train_type" />
                    <asp:BoundField DataField="origin" HeaderText="origin" SortExpression="origin" />
                    <asp:BoundField DataField="destination" HeaderText="destination" SortExpression="destination" />
                    <asp:BoundField DataField="time" HeaderText="time" SortExpression="time" />
                    <asp:BoundField DataField="weekday" HeaderText="weekday" SortExpression="weekday" />
                    <asp:BoundField DataField="Transport_id" HeaderText="Transport_id" SortExpression="Transport_id" />
                    <asp:BoundField DataField="fare" HeaderText="fare" SortExpression="fare" />
                    <asp:BoundField DataField="capacity" HeaderText="capacity" SortExpression="capacity" />
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
            <asp:SqlDataSource ID="sdsSearchTrain" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT Train_company.tcompany_name, train_details.train_type, Train_routes.origin, Train_routes.destination, Train_schedule.time, Train_schedule.weekday, Train_schedule.Transport_id, Train_schedule.fare, train_details.capacity FROM Train_company INNER JOIN train_details ON Train_company.tcompany_id = train_details.tcompany_id INNER JOIN Train_schedule ON train_details.train_id = Train_schedule.Transport_id INNER JOIN Train_routes ON Train_schedule.routeid = Train_routes.routeid WHERE (Train_schedule.routeid = @routeid) AND (Train_schedule.weekday = @weekday)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="td1" Name="routeid" PropertyName="Text" />
                    <asp:ControlParameter ControlID="td2" Name="weekday" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>

            </div>
        </div>
</asp:Content>
