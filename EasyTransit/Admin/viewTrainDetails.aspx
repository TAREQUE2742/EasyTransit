<%@ Page Title="Train Details" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="viewTrainDetails.aspx.cs" Inherits="EasyTransit.Admin.viewTrainDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="padding:0px;background-color:#67C8B7;">
        <div style="text-align:center;height:auto;padding:9px;background-color:#67C8B7;width:auto; ">

                <h2 style="color:white;">Train Details Information</h2>
            </div>
            <hr style="height:2px; background-color:#272323;"/>
        <div class="container">
            <div class="col-lg-4 col-md-4 col-sm-3">
                <br />
                <asp:TextBox ID="txtsearchtrain" runat="server" CssClass="form-control" Width="97%"></asp:TextBox>
                <br />
                <asp:Button ID="btnsearchtrain" runat="server" CssClass="btn btn-primary" Text="Search Train " Width="60%" />
                <br />
                <br />
                <asp:GridView ID="searchGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="train_id" DataSourceID="SqlDataSourcesearch" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="tcompany_name" HeaderText="tcompany_name" SortExpression="tcompany_name" />
                        <asp:BoundField DataField="train_id" HeaderText="train_id" ReadOnly="True" SortExpression="train_id" />
                        <asp:BoundField DataField="train_type" HeaderText="train_type" SortExpression="train_type" />
                        <asp:BoundField DataField="capacity" HeaderText="capacity" SortExpression="capacity" />
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlDataSourcesearch" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT Train_company.tcompany_name, train_details.train_id, train_details.train_type, train_details.capacity FROM Train_company INNER JOIN train_details ON Train_company.tcompany_id = train_details.tcompany_id WHERE (Train_company.tcompany_name LIKE '%' + @tcompany_name + '%') OR (train_details.train_id LIKE '%' + @train_id + '%')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtsearchtrain" Name="tcompany_name" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtsearchtrain" Name="train_id" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <br />
            <br />
            <div class="col-lg-8 col-md-8 col-sm-9">
                <center>
                    <h4>Train Details Information</h4>
                </center>
                <asp:GridView ID="TrainDetailsGrid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="train_id" DataSourceID="SqlDataSourceTrain" GridLines="Vertical" Width="100%">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:TemplateField HeaderText="Train ID" SortExpression="train_id">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("train_id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("train_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Train Company ID" SortExpression="tcompany_id">
                            <EditItemTemplate>
                              <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tcompany_id") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("tcompany_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Train Type" SortExpression="train_type">
                            <EditItemTemplate>
                                <%--<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("train_type") %>'></asp:TextBox>--%>

                                <asp:DropDownList ID="DropDownList1" runat="server" Text='<%# Bind("train_type") %>' >
                                    <asp:ListItem>InterCity</asp:ListItem>
                                    <asp:ListItem>DEMU</asp:ListItem>
                                    <asp:ListItem>Mail</asp:ListItem>
                                </asp:DropDownList>

                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("train_type") %>'></asp:Label>
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
                <br />
                <asp:SqlDataSource ID="SqlDataSourceTrain" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" DeleteCommand="DELETE FROM [train_details] WHERE [train_id] = @train_id" InsertCommand="INSERT INTO [train_details] ([train_id], [tcompany_id], [train_type], [capacity]) VALUES (@train_id, @tcompany_id, @train_type, @capacity)" SelectCommand="SELECT * FROM [train_details] ORDER BY [tcompany_id], [train_type]" UpdateCommand="UPDATE [train_details] SET [tcompany_id] = @tcompany_id, [train_type] = @train_type, [capacity] = @capacity WHERE [train_id] = @train_id">
                    <DeleteParameters>
                        <asp:Parameter Name="train_id" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="train_id" Type="String" />
                        <asp:Parameter Name="tcompany_id" Type="Int32" />
                        <asp:Parameter Name="train_type" Type="String" />
                        <asp:Parameter Name="capacity" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="tcompany_id" Type="Int32" />
                        <asp:Parameter Name="train_type" Type="String" />
                        <asp:Parameter Name="capacity" Type="Int32" />
                        <asp:Parameter Name="train_id" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:Label ID="lblTsms" runat="server" Width="100%"></asp:Label>
                <br />
                <br />
                <center>
                    <h4 style="text-align:center;">View Train Company Details</h4>
                </center>
                <br />
                <asp:GridView ID="GridViewTcom" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="tcompany_id" DataSourceID="SqlDataSourceTcom" ForeColor="#333333" GridLines="None" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="tcompany_id" HeaderText="Train Company ID" InsertVisible="False" ReadOnly="True" SortExpression="tcompany_id" />
                        <asp:BoundField DataField="tcompany_name" HeaderText="Train Company Name" SortExpression="tcompany_name" />
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
                <asp:SqlDataSource ID="SqlDataSourceTcom" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT * FROM [Train_company] ORDER BY [tcompany_name]"></asp:SqlDataSource>
                <br />
            </div>
        </div>
    </div>
</asp:Content>
