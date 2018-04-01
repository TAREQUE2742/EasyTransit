<%@ Page Title="Add Flight Schedule" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="AddFlightSchedule.aspx.cs" Inherits="EasyTransit.Admin.AddFlightSchedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        

         function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }
        function MinLength(sender, args) {
            args.IsValid = (args.Value.length >= 10);
        }




    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background-color:#67C8B7">
        <div class="col-lg-8 col-md-8 col-sm-9">
            <br />
            <center><h4>Search Flight Route By there Origin OR Destination Airport</h4></center>
            <br />
            <asp:TextBox ID="txtFSCsearch" CssClass="form-control" Width="100%" placeholder="Search Flight Route By Origin Or destination" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnFSCsearch" CssClass="btn btn-primary" Width="100%" runat="server" Text="Search Flight Routes" />
            <br />
            <br />
            <asp:GridView ID="FSCview" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="routeid" DataSourceID="sdsFSCview" ForeColor="Black" GridLines="Vertical" Width="95%">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="routeid" HeaderText="Route ID" InsertVisible="False" ReadOnly="True" SortExpression="routeid" />
                    <asp:BoundField DataField="origin" HeaderText="Origin Airport" SortExpression="origin" />
                    <asp:BoundField DataField="destination" HeaderText="Destination Airport" SortExpression="destination" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <asp:SqlDataSource ID="sdsFSCview" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT routeid, origin, destination FROM Flight_routes WHERE (origin LIKE '%' + @origin + '%') OR (destination LIKE '%' + @destination + '%') ORDER BY origin" DeleteCommand="DELETE FROM [Flight_routes] WHERE [routeid] = @routeid" InsertCommand="INSERT INTO [Flight_routes] ([origin], [destination]) VALUES (@origin, @destination)" UpdateCommand="UPDATE [Flight_routes] SET [origin] = @origin, [destination] = @destination WHERE [routeid] = @routeid">
                <DeleteParameters>
                    <asp:Parameter Name="routeid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="origin" Type="String" />
                    <asp:Parameter Name="destination" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtFSCsearch" Name="origin" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtFSCsearch" Name="destination" PropertyName="Text" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="origin" Type="String" />
                    <asp:Parameter Name="destination" Type="String" />
                    <asp:Parameter Name="routeid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
             <br />
            <center><h4>View Flight Schedule</h4></center>
            <br />
            <asp:GridView ID="FSCschedule" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="scheduleid" DataSourceID="sdsFSCschedule" GridLines="Vertical" Width="100%">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:TemplateField HeaderText="Schedule ID" InsertVisible="False" SortExpression="scheduleid">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("scheduleid") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("scheduleid") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Flight Route ID" SortExpression="routeid">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("routeid") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("routeid") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Week Day" SortExpression="weekday">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("weekday") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("weekday") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Time" SortExpression="time">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("time") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("time") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Transport ID" SortExpression="Transport_id">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Transport_id") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Transport_id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fare" SortExpression="fare">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("fare") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("fare") %>'></asp:Label>
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
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
            <asp:SqlDataSource ID="sdsFSCschedule" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" DeleteCommand="DELETE FROM [Flight_schedule] WHERE [scheduleid] = @scheduleid" InsertCommand="INSERT INTO [Flight_schedule] ([routeid], [weekday], [time], [Transport_id], [fare]) VALUES (@routeid, @weekday, @time, @Transport_id, @fare)" SelectCommand="SELECT * FROM [Flight_schedule]" UpdateCommand="UPDATE [Flight_schedule] SET [routeid] = @routeid, [weekday] = @weekday, [time] = @time, [Transport_id] = @Transport_id, [fare] = @fare WHERE [scheduleid] = @scheduleid">
                <DeleteParameters>
                    <asp:Parameter Name="scheduleid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="routeid" Type="Int32" />
                    <asp:Parameter Name="weekday" Type="DateTime" />
                    <asp:Parameter Name="time" Type="DateTime" />
                    <asp:Parameter Name="Transport_id" Type="String" />
                    <asp:Parameter Name="fare" Type="Double" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="routeid" Type="Int32" />
                    <asp:Parameter Name="weekday" Type="DateTime" />
                    <asp:Parameter Name="time" Type="DateTime" />
                    <asp:Parameter Name="Transport_id" Type="String" />
                    <asp:Parameter Name="fare" Type="Double" />
                    <asp:Parameter Name="scheduleid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-3">
             <br />
            <center><h4>Add New Flight Schedule</h4></center>
            <br />
             <asp:Label ID="lblFSCRoute" runat="server" Text="Assign Route ID" Width="100%" Font-Bold="True"></asp:Label>
                <asp:DropDownList ID="ddlFSCroute" runat="server" AppendDataBoundItems="true" CssClass="form-control" Width="100%" DataSourceID="sdsFSCroute" DataTextField="routeid" DataValueField="routeid">
                    <asp:ListItem Value="0">Select Flight Route</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="sdsFSCroute" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [routeid] FROM [Flight_routes]"></asp:SqlDataSource>
            <br />
            <asp:Label ID="lblFSCweekday" runat="server" Text="Assign Weekday" Width="100%" Font-Bold="True"></asp:Label>
            <asp:DropDownList ID="ddlFSCweekday" CssClass="form-control" Width="100%" runat="server">
                <asp:ListItem Value="0">Select Weekday</asp:ListItem>
                <asp:ListItem>Saturday</asp:ListItem>
                <asp:ListItem>Sunday</asp:ListItem>
                <asp:ListItem>Monday</asp:ListItem>
                <asp:ListItem>Tuesday</asp:ListItem>
                <asp:ListItem>Wednesday</asp:ListItem>
                <asp:ListItem>Thrusday</asp:ListItem>
                <asp:ListItem>Friday</asp:ListItem>
             </asp:DropDownList>
               <br />
            <asp:Label ID="lblFSC" runat="server" Text="Assign Time" Width="100%" Font-Bold="True"></asp:Label>
            <asp:DropDownList ID="ddlFSCtime" CssClass="form-control" Width="100%" runat="server">
                <asp:ListItem Value="0">Select Flight Time</asp:ListItem>
                <asp:ListItem>7:00 AM</asp:ListItem>
                <asp:ListItem>8:00 AM</asp:ListItem>
                <asp:ListItem>9:00 AM</asp:ListItem>
                <asp:ListItem>10:00 AM</asp:ListItem>
                <asp:ListItem Value="11:00 AM">11:00 AM</asp:ListItem>
                <asp:ListItem>8:00 PM</asp:ListItem>
                <asp:ListItem>9:00 PM</asp:ListItem>
                <asp:ListItem>10:00 PM</asp:ListItem>
            </asp:DropDownList>
            
            <br />
            <asp:Label ID="lblFSCTransport" runat="server" Text="Assign Transport ID" Width="100%" Font-Bold="True"></asp:Label>
            <asp:DropDownList ID="ddlFSCtransport" AppendDataBoundItems="True" CssClass="form-control" Width="100%" runat="server" DataSourceID="sdsFSCtransport" DataTextField="flight_id" DataValueField="flight_id">
                <asp:ListItem Value="0">Select Flight ID</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="sdsFSCtransport" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [flight_id] FROM [flight_details]"></asp:SqlDataSource>
            <br />
            <asp:Label ID="lblFSCfare" runat="server" Text="Assign Transport Fare" Width="100%" Font-Bold="True"></asp:Label>
            <asp:TextBox ID="txtFSCfare" CssClass="form-control" Width="100%" onkeypress="return isNumber(event)" placeholder="Provide Flight Fare" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnTSCadd" CssClass="btn btn-primary" Width="55%" runat="server" style="float:left;" Text="Add Flight Schedule" OnClick="btnTSCadd_Click" />&nbsp;
            <asp:Button ID="btnFReset" CssClass="btn btn-primary" Width="30%" style="float:right;" runat="server" Text="Reset" OnClick="btnFReset_Click" />
            <br />
            <br />
            <asp:Label runat="server" ID="lblFSCsms" Width="100%"></asp:Label>
        </div>
    </div>
</asp:Content>
