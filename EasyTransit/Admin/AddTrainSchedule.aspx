<%@ Page Title="Add Train Schedule" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="AddTrainSchedule.aspx.cs" Inherits="EasyTransit.Admin.AddTrainSchedule" %>
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
            <center><h4>Search Train Route By there Origin OR Destination Station</h4></center>
            <br />
            <asp:TextBox ID="txtTSCsearch" CssClass="form-control" Width="100%" placeholder="Search Train Route By Origin Or destination" runat="server"></asp:TextBox>
            <br />
            <asp:Button  runat="server" ID="btnTSCsearch" CssClass="btn btn-primary" Width="100%" Text="Search Train Routes" OnClick="btnTSCsearch_Click"/>
            <br />
            <br />
            <asp:GridView ID="TSCsearchgridview" runat="server" Width="100%" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="routeid" DataSourceID="sdsTSCsearch" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="routeid" HeaderText="routeid" InsertVisible="False" ReadOnly="True" SortExpression="routeid" />
                    <asp:BoundField DataField="origin" HeaderText="origin" SortExpression="origin" />
                    <asp:BoundField DataField="destination" HeaderText="destination" SortExpression="destination" />
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
            <asp:SqlDataSource runat="server" ID="sdsTSCsearch" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT routeid, origin, destination FROM Train_routes WHERE (origin LIKE '%' + @origin + '%') OR (destination LIKE '%' + @destination + '%') ORDER BY origin, destination" DeleteCommand="DELETE FROM [Train_routes] WHERE [routeid] = @routeid" InsertCommand="INSERT INTO [Train_routes] ([origin], [destination]) VALUES (@origin, @destination)" UpdateCommand="UPDATE [Train_routes] SET [origin] = @origin, [destination] = @destination WHERE [routeid] = @routeid">
                <DeleteParameters>
                    <asp:Parameter Name="routeid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="origin" Type="String" />
                    <asp:Parameter Name="destination" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtTSCsearch" Name="origin" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtTSCsearch" Name="destination" PropertyName="Text" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="origin" Type="String" />
                    <asp:Parameter Name="destination" Type="String" />
                    <asp:Parameter Name="routeid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <center><h4>View Train Schedule</h4></center>
            <br />
            <asp:GridView ID="TSCView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="scheduleid" DataSourceID="sdsTSCView" ForeColor="Black" GridLines="Vertical" Width="100%">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:TemplateField HeaderText="Schedule ID" InsertVisible="False" SortExpression="scheduleid">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("scheduleid") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("scheduleid") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Route ID" SortExpression="routeid">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("routeid") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("routeid") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Weekday" SortExpression="weekday">
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
                        <ControlStyle CssClass="btn btn-success" />
                    </asp:TemplateField>
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
            <asp:SqlDataSource ID="sdsTSCView" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" DeleteCommand="DELETE FROM [Train_schedule] WHERE [scheduleid] = @scheduleid" InsertCommand="INSERT INTO [Train_schedule] ([routeid], [weekday], [time], [Transport_id], [fare]) VALUES (@routeid, @weekday, @time, @Transport_id, @fare)" SelectCommand="SELECT * FROM [Train_schedule] ORDER BY [weekday], [time]" UpdateCommand="UPDATE [Train_schedule] SET [routeid] = @routeid, [weekday] = @weekday, [time] = @time, [Transport_id] = @Transport_id, [fare] = @fare WHERE [scheduleid] = @scheduleid">
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
            <center><h4>Add New Train Schedule</h4></center>
            <br />
             <asp:Label ID="lblTSCRoute" runat="server" Text="Assign Route ID" Width="100%" Font-Bold="True"></asp:Label>
                <asp:DropDownList ID="ddlTSCroute" runat="server" CssClass="form-control" Width="100%" DataSourceID="sdsTSCroute" DataTextField="routeid" DataValueField="routeid">
                    <asp:ListItem Value="0">Select Train Route</asp:ListItem>
            </asp:DropDownList>
                <asp:SqlDataSource ID="sdsTSCroute" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [routeid] FROM [Train_routes]"></asp:SqlDataSource>
            <br />
            <asp:Label ID="lblTSCweekday" runat="server" Text="Assign Weekday" Width="100%" Font-Bold="True"></asp:Label>
            <asp:DropDownList ID="ddlTSCweekday" CssClass="form-control" Width="100%" runat="server">
                <asp:ListItem Value="0">Select Schedule Day</asp:ListItem>
                <asp:ListItem>Saturday</asp:ListItem>
                <asp:ListItem>Sunday</asp:ListItem>
                <asp:ListItem>Monday</asp:ListItem>
                <asp:ListItem>Tuesday</asp:ListItem>
                <asp:ListItem>Wednesday</asp:ListItem>
                <asp:ListItem>Thursday</asp:ListItem>
                <asp:ListItem>Friday</asp:ListItem>
            </asp:DropDownList>
               <br />
            <asp:Label ID="lblTSC" runat="server" Text="Assign Time" Width="100%" Font-Bold="True"></asp:Label>
            <asp:DropDownList ID="ddlTSCtime" CssClass="form-control" Width="100%" runat="server">
                <asp:ListItem Value="0">Select Train Time</asp:ListItem>
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
            <asp:Label ID="lblTransport" runat="server" Text="Assign Transport ID" Width="100%" Font-Bold="True"></asp:Label>
            <asp:DropDownList ID="ddlTSCtransport" AppendDataBoundItems="true" CssClass="form-control" Width="100%" runat="server" DataSourceID="sdsTSCtransport" DataTextField="train_id" DataValueField="train_id">
                <asp:ListItem Value="0">Select Train ID</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="sdsTSCtransport" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [train_id] FROM [train_details]"></asp:SqlDataSource>
            <br />
            <asp:Label ID="lblTSCfare" runat="server" Text="Assign Transport Fare" Width="100%" Font-Bold="True"></asp:Label>
            <asp:TextBox ID="txtTSCfare" CssClass="form-control" Width="100%" placeholder="Provide Train Fare" runat="server" onkeypress="return isNumber(event)"></asp:TextBox>
            <br />
            <asp:Button ID="btnTSCadd" CssClass="btn btn-primary" Width="45%" runat="server" Style="float:left" Text="Add Train Schedule" OnClick="btnTSCadd_Click" />&nbsp;
            <asp:button  runat="server" id="btnReset" cssclass="btn btn-primary" style=" float:right" text="Reset" width="45%" OnClick="btnReset_Click" />
            <br />
            <br />
            <asp:Label runat="server" ID="lblTSCsms" Width="100%"></asp:Label>
        </div>
        <br />
    </div>
</asp:Content>
