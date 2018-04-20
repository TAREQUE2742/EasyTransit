<%@ Page Title="Reservation Details" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="viewReservationDetails.aspx.cs" Inherits="EasyTransit.Admin.viewReservationDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div class="container" style="padding:0px;background-color:#67C8B7;">
                <div style="text-align:center;height:auto;padding:9px;background-color:#67C8B7; ">

                        <h2 >Reservation Details Information</h2>
                    <br />
                    <center>
                <asp:TextBox ID="txtSearch" runat="server" style="margin-top:0px;" placeholder="Search Reservation Details by Bus Number" CssClass="form-control" Width="100%"></asp:TextBox>
                <br />



                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" Text="Search Reservation Details" Width="100%" OnClick="btnSearch_Click" />
                        </center>
                <br />
                <br />
                <asp:GridView ID="ReservationView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ticket_id" DataSourceID="sdsreservation" GridLines="Horizontal" Width="100%">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:TemplateField HeaderText="Ticket ID" InsertVisible="False" SortExpression="ticket_id">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ticket_id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ticket_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Passenger ID" SortExpression="passenger_id">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("passenger_id") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("passenger_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Transport ID" SortExpression="Transport_id">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Transport_id") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Transport_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Route ID" SortExpression="routeid">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("routeid") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("routeid") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date" SortExpression="date">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("date") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("date") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="seat" SortExpression="seat">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("seat") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("seat") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField HeaderText="Action" ShowDeleteButton="True">
                        <ControlStyle CssClass="btn btn-primary" />
                        </asp:CommandField>
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
                <asp:SqlDataSource ID="sdsreservation" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" DeleteCommand="DELETE FROM [bus_reservation] WHERE [ticket_id] = @ticket_id" InsertCommand="INSERT INTO [bus_reservation] ([passenger_id], [Transport_id], [routeid], [date], [seat]) VALUES (@passenger_id, @Transport_id, @routeid, @date, @seat)" SelectCommand="SELECT * FROM [bus_reservation] WHERE ([Transport_id] = @Transport_id) ORDER BY [Transport_id]" UpdateCommand="UPDATE [bus_reservation] SET [passenger_id] = @passenger_id, [Transport_id] = @Transport_id, [routeid] = @routeid, [date] = @date, [seat] = @seat WHERE [ticket_id] = @ticket_id">
                    <DeleteParameters>
                        <asp:Parameter Name="ticket_id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="passenger_id" Type="Int32" />
                        <asp:Parameter Name="Transport_id" Type="String" />
                        <asp:Parameter Name="routeid" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="date" />
                        <asp:Parameter Name="seat" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtSearch" Name="Transport_id" PropertyName="Text" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="passenger_id" Type="Int32" />
                        <asp:Parameter Name="Transport_id" Type="String" />
                        <asp:Parameter Name="routeid" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="date" />
                        <asp:Parameter Name="seat" Type="Int32" />
                        <asp:Parameter Name="ticket_id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />

                    <h3 style="text-align:center;">Bus Reservation Details</h3>
                    <br />



                        <asp:GridView ID="ViewBusReserve" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ticket_id" DataSourceID="sdsbusreservation" ForeColor="#333333" GridLines="None" Width="100%">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="ticket_id" HeaderText="Ticket ID" InsertVisible="False" ReadOnly="True" SortExpression="ticket_id" />
                                <asp:BoundField DataField="passenger_id" HeaderText="Passenger ID" SortExpression="passenger_id" />
                                <asp:BoundField DataField="Transport_id" HeaderText="Transport ID" SortExpression="Transport_id" />
                                <asp:BoundField DataField="routeid" HeaderText="Route ID" SortExpression="routeid" />
                                <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                                <asp:BoundField DataField="seat" HeaderText="Seat" SortExpression="seat" />
                                <asp:CommandField HeaderText="Actions" ShowDeleteButton="True">
                                <ControlStyle CssClass="btn btn-primary" />
                                </asp:CommandField>
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                        <br />
                        <asp:SqlDataSource ID="sdsbusreservation" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" DeleteCommand="DELETE FROM [bus_reservation] WHERE [ticket_id] = @ticket_id" InsertCommand="INSERT INTO [bus_reservation] ([passenger_id], [Transport_id], [routeid], [date], [seat]) VALUES (@passenger_id, @Transport_id, @routeid, @date, @seat)" SelectCommand="SELECT * FROM [bus_reservation] ORDER BY [Transport_id]" UpdateCommand="UPDATE [bus_reservation] SET [passenger_id] = @passenger_id, [Transport_id] = @Transport_id, [routeid] = @routeid, [date] = @date, [seat] = @seat WHERE [ticket_id] = @ticket_id">
                            <DeleteParameters>
                                <asp:Parameter Name="ticket_id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="passenger_id" Type="Int32" />
                                <asp:Parameter Name="Transport_id" Type="String" />
                                <asp:Parameter Name="routeid" Type="Int32" />
                                <asp:Parameter DbType="Date" Name="date" />
                                <asp:Parameter Name="seat" Type="Int32" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="passenger_id" Type="Int32" />
                                <asp:Parameter Name="Transport_id" Type="String" />
                                <asp:Parameter Name="routeid" Type="Int32" />
                                <asp:Parameter DbType="Date" Name="date" />
                                <asp:Parameter Name="seat" Type="Int32" />
                                <asp:Parameter Name="ticket_id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>



            </div>
      <div class="col-lg-7 col-md-7 col-sm-7">
          <center>
                <h3>Notification of Bus Availability</h3>

                <br />
                <asp:TextBox ID="txtBusIDSearch" runat="server" placeholder="Search passenger emails by Bus ID" style="margin-top:0px;" CssClass="form-control" Width="100%"></asp:TextBox>
                <br />


                <asp:Button ID="btnPassengerSearch" runat="server" CssClass="btn btn-primary" Text="Search Passengers Email" Width="100%" OnClick="btnPassengerSearch_Click" />
                <br />
              <asp:Label runat="server" ID="lblemailsearchsms" Width="100%" Font-Bold="true"></asp:Label>
              </center>
          </div>
            <div class="col-lg-5 col-md-5 col-sm-5">
                <h4>Passengers Email Addresses:</h4>
                <asp:TextBox ID="txtEmails" runat="server" placeholder="Passengers Email addresses" style="margin-top:0px;" CssClass="form-control" TextMode="MultiLine" Width="100%"></asp:TextBox>
                <br />
                <h4>Write Message for Passengers:</h4>
                <br />
                <asp:TextBox ID="txtMessageBody" style="margin-top:0px;" placeholder="please Write Something." runat="server" CssClass="form-control" TextMode="MultiLine" Width="100%"></asp:TextBox>
                <br />

                <asp:Button ID="btnSendMail" runat="server" CssClass="btn btn-primary" Text="Send Mail" Width="100%" />
                <br />
                <br />

                </div>  
        </div>
</asp:Content>
