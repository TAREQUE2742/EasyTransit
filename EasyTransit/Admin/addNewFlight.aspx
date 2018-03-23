<%@ Page Title="Add New Flight" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="addNewFlight.aspx.cs" Inherits="EasyTransit.Admin.addNewFlight" %>
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
            args.IsValid = (args.Value.length <= 2);
        }



    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="position:relative;background-color:#00778A;padding:0px;">
        <div class="ad-Bus" style="border-radius:30px;">
            <div class="Bus-header" style="border-radius:30px;">Add New Flight Informations</div>
            <div class="Bus-body" style="position:center;">
                   <%-- <div class="form-group">
                <asp:Label ID="Label4" runat="server" Text="Route ID" Style="font-size: 16px;font-weight: inherit;"></asp:Label>
                 <asp:DropDownList ID="DropDownListroute" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvroute" ErrorMessage="please Select Flight Route" 
                            ControlToValidate="DropDownListroute" InitialValue="Select Flight RouteId" ForeColor="Red" runat="server">
                        </asp:RequiredFieldValidator>
                        </div>--%>
                    <%-----<div class="form-group">
                <asp:Label ID="Label5" runat="server" Text="Fare" Style="font-size: 16px;font-weight: inherit;"></asp:Label>
                <asp:TextBox ID="txtFlightFar" runat="server" onkeypress="return isNumber(event)" CssClass="form-control" placeholder="Provide the Estimate Fare"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rfvfare" ErrorMessage="please Select Flight Fare" 
                            ControlToValidate="txtFlightFar"  ForeColor="Red" runat="server">
                        </asp:RequiredFieldValidator>
                        </div> -------%>
                   
                   <div class="form-group" style="height:auto;">
                       <asp:Label ID="Label1" runat="server" CssClass="active" Font-Bold="True" Text="Company Name" Style="display:block;"></asp:Label>
                       <asp:DropDownList ID="DropDownlistcom" runat="server" AppendDataBoundItems="True" CssClass="form-control" Width="100%" DataSourceID="SqlDataSource1" DataTextField="fcompany_name" DataValueField="fcompany_id">
                           <asp:ListItem Value="0">Select Company Name</asp:ListItem>
                       </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT * FROM [Flight_company] ORDER BY [fcompany_id]"></asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="rfvflightcom" runat="server" ControlToValidate="DropDownlistcom" 
                            ErrorMessage="Please Select Company Name" ForeColor="Red" InitialText="Select Company Name" InitialValue="0"></asp:RequiredFieldValidator>
                       </div>
                       <br />
                      
                       <div class="form-group" style="height:auto;">
                           <asp:Label ID="Label2" runat="server" CssClass="active" Font-Bold="True" Text="Flight ID" Style="display:block;"></asp:Label>
                       <asp:Label runat="server" ID="lblflightnum" CssClass="form-control" Width="82%" Style="display:block;"></asp:Label>

                       </div>
                <br />
                    <div class="form-group" style="height:auto;">
                       <asp:Label ID="Label3" runat="server" CssClass="active" Font-Bold="True" Text="Flight Category" Style="display:block;"></asp:Label>
                       <asp:DropDownList ID="DropDownlistcategory" runat="server" AppendDataBoundItems="True" CssClass="form-control" Width="100%" AutoPostBack="True" OnSelectedIndexChanged="DropDownlistcategory_SelectedIndexChanged">
                           <asp:ListItem Value="0">Select Flight Type</asp:ListItem>
                           <asp:ListItem Value="160">Local</asp:ListItem>
                           <asp:ListItem Value="190">International</asp:ListItem>
                       </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownlistcategory"
                            ErrorMessage="Please Select Flight Type" InitialText="Select Flight Type" InitialValue="0" ForeColor="Red"></asp:RequiredFieldValidator>
                       </div>
                <br />
                 <div class="form-group" style="height:auto;">
                           <asp:Label ID="Label4" runat="server" CssClass="active" Font-Bold="True" Text="Flight Capacity" Style="display:block;"></asp:Label>
                       <asp:Label runat="server" ID="lblflightcap" CssClass="form-control" Width="82%" Style="display:block;height:35px;"></asp:Label>

                       </div>
                <br />
                 <div class="form-group" style="height:auto;">
                     <asp:Button ID="btnaddFlight" runat="server" Text="Add New Flight" CssClass="btn btn-primary btn-block" OnClick="btnaddFlight_Click" />      
                     <asp:Label runat="server" ID="lblsms" Width="82%" Style="display:block;"></asp:Label>

                       </div>
                   
            </div>
       </div>
    </div>
</asp:Content>
