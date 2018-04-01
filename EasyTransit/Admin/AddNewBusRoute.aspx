<%@ Page Title="New Bus Route" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="AddNewBusRoute.aspx.cs" Inherits="EasyTransit.Admin.AddNewBusRoute" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background-color:#67C8B7;height:auto;">
            <div class="col-lg-4 col-md-3 col-sm-3">
                <br />
                <br />
               <center><h4>Add Bus Route</h4></center>
                <br />
                <br />
                <div class="form-group">
                <asp:Label runat="server" ID="addbroute" Text="Origin Place" Font-Bold="true" Width="100%"></asp:Label>
                <asp:TextBox runat="server" ID="txtaddbroute" CssClass="form-control" placeholder="Provide Origin Place" Width="100%"></asp:TextBox>
                    </div>
                <br />
                <div class="form-group"  Style="margin-top:10px;">
                    <asp:Label runat="server" ID="lblbroute" Font-Bold="true" Text="Destination Place " Style="margin-top:20px;" Width="100%"></asp:Label>
                    <asp:TextBox runat="server" ID="txtbdestination" CssClass="form-control" placeholder="Provide Destination Place" Width="100%"></asp:TextBox>
                </div>
                <br />
                 <div class="form-group"  Style="margin-top:10px;">

                     <asp:Button  runat="server" ID="btnbroute" CssClass="btn btn-primary" Text="Add Bus Route" Width="100%" OnClick="btnbroute_Click"/>
                     <asp:Label ID="lblroutesms" runat="server" Width="100%" ForeColor="Green"></asp:Label>
                </div>
                <br />
            </div>
        <br />
            <div class="col-lg-8 col-md-9 col-sm-9">
                <br />
                <br />
                <center>
                <h4>View Bus Route Details </h4>
                <br />
                <br />
                <asp:GridView runat="server" ID="GridViewBRoute" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="routeid" DataSourceID="sqldatasourceroute" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="Gainsboro" />
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
                <asp:SqlDataSource runat="server" ID="sqldatasourceroute" ConnectionString="<%$ ConnectionStrings:mycon %>" DeleteCommand="DELETE FROM [Bus_routes] WHERE [routeid] = @routeid" InsertCommand="INSERT INTO [Bus_routes] ([origin], [destination]) VALUES (@origin, @destination)" SelectCommand="SELECT * FROM [Bus_routes] ORDER BY [origin], [destination]" UpdateCommand="UPDATE [Bus_routes] SET [origin] = @origin, [destination] = @destination WHERE [routeid] = @routeid">
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
