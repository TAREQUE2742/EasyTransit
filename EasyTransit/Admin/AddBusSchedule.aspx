<%@ Page Title="New Bus Schedule" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="AddBusSchedule.aspx.cs" Inherits="EasyTransit.Admin.AddBusSchedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        

        function isNumber(evt) {
         evt = (evt) ? evt : window.event;
           var charCode = (evt.which) ? evt.which : evt.keyCode;
         if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
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
    <div class="container" style="background-color:#67C8B7;height:inherit;">
           
        <br />
             <div class="col-lg-6 col-md-6 col-sm-8">
                <br />
                <br />
                <center><h4>View Bus Schedule Information</h4></center>
                <br />
                <br />
                <center>
                    <br />
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Search Bus Route" CssClass="btn btn-primary" Width="100%" />
                    <br />
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="routeid" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="routeid" HeaderText="routeid" InsertVisible="False" ReadOnly="True" SortExpression="routeid" />
                            <asp:BoundField DataField="origin" HeaderText="origin" SortExpression="origin" />
                            <asp:BoundField DataField="destination" HeaderText="destination" SortExpression="destination" />
                            <asp:BoundField DataField="Transport_id" HeaderText="Transport_id" SortExpression="Transport_id" />
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
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT routeid, origin, destination, Transport_id FROM Bus_routes WHERE (origin LIKE '%' + @origin + '%') OR (destination LIKE '%' + @destination + '%')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBox1" Name="origin" PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBox1" Name="destination" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <br />
                </center>
            </div>
             <div class="col-lg-6 col-md-6 col-sm-4">
                        <br />
                        <br />
                        <center><h4>Add Bus Schedule</h4></center>
                        <br />
                        <br />
                 <center>
                        <div class="form-group">
                        <asp:label runat="server" id="addbschedule" text="route id" font-bold="true" width="100%"></asp:label>
                       <asp:dropdownlist runat="server" id="ddlbschedule" width="100%" cssclass="form-control" datasourceid="sdsbroute" datatextfield="routeid" datavaluefield="routeid"></asp:dropdownlist>
                            <%--<asp:requiredfieldvalidator runat="server" id="rfvorigin" controltovalidate="ddlbschedule"
                                 errormessage="provide bus route id" initialvalue="" forecolor="red"></asp:requiredfieldvalidator>--%>
                            <asp:sqldatasource runat="server" id="sdsbroute" connectionstring="<%$ connectionstrings:mycon %>" selectcommand="select [routeid] from [bus_routes]"></asp:sqldatasource>
                            </div>
                        <div class="form-group"  style="margin-top:10px;">
                            <asp:label runat="server" id="lblbschedule" font-bold="true" text="week day " style="margin-top:20px;" width="100%"></asp:label>
                           <asp:textbox id="txtbscheduledate" type="date" cssclass="form-control" runat="server" width="100%"></asp:textbox>
                        <%--    <asp:requiredfieldvalidator runat="server" id="rfvdestination" controltovalidate="txtbscheduledate"
                                 errormessage="pick up date" initialvalue="" forecolor="red"></asp:requiredfieldvalidator>--%>
                        </div>
                         <div class="form-group"  style="margin-top:10px;">
                            <asp:label runat="server" id="lblbschetransport" font-bold="true" text="choose transport id " style="margin-top:35px;"  width="100%"></asp:label>
                            <asp:dropdownlist runat="server" cssclass="form-control" appenddatabounditems="true" id="dropdownbsctransport" width="100%" datasourceid="sdsbscroute" datatextfield="bus_id" datavaluefield="bus_id" >
                                <asp:listitem value="0">select transport id</asp:listitem>
                             </asp:dropdownlist>
                             <asp:sqldatasource runat="server" id="sdsbscroute" connectionstring="<%$ connectionstrings:mycon %>" selectcommand="select [bus_id] from [bus_details]"></asp:sqldatasource>
                              <%--<asp:requiredfieldvalidator runat="server" id="rfvftransport" errormessage="please select transport id"
                                 controltovalidate="dropdownbsctransport"  initialvalue="0" forecolor="red"></asp:requiredfieldvalidator>--%>
                             </div>
                            <div class="form-group" style="margin-top:10px;">
                                <asp:label runat="server" id="lblbscfare" text="fare :" font-bold="true" style="margin-top:35px;"  width="100%"></asp:label>
                                <asp:textbox runat="server" id="txtbscfare"  onkeypress="return isnumber(event)" placeholder="provide the estimate fare" cssclass="form-control" width="100%"></asp:textbox>
                                <%--<asp:requiredfieldvalidator runat="server" id="rfvbscfare" errormessage="provide fare" initialvalue="" forecolor="red" controltovalidate="txtbscfare"></asp:requiredfieldvalidator>--%>
                            </div>
                             <div class="form-group" style="margin-top:35px;">

                                 <asp:button  runat="server" id="btnfroute" cssclass="btn btn-primary" style="margin-top:35px;" text="add bus schedule" width="100%"/>
                             <asp:label id="lblbschedulesms" runat="server" style="margin-top:35px;" width="100%" forecolor="green"></asp:label>
                             </div>
                    </center>
                     
                  </div>
        </div>
  
</asp:Content>