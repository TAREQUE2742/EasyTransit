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
            <asp:GridView ID="BusSResult" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table table-responsive table-hover" DataSourceID="SqlDataSource1" Width="100%" BorderStyle="None" CellPadding="5" CellSpacing="25" GridLines="None" Font-Bold="True" Font-Size="Medium" OnRowCommand="BusSResult_RowCommand" OnSelectedIndexChanged="BusSResult_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField HeaderText="Bus Company Name" SortExpression="bcompany_name">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtBuscom" runat="server" Text='<%# Bind("bcompany_name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBuscomname" runat="server" Text='<%# Bind("bcompany_name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Bus Type" SortExpression="bus_type">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("bus_type") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBustype" runat="server" Text='<%# Bind("bus_type") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Origin Place" SortExpression="origin">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("origin") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBusorigin" runat="server" Text='<%# Bind("origin") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Destination Place" SortExpression="destination">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("destination") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBusdestination" runat="server" Text='<%# Bind("destination") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Journey Day" SortExpression="weekday">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("weekday") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBusweekday" runat="server" Text='<%# Bind("weekday") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Time" SortExpression="time">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("time") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBustime" runat="server" Text='<%# Bind("time") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fare" SortExpression="fare">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("fare") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBusfare" runat="server" Text='<%# Bind("fare") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Coach No." SortExpression="Transport_id">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Transport_id") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBusno" runat="server" Text='<%# Bind("Transport_id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandArgument='<%# Eval("bcompany_name")+","+Eval("Transport_id")+","+Eval("capacity")+","+Eval("fare") %>' CommandName="Select" OnClick="LinkButton1_Click" Text="Book Now"></asp:LinkButton>
                        </ItemTemplate>
                        <ControlStyle CssClass="btn btn-primary" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT Bus_company.bcompany_name, bus_details.bus_type, bus_details.capacity, Bus_routes.origin, Bus_routes.destination, Bus_schedule.weekday, Bus_schedule.time, Bus_schedule.fare, Bus_schedule.Transport_id FROM Bus_company INNER JOIN bus_details ON Bus_company.bcompany_id = bus_details.bcompany_id INNER JOIN Bus_schedule ON bus_details.bus_id = Bus_schedule.Transport_id INNER JOIN Bus_routes ON Bus_schedule.routeid = Bus_routes.routeid WHERE (Bus_schedule.weekday = @weekday) AND (Bus_schedule.routeid = @routeid)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="td2" Name="weekday" PropertyName="Text" />
                    <asp:ControlParameter ControlID="td1" Name="routeid" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            </div>
 
    </div>
</asp:Content>
