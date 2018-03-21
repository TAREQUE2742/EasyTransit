<%@ Page Title="Add New Bus" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="addNewBus.aspx.cs" Inherits="EasyTransit.Admin.addNewBus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        

        //function isNumber(evt) {
        //    evt = (evt) ? evt : window.event;
        //    var charCode = (evt.which) ? evt.which : evt.keyCode;
        //    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
        //        return false;
        //    }
        //    return true;
        //}
        function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }

        function MinLength(sender, args) {
            args.IsValid = (args.Value.length <= 2);
        }



    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="position: relative; padding: 0px;">
        <div class="ad-Bus" style="border-radius:30px;">
                <div class="Bus-header" style="border-radius:30px;">Add New Bus Informations</div>
                     <div class="Bus-body" style="position:center;">
                        <div class="form-group" style="height:auto">
                            <asp:Label ID="Label1" runat="server"  CssClass="active" Font-Bold="True" Text="Company Name"  Style="font-size: 16px;font-weight: inherit;display:block;"></asp:Label>
                            <asp:DropDownList ID="DropDownListcom" AppendDataBoundItems="true" runat="server" Width="100%" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="bcompany_name" DataValueField="bcompany_id" AutoPostBack="True">
                                <asp:ListItem Value="0">Select Company Name</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:mycon %>" DeleteCommand="DELETE FROM [Bus_company] WHERE [bcompany_id] = @original_bcompany_id AND [bcompany_name] = @original_bcompany_name" 
                                InsertCommand="INSERT INTO [Bus_company] ([bcompany_name]) VALUES (@bcompany_name)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Bus_company]" UpdateCommand="UPDATE [Bus_company] SET [bcompany_name] = @bcompany_name WHERE [bcompany_id] = @original_bcompany_id AND [bcompany_name] = @original_bcompany_name">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_bcompany_id" Type="Int32" />
                                    <asp:Parameter Name="original_bcompany_name" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="bcompany_name" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="bcompany_name" Type="String" />
                                    <asp:Parameter Name="original_bcompany_id" Type="Int32" />
                                    <asp:Parameter Name="original_bcompany_name" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:RequiredFieldValidator ID="rfvcompany" ErrorMessage="please Select Bus company" 
                                ControlToValidate="DropDownListcom" InitialText="Select Company Name" InitialValue="0" ForeColor="Red" runat="server">
                            </asp:RequiredFieldValidator>
                        </div>
                         <br />
                         <div class="form-group" style="height:auto">
                    <asp:Label ID="Label2" runat="server"  CssClass="active" Font-Bold="True" Text="Bus Number" Style="font-size: 16px;font-weight: inherit;display:block;"></asp:Label>
                    <asp:Label ID="lblbusid" runat="server" CssClass="form-control" Width="82%" Style="display:block;"></asp:Label> 
                        </div>
                        <div class="form-group" style="height:auto">
                    <asp:Label ID="Label3" runat="server"  CssClass="active" Font-Bold="True" Text="Bus Category" Style="font-size: 16px;font-weight: inherit;display:block;"></asp:Label>
                            <asp:DropDownList ID="DropDownListcetagory" AppendDataBoundItems="true" CssClass="form-control" Width="100%" runat="server" OnSelectedIndexChanged="DropDownListcetagory_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem Value="0">Select Bus Type</asp:ListItem>
                                <asp:ListItem Value="35">AC</asp:ListItem>
                                <asp:ListItem Value="45">Non-AC</asp:ListItem>
                            </asp:DropDownList>
                             <asp:RequiredFieldValidator ID="rfvbustype" ErrorMessage="please Select Bus Type" 
                                ControlToValidate="DropDownListcetagory" InitialText="Select Bus Type" InitialValue="0" ForeColor="Red" runat="server">
                            </asp:RequiredFieldValidator>
                        </div>
                         <br />
                          <%--<div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Route ID" Style="font-size: 16px;font-weight: inherit;"></asp:Label>
                            <asp:DropDownList ID="DropDownListroute" runat="server" CssClass="form-control"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvroute" ErrorMessage="please Select Bus Route" 
                                ControlToValidate="DropDownListroute" InitialValue="Select Bus Route ID" ForeColor="Red" runat="server">
                            </asp:RequiredFieldValidator>
                            </div>--%>
                       <%--- <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Fare" Style="font-size: 16px;font-weight: inherit;"></asp:Label>
                    <asp:TextBox ID="txtBusFar" runat="server" onkeypress="return isNumber(event)" CssClass="form-control" placeholder="Provide the Estimate Fare"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="rfvfare" ErrorMessage="please Select Bus Fare" 
                                ControlToValidate="txtBusFar"  ForeColor="Red" runat="server">
                            </asp:RequiredFieldValidator>
                            </div>------%> 
                        <div class="form-group" style="height:auto">
                    <asp:Label ID="Label6" runat="server"  CssClass="active" Font-Bold="True" Text="Capacity" Style="font-size: 16px;font-weight: inherit;display:block;"></asp:Label>
                     <asp:Label CssClass="form-control" runat="server" ID="lblcap" Width="82%" style="display:block;height:35px;"></asp:Label>
                        <%--    <script src="Scripts/jquery-1.10.2.js"></script>
                            <script>
                                $(document).ready(function (){
                                    $("#DropDownListcetagory").change(function (){
                                        var a = $("#DropDownListcetagory Option:Selected").text();
                                        $("#lblcap").text(a);
                                    })
                                })

                            </script>--%>
                    <%--<asp:TextBox ID="txtBusCap" runat="server" onkeypress="return isNumber(event)" CssClass="form-control" MaxLength="2" placeholder="Provide Bus Capacity Info"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rfvcapacity" ErrorMessage="please Insert Bus Capacity" ClientValidationFunction="MinLength"
                          ControlToValidate="txtBusCap" ForeColor="Red" runat="server">
                         </asp:RequiredFieldValidator>--%>
                     </div>
                         <br />
                         <div class="form-group" style="height:auto">
                     <asp:Button runat="server" Text="Add New Bus" CssClass="btn btn-primary btn-block" OnClick="btnAddBus" />
                         <asp:Label runat="server" ID="lblsms" style="display:block;" Width="82%" CssClass="alert"></asp:Label>
                             </div>
                </div>
           </div>
       </div>
</asp:Content>
