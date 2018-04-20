<%@ Page Title="Flight details" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="viewFlightDetails.aspx.cs" Inherits="EasyTransit.Admin.viewFlightDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container" style="padding:0px;">
                <div style="text-align:center;height:auto;padding:9px;background-color:teal; ">

                        <h3 style="text-align:center;">Flight Details Information</h3>
                    </div>
                    <hr style="height:2px; background-color:#272323;"/>
                    <div class="container" style="background-color:#67C8B7;">
                        <div class="col-lg-4 col-md-3 col-sm-3">
                            <asp:TextBox ID="txtsearchflight" runat="server" placeholder="Search Flight ID by Flight Company Name" CssClass="form-control" Width="90%"></asp:TextBox>
                            <br />
                            <asp:Button ID="btnsearchflight" runat="server" CssClass="btn btn-primary" OnClick="btnsearchflight_Click" Text="Search By Flight Company" Width="60%" />
                            <br />
                            <br />
                            <asp:GridView ID="GridViewFlight" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="flight_id" DataSourceID="SqlDataSource1" GridLines="Vertical" Width="100%">
                                <AlternatingRowStyle BackColor="#DCDCDC" />
                                <Columns>
                                    <asp:BoundField DataField="fcompany_name" HeaderText="Flight Company Name" SortExpression="fcompany_name" />
                                    <asp:BoundField DataField="flight_id" HeaderText="Flight ID" ReadOnly="True" SortExpression="flight_id" />
                                    <asp:BoundField DataField="flight_type" HeaderText="Flight Type" SortExpression="flight_type" />
                                    <asp:BoundField DataField="capacity" HeaderText="Capacity" SortExpression="capacity" />
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
                            <br />
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT Flight_company.fcompany_name, flight_details.flight_id, flight_details.flight_type, flight_details.capacity FROM Flight_company INNER JOIN flight_details ON Flight_company.fcompany_id = flight_details.fcompany_id WHERE (Flight_company.fcompany_name LIKE '%' + @fcompany_name + '%')">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtsearchflight" Name="fcompany_name" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <center>
                            <h4 style="text-align:center;">View Flight Details</h4>
                        </center>
                        <br />
                        <div class="col-lg-8 col-md-9 col-sm-9">
                            <asp:GridView ID="GridViewflightcom" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="table table-responsive table-hover" DataKeyNames="flight_id" DataSourceID="SqlDataSource2" Width="100%">
                                <Columns>
                                    <asp:TemplateField HeaderText="Flight ID" SortExpression="flight_id">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("flight_id") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("flight_id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Flight Company ID" SortExpression="fcompany_id">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fcompany_id") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("fcompany_id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Flight Type" SortExpression="flight_type">
                                        <EditItemTemplate>
                                            <%--<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("flight_type") %>'></asp:TextBox>--%>
                                            <asp:DropDownList ID="DropDownflightlist"  runat="server" Text='<%# Bind("flight_type") %>'>
                                                <asp:ListItem>Local</asp:ListItem>
                                                <asp:ListItem>International</asp:ListItem>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("flight_type") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Capacity" SortExpression="capacity">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("capacity") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("capacity") %>'></asp:Label>
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
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" DeleteCommand="DELETE FROM [flight_details] WHERE [flight_id] = @flight_id" InsertCommand="INSERT INTO [flight_details] ([flight_id], [fcompany_id], [flight_type], [capacity]) VALUES (@flight_id, @fcompany_id, @flight_type, @capacity)" SelectCommand="SELECT * FROM [flight_details] ORDER BY [fcompany_id]" UpdateCommand="UPDATE [flight_details] SET [fcompany_id] = @fcompany_id, [flight_type] = @flight_type, [capacity] = @capacity WHERE [flight_id] = @flight_id">
                                <DeleteParameters>
                                    <asp:Parameter Name="flight_id" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="flight_id" Type="String" />
                                    <asp:Parameter Name="fcompany_id" Type="Int32" />
                                    <asp:Parameter Name="flight_type" Type="String" />
                                    <asp:Parameter Name="capacity" Type="Int32" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="fcompany_id" Type="Int32" />
                                    <asp:Parameter Name="flight_type" Type="String" />
                                    <asp:Parameter Name="capacity" Type="Int32" />
                                    <asp:Parameter Name="flight_id" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:Label ID="lblFsms" runat="server" Width="100%"></asp:Label>
                            <br />
                            <br />
                            <center>
                                <h4 style="text-align:center;">View Flight Company Details</h4>
                            </center>
                            <br />
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="fcompany_id" DataSourceID="SqlDataSourceFlightc" ForeColor="#333333" GridLines="None" Width="100%">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="fcompany_id" HeaderText="Flight Company ID" InsertVisible="False" ReadOnly="True" SortExpression="fcompany_id" />
                                    <asp:BoundField DataField="fcompany_name" HeaderText="Flight Company Name" SortExpression="fcompany_name" />
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
                            <asp:SqlDataSource ID="SqlDataSourceFlightc" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT * FROM [Flight_company] ORDER BY [fcompany_name]"></asp:SqlDataSource>
                            <br />
                        </div>
                </div>
        </div>
</asp:Content>
