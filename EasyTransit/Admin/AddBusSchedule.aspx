<%@ Page Title="New Bus Schedule" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="AddBusSchedule.aspx.cs" Inherits="EasyTransit.Admin.AddBusSchedule" %>
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
    <div class="container" style="background-color:#67C8B7;height:inherit;">
           
        <br />
             <div class="col-lg-8 col-md-8 col-sm-9">
                <br />
                <br />
                <center><h4>Search Bus Schedule Information</h4></center>
                <br />
                <br />
                <center>
                    <br />
                    <asp:TextBox ID="txtsearchBSC" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Search Bus Route" CssClass="btn btn-primary" Width="100%" />
                    <br />
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="routeid" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="routeid" HeaderText="routeid" InsertVisible="False" ReadOnly="True" SortExpression="routeid" />
                            <asp:BoundField DataField="origin" HeaderText="origin" SortExpression="origin" />
                            <asp:BoundField DataField="destination" HeaderText="destination" SortExpression="destination" />
                            <asp:BoundField DataField="Transport_id" HeaderText="Transport_id" SortExpression="Transport_id" />
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT routeid, origin, destination, Transport_id FROM Bus_routes WHERE (origin LIKE '%' + @origin + '%') OR (destination LIKE '%' + @destination + '%')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtsearchBSC" Name="origin" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtsearchBSC" Name="destination" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <h4>View Bus Schedule Details</h4>
                    <br />
                    <br />
                    <asp:GridView ID="BSCScheduleview" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="scheduleid" DataSourceID="sdsBSC" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:TemplateField HeaderText="schedule ID" InsertVisible="False" SortExpression="scheduleid">
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
                            <asp:TemplateField HeaderText="Transport Id" SortExpression="Transport_id">
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
                            <asp:CommandField HeaderText="Actions" ShowDeleteButton="True" ShowEditButton="True">
                            <ControlStyle CssClass="btn btn-primary" />
                            </asp:CommandField>
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
                    <asp:SqlDataSource ID="sdsBSC" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" DeleteCommand="DELETE FROM [Bus_schedule] WHERE [scheduleid] = @scheduleid" InsertCommand="INSERT INTO [Bus_schedule] ([routeid], [weekday], [time], [Transport_id], [fare]) VALUES (@routeid, @weekday, @time, @Transport_id, @fare)" SelectCommand="SELECT * FROM [Bus_schedule] ORDER BY [routeid], [time]" UpdateCommand="UPDATE [Bus_schedule] SET [routeid] = @routeid, [weekday] = @weekday, [time] = @time, [Transport_id] = @Transport_id, [fare] = @fare WHERE [scheduleid] = @scheduleid">
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
                </center>
            </div>
             <div class="col-lg-4 col-md-4 col-sm-3">
                        <br />
                        <br />
                        <center><h4>Add Bus Schedule</h4></center>
                        <br />
                        <br />
                 <center>
                        <div class="form-group">
                        <asp:label runat="server" id="addbschedule" text="route id" font-bold="true" width="100%"></asp:label>
                       <asp:dropdownlist runat="server" id="ddlbschedule" width="100%" AppendDataBoundItems="true" cssclass="form-control" datasourceid="sdsbroute" datatextfield="routeid" datavaluefield="routeid" AutoPostBack="True" OnSelectedIndexChanged="ddlbschedule_SelectedIndexChanged">
                           <asp:ListItem Value="0">Select Route ID</asp:ListItem>
                            </asp:dropdownlist>
                           <%-- <asp:requiredfieldvalidator runat="server" id="rfvorigin" controltovalidate="ddlbschedule"
                                 errormessage="provide bus route id" initialvalue="" forecolor="red"></asp:requiredfieldvalidator>--%>
                            <asp:sqldatasource runat="server" id="sdsbroute" connectionstring="<%$ connectionstrings:mycon %>" selectcommand="select [routeid] from [bus_routes]"></asp:sqldatasource>
                            </div>
                        <div class="form-group"  style="margin-top:10px;">
                            <asp:label runat="server" id="lblbschedule" font-bold="true" text="week day " style="margin-top:20px;" width="100%"></asp:label>
                            <asp:DropDownList ID="ddlBSClist" runat="server" CssClass="form-control" Width="100%">
                                <asp:ListItem Value="0">Select Day Of Week</asp:ListItem>
                                <asp:ListItem>Saturday</asp:ListItem>
                                <asp:ListItem>Sunday</asp:ListItem>
                                <asp:ListItem>Monday</asp:ListItem>
                                <asp:ListItem>Tuesday</asp:ListItem>
                                <asp:ListItem>Wednesday</asp:ListItem>
                                <asp:ListItem>Thrusday</asp:ListItem>
                                <asp:ListItem>Friday</asp:ListItem>
                            </asp:DropDownList>
                           <%--<asp:textbox id="txtbscheduledate" type="dayOfWeek" cssclass="form-control" runat="server" width="100%"></asp:textbox>--%>
                           <%-- <asp:requiredfieldvalidator runat="server" id="rfvdestination" controltovalidate="txtbscheduledate"
                                 errormessage="pick up date" initialvalue="" forecolor="red"></asp:requiredfieldvalidator>--%>
                        </div>
                         <div class="form-group"  style="margin-top:10px;">
                            <asp:label runat="server" id="lblbschetransport" font-bold="true" text="choose transport id " style="margin-top:35px;"  width="100%"></asp:label>
                            <asp:dropdownlist runat="server" cssclass="form-control" appenddatabounditems="true" id="dropdownbsctransport" width="100%" datasourceid="sdsbscroute" datatextfield="bus_id" datavaluefield="bus_id" >
                                <asp:listitem value="0">select transport id</asp:listitem>
                             </asp:dropdownlist>
                             <asp:sqldatasource runat="server" id="sdsbscroute" connectionstring="<%$ connectionstrings:mycon %>" selectcommand="select [bus_id] from [bus_details]"></asp:sqldatasource>
                             <%-- <asp:requiredfieldvalidator runat="server" id="rfvftransport" errormessage="please select transport id"
                                 controltovalidate="dropdownbsctransport"  initialvalue="0" forecolor="red"></asp:requiredfieldvalidator>--%>
                             </div>
                            <div class="form-group" style="margin-top:10px;">
                                <asp:label runat="server" id="lblbscfare" text="fare :" font-bold="true" style="margin-top:35px;"  width="100%"></asp:label>
                                <asp:textbox runat="server" id="txtbscfare"  onkeypress="return isNumber(event)" placeholder="provide the estimate fare" cssclass="form-control" width="100%"></asp:textbox>
                            <%--    <asp:requiredfieldvalidator runat="server" id="rfvbscfare" errormessage="provide fare" initialvalue="" forecolor="red" controltovalidate="txtbscfare"></asp:requiredfieldvalidator>--%>
                             
                            </div>
                                 <asp:label runat="server" id="lbltiem" text="Time :" font-bold="true" style="margin-top:35px;"  width="100%"></asp:label>
                                <asp:DropDownList ID="ddlBSCtime" runat="server" Width="100%" CssClass="form-control">
                                    <asp:ListItem Value="0">Select Time</asp:ListItem>
                                    <asp:ListItem>7:30 AM</asp:ListItem>
                                    <asp:ListItem>9:30 AM</asp:ListItem>
                                    <asp:ListItem>11:30 AM</asp:ListItem>
                                    <asp:ListItem>2:00 PM</asp:ListItem>
                                    <asp:ListItem>4:00 PM</asp:ListItem>
                                    <asp:ListItem>6:00 PM</asp:ListItem>
                                    <asp:ListItem>8:00 PM</asp:ListItem>
                                    <asp:ListItem>10:00 PM</asp:ListItem>
                                </asp:DropDownList>
                     </center>
                     
                             <div class="form-group" style="margin-top:25px;">

                                 <asp:button  runat="server" id="btnBSC" cssclass="btn btn-primary" OnClick="btnBSC_Click" style="margin-top:35px;float:left" text="add bus schedule" width="45%"/>&nbsp;
                                 <asp:button  runat="server" id="btnReset" cssclass="btn btn-primary" style="margin-top:35px; float:right" text="Reset" width="45%" OnClick="btnReset_Click"/>

                             <%----%>
                             </div>
                 <br />
                    
                    <center> <asp:label id="lblbschedulesms" runat="server" style="margin-top:35px;" width="100%" forecolor="Red"></asp:label></center>
                  </div>
        </div>
  
</asp:Content>