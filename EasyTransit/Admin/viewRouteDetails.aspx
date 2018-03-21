<%@ Page Title="Route Details" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="viewRouteDetails.aspx.cs" Inherits="EasyTransit.Admin.viewRouteDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 315px;
        }
        .auto-style3 {
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div class="container" style="padding:0px; background-color:#3A8330;">
                <div style="text-align:center;height:auto;padding:9px;background-color:teal; ">

                        <h2 style="color:white;">Route Details Information</h2>
                    </div>
                    <hr style="height:2px; background-color:#272323;"/>
                   <center>

                       <br />
                       <asp:FormView ID="FormView1" runat="server" DataKeyNames="routeid" Style="background-color:#fafafa; width:50%;" DataSourceID="SqlDataSource1" DefaultMode="Insert" OnItemInserting="FormView1_ItemInserting">
                           <EditItemTemplate>
                               <table class="media">
                                   <tr>
                                       <td>
                                           <br />
                                           Route ID</td>
                                       <td>
                                           <br />
                                           :</td>
                                       <td>
                                           <asp:Label ID="routeidLabel1" runat="server" CssClass="form-control" Text='<%# Eval("routeid") %>' />
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           <br />
                                           Origin</td>
                                       <td>
                                           <br />
                                           :</td>
                                       <td>
                                           <asp:TextBox ID="originTextBox" runat="server" CssClass="form-control" Text='<%# Bind("origin") %>' />
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           <br />
                                           Destination </td>
                                       <td>
                                           <br />
                                           :</td>
                                       <td>
                                           <asp:TextBox ID="destinationTextBox" runat="server" CssClass="form-control" Text='<%# Bind("destination") %>' />
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           <br />
                                           Fare</td>
                                       <td>
                                           <br />
                                           :</td>
                                       <td>
                                           <asp:TextBox ID="fareTextBox" runat="server" CssClass="form-control" Text='<%# Bind("fare") %>' />
                                       </td>
                                   </tr>
                               </table>
                               <br />
                               <br />
                               <br />
                               <br />
                               <br />
                               <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-primary" />
                           </EditItemTemplate>
                           <InsertItemTemplate>
                               <br />
                               <br />
                               <table class="table-responsive">
                                   <tr>
                                       <td>
                                           <br />
                                           Route Id</td>
                                       <td>
                                           <br />
                                           :</td>
                                       <td>
                                           <asp:Label ID="routeidlbl" runat="server" CssClass="form-control" Text='<%# Bind("routeid") %>' Style="height:35px;" Width="100%" />
                                       </td>
                                   </tr>
                                   <tr>
                                       <td class="auto-style3">
                                           <br />
                                           Origin</td>
                                       <td class="auto-style3">
                                           <br />
                                           :</td>
                                       <td class="auto-style3">
                                           <asp:TextBox ID="originTextBox" runat="server" CssClass="form-control" Text='<%# Bind("origin") %>' Width="100%" />
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           <br />
                                           Destination</td>
                                       <td>
                                           <br />
                                           :</td>
                                       <td>
                                           <asp:TextBox ID="destinationTextBox" runat="server" CssClass="form-control" Text='<%# Bind("destination") %>' Width="100%" />
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           <br />
                                           Fare</td>
                                       <td>
                                           <br />
                                           :</td>
                                       <td>
                                           <asp:TextBox ID="fareTextBox" runat="server" CssClass="form-control" Text='<%# Bind("fare") %>' Width="100%" />
                                       </td>
                                   </tr>
                               </table>
                               <br />
                               <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-primary" Text="Insert" OnClick="InsertButton_Click" OnLoad="Page_Load" />
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Reset" CssClass="btn btn-primary" Text="Reset" />
                           </InsertItemTemplate>
                           <ItemTemplate>
                               <table class="auto-style1">
                                   <tr>
                                       <td class="auto-style2">
                                           <br />
                                           Route ID</td>
                                       <td>
                                           <br />
                                           :</td>
                                       <td>
                                           <asp:Label ID="routeidLabel" runat="server" CssClass="form-control" Text='<%# Eval("routeid") %>' />
                                           
                                       </td>
                                   </tr>
                                   <tr>
                                       <td class="auto-style2">
                                           <br />
                                           Origin</td>
                                       <td>
                                           <br />
                                           :</td>
                                       <td>
                                           <asp:Label ID="originLabel" runat="server" CssClass="form-control" Text='<%# Bind("origin") %>' />
                                       </td>
                                   </tr>
                                   <tr>
                                       <td class="auto-style2">
                                           <br />
                                           Destination</td>
                                       <td>
                                           <br />
                                           :</td>
                                       <td>
                                           <asp:Label ID="destinationLabel" runat="server" CssClass="form-control" Text='<%# Bind("destination") %>' />
                                       </td>
                                   </tr>
                                   <tr>
                                       <td class="auto-style2">
                                           <br />
                                           Fare</td>
                                       <td>
                                           <br />
                                           :</td>
                                       <td>
                                           <asp:Label ID="fareLabel" runat="server" CssClass="form-control" Text='<%# Bind("fare") %>' />
                                       </td>
                                   </tr>
                               </table>
                               <br />
                               <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-primary" Text="Update" />
                               &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-primary" Text="Delete" />
                               &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" CssClass="btn btn-primary" Text="Reset" />
                           </ItemTemplate>
                       </asp:FormView>
                       <br />
                       <asp:GridView ID="Routegridview" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="table table-responsive table-hover" DataKeyNames="routeid" DataSourceID="SqlDataSource1" Width="50%">
                           <Columns>
                               <asp:TemplateField HeaderText="Route ID" SortExpression="routeid">
                                   <EditItemTemplate>
                                       <asp:Label ID="Label1" runat="server" Text='<%# Eval("routeid") %>'></asp:Label>
                                   </EditItemTemplate>
                                   <ItemTemplate>
                                       <asp:Label ID="Label4" runat="server" Text='<%# Bind("routeid") %>'></asp:Label>
                                   </ItemTemplate>
                               </asp:TemplateField>
                               <asp:TemplateField HeaderText="Origin" SortExpression="origin">
                                   <EditItemTemplate>
                                       <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("origin") %>'></asp:TextBox>
                                   </EditItemTemplate>
                                   <ItemTemplate>
                                       <asp:Label ID="Label3" runat="server" Text='<%# Bind("origin") %>'></asp:Label>
                                   </ItemTemplate>
                               </asp:TemplateField>
                               <asp:TemplateField HeaderText="Destination" SortExpression="destination">
                                   <EditItemTemplate>
                                       <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("destination") %>'></asp:TextBox>
                                   </EditItemTemplate>
                                   <ItemTemplate>
                                       <asp:Label ID="Label2" runat="server" Text='<%# Bind("destination") %>'></asp:Label>
                                   </ItemTemplate>
                               </asp:TemplateField>
                               <asp:TemplateField HeaderText="Fare" SortExpression="fare">
                                   <EditItemTemplate>
                                       <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fare") %>'></asp:TextBox>
                                   </EditItemTemplate>
                                   <ItemTemplate>
                                       <asp:Label ID="Label1" runat="server" Text='<%# Bind("fare") %>'></asp:Label>
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
                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" DeleteCommand="DELETE FROM [route_details] WHERE [routeid] = @routeid" InsertCommand="INSERT INTO [route_details] ([routeid], [origin], [destination], [fare]) VALUES (@routeid, @origin, @destination, @fare)" SelectCommand="SELECT * FROM [route_details] ORDER BY [routeid]" UpdateCommand="UPDATE [route_details] SET [origin] = @origin, [destination] = @destination, [fare] = @fare WHERE [routeid] = @routeid">
                           <DeleteParameters>
                               <asp:Parameter Name="routeid" Type="String" />
                           </DeleteParameters>
                           <InsertParameters>
                               <asp:Parameter Name="routeid" Type="String" />
                               <asp:Parameter Name="origin" Type="String" />
                               <asp:Parameter Name="destination" Type="String" />
                               <asp:Parameter Name="fare" Type="Double" />
                           </InsertParameters>
                           <UpdateParameters>
                               <asp:Parameter Name="origin" Type="String" />
                               <asp:Parameter Name="destination" Type="String" />
                               <asp:Parameter Name="fare" Type="Double" />
                               <asp:Parameter Name="routeid" Type="String" />
                           </UpdateParameters>
                       </asp:SqlDataSource>

                   </center>
            </div>
</asp:Content>
