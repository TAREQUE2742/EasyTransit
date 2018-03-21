<%@ Page Title="Reservation Details" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="viewReservationDetails.aspx.cs" Inherits="EasyTransit.Admin.viewReservationDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div class="container" style="padding:0px;">
                <div style="text-align:center;height:auto;padding:9px;background-color:teal; ">

                        <h2 style="color:white;">Reservation Details Information</h2>
                    </div>
                    <hr style="height:2px; background-color:#272323;"/>
                    <div>
                        <asp:GridView ID="ViewReserve" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table table-responsive table-bordered table-condensed" DataKeyNames="TicketID" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:TemplateField HeaderText="Ticket ID" SortExpression="TicketID">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("TicketID") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("TicketID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Seat" SortExpression="Seat">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Seat") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Seat") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Passenger Name" SortExpression="name">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Transport ID" SortExpression="Transport_ID">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Transport_ID") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Transport_ID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Origin" SortExpression="Origin">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Origin") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Origin") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Destination" SortExpression="Destination">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Destination") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Destination") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Time" SortExpression="Time">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Time") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Time") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date" SortExpression="Date">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Actions" ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ControlStyle CssClass="btn btn-primary" />
                                </asp:TemplateField>
                            </Columns>
                             <EditRowStyle BackColor="#008080" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="Green" />
                            <HeaderStyle BackColor="#008080" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#008080" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:mycon %>" DeleteCommand="DELETE FROM [Reservation] WHERE [TicketID] = @original_TicketID AND [Seat] = @original_Seat AND [name] = @original_name AND [Transport_ID] = @original_Transport_ID AND [Origin] = @original_Origin AND [Destination] = @original_Destination AND [Time] = @original_Time AND [Date] = @original_Date" InsertCommand="INSERT INTO [Reservation] ([TicketID], [Seat], [name], [Transport_ID], [Origin], [Destination], [Time], [Date]) VALUES (@TicketID, @Seat, @name, @Transport_ID, @Origin, @Destination, @Time, @Date)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Reservation]" UpdateCommand="UPDATE [Reservation] SET [Seat] = @Seat, [name] = @name, [Transport_ID] = @Transport_ID, [Origin] = @Origin, [Destination] = @Destination, [Time] = @Time, [Date] = @Date WHERE [TicketID] = @original_TicketID AND [Seat] = @original_Seat AND [name] = @original_name AND [Transport_ID] = @original_Transport_ID AND [Origin] = @original_Origin AND [Destination] = @original_Destination AND [Time] = @original_Time AND [Date] = @original_Date">
                            <DeleteParameters>
                                <asp:Parameter Name="original_TicketID" Type="String" />
                                <asp:Parameter Name="original_Seat" Type="String" />
                                <asp:Parameter Name="original_name" Type="String" />
                                <asp:Parameter Name="original_Transport_ID" Type="String" />
                                <asp:Parameter Name="original_Origin" Type="String" />
                                <asp:Parameter Name="original_Destination" Type="String" />
                                <asp:Parameter DbType="Time" Name="original_Time" />
                                <asp:Parameter Name="original_Date" Type="DateTime" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="TicketID" Type="String" />
                                <asp:Parameter Name="Seat" Type="String" />
                                <asp:Parameter Name="name" Type="String" />
                                <asp:Parameter Name="Transport_ID" Type="String" />
                                <asp:Parameter Name="Origin" Type="String" />
                                <asp:Parameter Name="Destination" Type="String" />
                                <asp:Parameter DbType="Time" Name="Time" />
                                <asp:Parameter Name="Date" Type="DateTime" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Seat" Type="String" />
                                <asp:Parameter Name="name" Type="String" />
                                <asp:Parameter Name="Transport_ID" Type="String" />
                                <asp:Parameter Name="Origin" Type="String" />
                                <asp:Parameter Name="Destination" Type="String" />
                                <asp:Parameter DbType="Time" Name="Time" />
                                <asp:Parameter Name="Date" Type="DateTime" />
                                <asp:Parameter Name="original_TicketID" Type="String" />
                                <asp:Parameter Name="original_Seat" Type="String" />
                                <asp:Parameter Name="original_name" Type="String" />
                                <asp:Parameter Name="original_Transport_ID" Type="String" />
                                <asp:Parameter Name="original_Origin" Type="String" />
                                <asp:Parameter Name="original_Destination" Type="String" />
                                <asp:Parameter DbType="Time" Name="original_Time" />
                                <asp:Parameter Name="original_Date" Type="DateTime" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
        </div>
</asp:Content>
