<%@ Page Title="Add New Train" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="addNewTrain.aspx.cs" Inherits="EasyTransit.Admin.addNewTrain" %>
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
    <div class="container" style="position:relative;background-color:#00778A;padding:0px;">
        <div class="ad-Bus" style="border-radius:30px;">
            <div class="Bus-header" style="border-radius:30px;">Add New Train Informations</div>
            <div class="Bus-body" style="position:center;">
                    <div class="form-group" style="height:auto;">
                <asp:Label ID="Label1" runat="server" CssClass="active" Font-Bold="True" Text="Company Name" Style="display:block;"></asp:Label>
               <asp:DropDownList ID="DropDownListcom"  Width="100%" AppendDataBoundItems="true" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="tcompany_name" DataValueField="tcompany_id">
                   <asp:ListItem Value="0">Select Train Company</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT * FROM [Train_company] ORDER BY [tcompany_id]" ConflictDetection="CompareAllValues"
                            DeleteCommand="DELETE FROM [Train_company] WHERE [tcompany_id] = @original_tcompany_id AND [tcompany_name] = @original_tcompany_name" 
                            InsertCommand="INSERT INTO [Train_company] ([tcompany_name]) VALUES (@tcompany_name)" OldValuesParameterFormatString="original_{0}" 
                            UpdateCommand="UPDATE [Train_company] SET [tcompany_name] = @tcompany_name WHERE [tcompany_id] = @original_tcompany_id AND [tcompany_name] = @original_tcompany_name">
                            <DeleteParameters>
                                <asp:Parameter Name="original_tcompany_id" Type="Int32" />
                                <asp:Parameter Name="original_tcompany_name" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="tcompany_name" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="tcompany_name" Type="String" />
                                <asp:Parameter Name="original_tcompany_id" Type="Int32" />
                                <asp:Parameter Name="original_tcompany_name" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="rfvcompany" ErrorMessage="please Select Train company" 
                            ControlToValidate="DropDownListcom" InitialText="Select Train Company" InitialValue="0" ForeColor="Red" runat="server">
                        </asp:RequiredFieldValidator>
                    </div>
                <br />
                     <div class="form-group" style="height:auto;">
                <asp:Label ID="Label2" runat="server" CssClass="active" Font-Bold="True" Text="Train Number" Style="display:block;"></asp:Label>
               <asp:Label runat="server" ID="lbltrainnum" CssClass="form-control" Width="82%" Style="display:block;height:35px;"></asp:Label>
                    </div>
                <br />
                    <div class="form-group" style="height:auto;">
                <asp:Label ID="Label3" runat="server" CssClass="active" Font-Bold="True" Text="train Category" Style="display:block;"></asp:Label>
                <asp:DropDownList ID="DropDownListcetagory"  Width="100%" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListcetagory_SelectedIndexChanged">
                            <asp:ListItem Value="0">Select Train Type</asp:ListItem>
                            <asp:ListItem Value="350">InterCity</asp:ListItem>
                            <asp:ListItem Value="150">Demo</asp:ListItem>
                            <asp:ListItem Value="250">Mail</asp:ListItem>
                        </asp:DropDownList>
                         <asp:RequiredFieldValidator ID="rfvtraintype" ErrorMessage="please Select Train Type" 
                            ControlToValidate="DropDownListcetagory" InitialText="Select Train Type" InitialValue="0" ForeColor="Red" runat="server">
                        </asp:RequiredFieldValidator>
                    </div>
                <br />
                    <%--<div class="form-group" style="height:auto;">
                <asp:Label ID="Label4" runat="server" CssClass="active" Font-Bold="True" Text="Route ID" Style="display:block;"></asp:Label>
                         <asp:DropDownList ID="DropDownListroute" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvroute" ErrorMessage="please Select Train Route" 
                            ControlToValidate="DropDownListroute" InitialValue="Select Train RouteId" ForeColor="Red" runat="server">
                        </asp:RequiredFieldValidator>
                        </div>
                <br />
                    <div class="form-group" style="height:auto;">
                <asp:Label ID="Label5" runat="server" CssClass="active" Font-Bold="True" Text="Fare" Style="font-size: 16px;font-weight: inherit;"></asp:Label>
                <asp:TextBox ID="txtTrainFar" runat="server" onkeypress="return isNumber(event)" CssClass="form-control" placeholder="Provide the Estimate Fare"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rfvfare" ErrorMessage="please Select Train Fare" 
                            ControlToValidate="txtTrainFar"  ForeColor="Red" runat="server">
                        </asp:RequiredFieldValidator>
                        </div>
                <br />--%>
                    <div class="form-group" style="height:auto;">
                <asp:Label ID="Label6" runat="server" CssClass="active" Font-Bold="True" Text="Capacity" Style="display:block;"></asp:Label>
                 <asp:Label runat="server" ID="lbltraincap" CssClass="form-control" Width="82%" Style="display:block;height:35px;"></asp:Label>
                 </div>
                <div class="form-group" style="height:auto;">
                 <asp:Button runat="server" Text="Add New Train" CssClass="btn btn-primary btn-block" ID="btnaddTrain" OnClick="btnaddTrain_Click"/>
                     <asp:Label runat="server" ID="lblsms" CssClass="form-control" Width="82%" Style="display:block;"></asp:Label>
                    </div>
            </div>
       </div>
    </div>
</asp:Content>
