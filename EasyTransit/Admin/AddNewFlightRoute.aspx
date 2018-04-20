<%@ Page Title="Add Flgiht Route" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="AddNewFlightRoute.aspx.cs" Inherits="EasyTransit.Admin.AddNewFlightRoute" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background-color:#67C8B7;height:auto;">
            <div class="col-lg-5 col-md-5 col-sm-4">
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
                <br />
                <div class="form-group"  Style="margin-top:10px;">
                    <asp:Label runat="server" ID="lblFroute" Font-Bold="true" Text="Destination Airport " Style="margin-top:20px;" Width="100%"></asp:Label>
                    <asp:TextBox runat="server" ID="txtFdestination" CssClass="form-control" placeholder="Provide Destination Place" Width="100%"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="rfvdestination" ControlToValidate="txtFdestination"
                         ErrorMessage="Provide Destination" InitialValue="" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <br />
                 <div class="form-group"  Style="margin-top:10px;">

                     <asp:Button  runat="server" ID="btnFroute" CssClass="btn btn-primary" Text="Add Flight Route" Width="100%" OnClick="btnFroute_Click"/>
                     <asp:Label ID="lblFroutesms" runat="server" Width="100%" ForeColor="Green"></asp:Label>
                     </div>
                <br />
          </div>
        <br />
             <div class="col-lg-7 col-md-7 col-sm-8">
                <br />
                <br />
                <center><h4>View Train Route Information</h4></center>
                <br />
                <br />
                <center>
                    <asp:GridView runat="server" ID="GridViewFlight" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="routeid" DataSourceID="sdsFroute2" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:TemplateField HeaderText="routeid" InsertVisible="False" SortExpression="routeid">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("routeid") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("routeid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="origin" SortExpression="origin">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("origin") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("origin") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="destination" SortExpression="destination">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("destination") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("destination") %>'></asp:Label>
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
                    <asp:SqlDataSource runat="server" ID="sdsFroute2" ConnectionString="<%$ ConnectionStrings:mycon %>" DeleteCommand="DELETE FROM [Flight_routes] WHERE [routeid] = @routeid" InsertCommand="INSERT INTO [Flight_routes] ([origin], [destination]) VALUES (@origin, @destination)" SelectCommand="SELECT * FROM [Flight_routes] ORDER BY [origin], [destination]" UpdateCommand="UPDATE [Flight_routes] SET [origin] = @origin, [destination] = @destination WHERE [routeid] = @routeid">
                        <DeleteParameters>
                            <asp:Parameter Name="routeid" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="origin" Type="String" />
                            <asp:Parameter Name="destination" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="origin" Type="String" />
                            <asp:Parameter Name="destination" Type="String" />
                            <asp:Parameter Name="routeid" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </center>
            </div>
</div>
</asp:Content>
