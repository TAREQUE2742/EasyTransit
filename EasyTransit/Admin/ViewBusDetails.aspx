<%@ Page Title="Bus Details" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="ViewBusDetails.aspx.cs" Inherits="EasyTransit.Admin.ViewBusDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
          function onlyLetter(input){
    $(input).keypress(function(ev) {
   var keyCode = window.event ? ev.keyCode : ev.which;
  //  code

    });
}
    </script>
  

</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
        <div class="container" style="background-color:#67C8B7;height:inherit;">
            <div class="col-lg-5 col-md-4 col-sm-3">
                <br />
                <br />
                <div class="form-group">
                    <asp:TextBox ID="txtsearch" runat="server" CssClass="form-control" OnDataBinding="txtsearch_DataBinding" Width="70%"></asp:TextBox>
                    <br />
            <asp:Button ID="Button1" CssClass="btn btn-primary" style="display:inline-block" runat="server" Text="Search" OnClick="Button1_Click" />
            
                    </div>
   
            <br />
            <asp:GridView ID="SerachView" runat="server" AllowPaging="True" AllowSorting="True" CssClass="table table-responsive table-hover" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="bus_id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="bcompany_name" HeaderText="Bus Company" SortExpression="bcompany_name" />
                    <asp:BoundField DataField="bus_id" HeaderText="Bus ID" SortExpression="bus_id" ReadOnly="True" />
                    <asp:BoundField DataField="bus_type" HeaderText="Bus Type" SortExpression="bus_type" />
                    <asp:BoundField DataField="capacity" HeaderText="Capacity" SortExpression="capacity" />
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
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT Bus_company.bcompany_name, bus_details.bus_id, bus_details.bus_type, bus_details.capacity FROM Bus_company INNER JOIN bus_details ON Bus_company.bcompany_id = bus_details.bcompany_id WHERE (Bus_company.bcompany_name LIKE '%' + @bcompany_name + '%')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtsearch" Name="bcompany_name" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
      

            </div>
            <div class="col-lg-7 col-md-8 col-sm-9" style="padding:15px;">
                <center>
                    <h4 style="text-align:center;">View Bus Details</h4>
                    </center>
                    <br />
                    <br />
                    <asp:GridView ID="GridBusView" runat="server" Width="100%" style="margin-top:0px;" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="table table-responsive table-hover" DataKeyNames="bus_id" DataSourceID="SqlDataSource2" GridLines="Horizontal">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <Columns>
                            <asp:TemplateField HeaderText="bus_id" SortExpression="bus_id">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("bus_id") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("bus_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="bcompany_id" SortExpression="bcompany_id">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("bcompany_id") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("bcompany_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="bus_type" SortExpression="bus_type">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="drpdowntype" runat="server" Text='<%# Bind("bus_type") %>'>
                                        <asp:ListItem>AC</asp:ListItem>
                                        <asp:ListItem>Non-AC</asp:ListItem>
                                    </asp:DropDownList>
                                    <%--<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("bus_type") %>'></asp:TextBox>--%>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("bus_type") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="capacity" SortExpression="capacity">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtcap" runat="server" Text='<%# Bind("capacity") %>' ></asp:TextBox>
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
                                    <asp:LinkButton ID="btnEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                                <ControlStyle CssClass="btn btn-primary" />
                            </asp:TemplateField>
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
                    <br />


                    <asp:Label ID="lblBsms" runat="server" Width="100%"></asp:Label>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" DeleteCommand="DELETE FROM [bus_details] WHERE [bus_id] = @bus_id" InsertCommand="INSERT INTO [bus_details] ([bus_id], [bcompany_id], [bus_type], [capacity]) VALUES (@bus_id, @bcompany_id, @bus_type, @capacity)" SelectCommand="SELECT * FROM [bus_details]" UpdateCommand="UPDATE [bus_details] SET [bcompany_id] = @bcompany_id, [bus_type] = @bus_type, [capacity] = @capacity WHERE [bus_id] = @bus_id">
                        <DeleteParameters>
                            <asp:Parameter Name="bus_id" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="bus_id" Type="String" />
                            <asp:Parameter Name="bcompany_id" Type="Int32" />
                            <asp:Parameter Name="bus_type" Type="String" />
                            <asp:Parameter Name="capacity" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="bcompany_id" Type="Int32" />
                            <asp:Parameter Name="bus_type" Type="String" />
                            <asp:Parameter Name="capacity" Type="Int32" />
                            <asp:Parameter Name="bus_id" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                <center>
                    <h4 style="text-align:center;">Bus Company Details</h4>
                </center>
                    <br />
                    <br />
                    <asp:GridView ID="GridViewBCom" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="bcompany_id" DataSourceID="SqlDataSourceBCom" ForeColor="Black" GridLines="Horizontal" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="bcompany_id" HeaderText="Bus Company ID" InsertVisible="False" ReadOnly="True" SortExpression="bcompany_id" />
                            <asp:BoundField DataField="bcompany_name" HeaderText="Bus Company Name" SortExpression="bcompany_name" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSourceBCom" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT * FROM [Bus_company] ORDER BY [bcompany_name]"></asp:SqlDataSource>


            </div>
            </div>

</asp:Content>

