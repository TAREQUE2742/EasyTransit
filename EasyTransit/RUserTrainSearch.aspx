<%@ Page Title="Train Search" Language="C#" MasterPageFile="~/RUser.Master" AutoEventWireup="true" CodeBehind="RUserTrainSearch.aspx.cs" Inherits="EasyTransit.RUserTrainSearch" %>
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
            <asp:GridView ID="TrainSResult" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table table-responsive table-hover" DataSourceID="SqlDataSource1" Width="100%" BorderStyle="None" CellPadding="5" CellSpacing="25" GridLines="None" Font-Bold="True" Font-Size="Medium" OnRowCommand="TrainSResult_RowCommand" OnSelectedIndexChanged="TrainSResult_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField HeaderText="Train Name" SortExpression="tcompany_name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("tcompany_name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("tcompany_name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Origin Station" SortExpression="origin">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("origin") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("origin") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Destination Station" SortExpression="destination">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("destination") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("destination") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Train Type" SortExpression="train_type">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("train_type") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("train_type") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Weekday" SortExpression="weekday">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("weekday") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("weekday") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Journey Time" SortExpression="time">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("time") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("time") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Train No." SortExpression="Transport_id">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Transport_id") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Transport_id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fare" SortExpression="fare">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("fare") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("fare") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="capacity" SortExpression="capacity" Visible="False">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("capacity") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("capacity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandArgument='<%# Eval("tcompany_name")+","+Eval("Transport_id")+","+Eval("capacity")+","+Eval("fare") %>' CommandName="Select" Text="Book Now"></asp:LinkButton>
                        </ItemTemplate>
                        <ControlStyle CssClass="btn btn-primary" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT Train_company.tcompany_name, Train_routes.origin, Train_routes.destination, train_details.train_type, Train_schedule.weekday, Train_schedule.time, Train_schedule.Transport_id, Train_schedule.fare, train_details.capacity FROM Train_company INNER JOIN train_details ON Train_company.tcompany_id = train_details.tcompany_id INNER JOIN Train_schedule ON train_details.train_id = Train_schedule.Transport_id INNER JOIN Train_routes ON Train_schedule.routeid = Train_routes.routeid WHERE (Train_routes.routeid = @routeid) AND (Train_schedule.weekday = @weekday)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="td1" Name="routeid" PropertyName="Text" />
                    <asp:ControlParameter ControlID="td2" Name="weekday" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            </div>
 
    </div>
</asp:Content>
