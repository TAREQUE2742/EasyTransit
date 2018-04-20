<%@ Page Title="Pessenger Details" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="viewPessengerDetails.aspx.cs" Inherits="EasyTransit.Admin.viewPessengerDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container" style="padding:0px;background-color:#67C8B7;">
      
               <br />
         <br />
               <center><h2>Search Passenger Details Information</h2>
          <br />
         <asp:TextBox runat="server" ID="txtpassengerDetails" placeholder="Search Passenger Details by Email" CssClass="form-control" Width="100%"></asp:TextBox>
         <br />
         <asp:Button runat="server" ID="tbnPassengerSearch" CssClass="btn btn-primary" Text="Search Passenger Details" Width="100%" />
                   </center> 
             <br />
             <br />
             <asp:GridView ID="PassengerGrid" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="userid" DataSourceID="sdsPassenger" GridLines="Vertical" Width="100%">
                 <AlternatingRowStyle BackColor="#DCDCDC" />
                 <Columns>
                     <asp:BoundField DataField="userid" HeaderText="User ID" InsertVisible="False" ReadOnly="True" SortExpression="userid" />
                     <asp:BoundField DataField="name" HeaderText="Passenger Name" SortExpression="name" />
                     <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
                     <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
                     <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                     <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                     <asp:BoundField DataField="contact" HeaderText="Contact" SortExpression="contact" />
                     <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
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
             <asp:SqlDataSource runat="server" ID="sdsPassenger" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT userid, name, password, Age, Gender, address, contact, email FROM Passenger_Details WHERE (name LIKE '%' + @name + '%') OR (email LIKE '%' + @email + '%')">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="txtpassengerDetails" Name="name" PropertyName="Text" />
                     <asp:ControlParameter ControlID="txtpassengerDetails" Name="email" PropertyName="Text" />
                 </SelectParameters>
               </asp:SqlDataSource>
                <br />
                <center><h4>View Passenger Details</h4></center>
                <br />
                <br />
                <asp:GridView ID="passengerView" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="userid" DataSourceID="sdspassengerView" Width="100%">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:TemplateField HeaderText="Name" SortExpression="name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Password" SortExpression="password">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("password") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("password") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Age" SortExpression="Age">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Age") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Age") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Gender") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address" SortExpression="address">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact" SortExpression="contact">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("contact") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("contact") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email" SortExpression="email">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("email") %>'></asp:Label>
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
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:SqlDataSource ID="sdspassengerView" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" DeleteCommand="DELETE FROM [Passenger_Details] WHERE [userid] = @userid" InsertCommand="INSERT INTO [Passenger_Details] ([name], [password], [Age], [Gender], [address], [contact], [email]) VALUES (@name, @password, @Age, @Gender, @address, @contact, @email)" SelectCommand="SELECT * FROM [Passenger_Details]" UpdateCommand="UPDATE [Passenger_Details] SET [name] = @name, [password] = @password, [Age] = @Age, [Gender] = @Gender, [address] = @address, [contact] = @contact, [email] = @email WHERE [userid] = @userid">
                    <DeleteParameters>
                        <asp:Parameter Name="userid" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="Age" Type="Int32" />
                        <asp:Parameter Name="Gender" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="contact" Type="Int32" />
                        <asp:Parameter Name="email" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="Age" Type="Int32" />
                        <asp:Parameter Name="Gender" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="contact" Type="Int32" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="userid" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
    </div>
</asp:Content>
