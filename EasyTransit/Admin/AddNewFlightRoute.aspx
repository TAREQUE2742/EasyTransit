<%@ Page Title="Add Flgiht Route" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="AddNewFlightRoute.aspx.cs" Inherits="EasyTransit.Admin.AddNewFlightRoute" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background-color:skyblue;height:600px;">
        <div class="row">
            <div class="col-lg-4 col-md-3 col-sm-3">
                <br />
                <br />
                <center><h4>Add Train Route</h4></center>
                <br />
                <br />
                <div class="form-group">
                <asp:Label runat="server" ID="addFroute" Text="Origin Place" Font-Bold="true" Width="100%"></asp:Label>
                <asp:TextBox runat="server" ID="txtaddFroute" CssClass="form-control" placeholder="Provide Origin Airport" Width="100%"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="rfvorigin" ControlToValidate="txtaddFroute"
                         ErrorMessage="Provide Origin Place" InitialValue="" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                <div class="form-group"  Style="margin-top:10px;">
                    <asp:Label runat="server" ID="lblFroute" Font-Bold="true" Text="Destination Airport " Style="margin-top:20px;" Width="100%"></asp:Label>
                    <asp:TextBox runat="server" ID="txtFdestination" CssClass="form-control" placeholder="Provide Destination Place" Width="100%"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="rfvdestination" ControlToValidate="txtFdestination"
                         ErrorMessage="Provide Destination" InitialValue="" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                 <div class="form-group"  Style="margin-top:10px;">
                    <asp:Label runat="server" ID="lblFtransport" Font-Bold="true" Text="Choose Transport ID " Style="margin-top:35px;"  Width="100%"></asp:Label>
                    <asp:DropDownList runat="server" CssClass="form-control" AppendDataBoundItems="True" ID="dropdownFtransport" Width="100%" DataSourceID="sdsFroute" DataTextField="flight_id" DataValueField="flight_id" >
                        <asp:ListItem Value="0">Select Flight ID</asp:ListItem>
                     </asp:DropDownList>
                     <asp:SqlDataSource runat="server" ID="sdsFroute" ConnectionString="<%$ ConnectionStrings:mycon %>" 
                         SelectCommand="SELECT [flight_id] FROM [flight_details]"></asp:SqlDataSource>
                      <asp:RequiredFieldValidator runat="server" ID="rfvFtransport" ErrorMessage="Please Select Transport ID"
                         ControlToValidate="dropdownFtransport"  InitialValue="0" ForeColor="Red"></asp:RequiredFieldValidator>

                     <asp:Button  runat="server" ID="btnFroute" CssClass="btn btn-primary" Text="Add Flight Route" Width="100%" OnClick="btnFroute_Click"/>
                     <asp:Label ID="lblFroutesms" runat="server" Width="100%" ForeColor="Green"></asp:Label>
                     </div>
          </div>
             <div class="col-lg-8 col-md-9 col-sm-9">
                <br />
                <br />
                <center><h4>View Train Route Information</h4></center>
                <br />
                <br />
                <center>
                    <asp:GridView runat="server" ID="GridViewFlight" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="routeid" DataSourceID="sdsFroute2" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:TemplateField HeaderText="Route ID" InsertVisible="False" SortExpression="routeid">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("routeid") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("routeid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Origin" SortExpression="origin">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("origin") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("origin") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Destination" SortExpression="destination">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("destination") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("destination") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Transport ID" SortExpression="Transport_id">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Transport_id") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Transport_id") %>'></asp:Label>
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
                    <asp:SqlDataSource runat="server" ID="sdsFroute2" ConnectionString="<%$ ConnectionStrings:mycon %>" DeleteCommand="DELETE FROM [Flight_routes] WHERE [routeid] = @routeid" InsertCommand="INSERT INTO [Flight_routes] ([origin], [destination], [Transport_id]) VALUES (@origin, @destination, @Transport_id)" SelectCommand="SELECT * FROM [Flight_routes] ORDER BY [Transport_id]" UpdateCommand="UPDATE [Flight_routes] SET [origin] = @origin, [destination] = @destination, [Transport_id] = @Transport_id WHERE [routeid] = @routeid">
                        <DeleteParameters>
                            <asp:Parameter Name="routeid" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="origin" Type="String" />
                            <asp:Parameter Name="destination" Type="String" />
                            <asp:Parameter Name="Transport_id" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="origin" Type="String" />
                            <asp:Parameter Name="destination" Type="String" />
                            <asp:Parameter Name="Transport_id" Type="String" />
                            <asp:Parameter Name="routeid" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </center>
            </div>

       </div>
</div>
</asp:Content>
