<%@ Page Title="Bus Search" Language="C#" MasterPageFile="~/RUser.Master" AutoEventWireup="true" CodeBehind="RUserBusSearch.aspx.cs" Inherits="EasyTransit.RUserBusSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="Scripts/WebForms/GridView.js"></script>
    <script src="Scripts/jquery-1.10.2.js"></script>
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
        function ShowPopup(com, type, origin, destination, weekday, time, fare, bus) {

            $("[id*=btnShowPopup]").click(function () {
                
            $("#lblBuscompanyname").text(com);
            $("#lblBustype").text(type);
            $("#lblBusStratplace").text(origin);
            $("#lblBusdestinationplace").text(destination);
            $("#lblBusdeparturetime").text(weekday);
            $("#lblBusjourneydate").text(time);
            $("#lblBusfare").text(fare);
            $("#lblbusnumber").text(bus);
            })
           <%-- $('#<%=myModal.ClientID %>').show();--%>

        }
    </script>
    <style>
        .modal-backdrop { height: 100%; }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background:#E0DCEB; text-align:center; color:#140028;height:inherit;">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <br />
            <br />
            <br />
         <asp:Label runat="server" ID="td1"></asp:Label>&nbsp;
        <asp:Label runat="server" ID="td2"></asp:Label>
            <br />
            &nbsp;
        <asp:Label runat="server" ID="td3" Width="40%"></asp:Label>&nbsp;
        <asp:Label runat="server" ID="td4" Width="30%"></asp:Label>
           
            <br />
            <br />
            <asp:GridView ID="BusSResult" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table table-responsive table-hover" DataSourceID="SqlDataSource1" Width="100%" BorderStyle="None" CellPadding="5" CellSpacing="25" GridLines="None" Font-Bold="True" Font-Size="Medium" OnRowCommand="BusSResult_RowCommand" OnSelectedIndexChanged="BusSResult_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField HeaderText="Bus Company Name" SortExpression="bcompany_name">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtBuscom" runat="server" Text='<%# Bind("bcompany_name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBuscomname" runat="server" Text='<%# Bind("bcompany_name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Bus Type" SortExpression="bus_type">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("bus_type") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBustype" runat="server" Text='<%# Bind("bus_type") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Origin Place" SortExpression="origin">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("origin") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBusorigin" runat="server" Text='<%# Bind("origin") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Destination Place" SortExpression="destination">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("destination") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBusdestination" runat="server" Text='<%# Bind("destination") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Journey Day" SortExpression="weekday">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("weekday") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBusweekday" runat="server" Text='<%# Bind("weekday") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Time" SortExpression="time">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("time") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBustime" runat="server" Text='<%# Bind("time") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fare" SortExpression="fare">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("fare") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBusfare" runat="server" Text='<%# Bind("fare") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Coach No." SortExpression="Transport_id">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Transport_id") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBusno" runat="server" Text='<%# Bind("Transport_id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <%--<asp:Button runat="server" OnClick='btnShowPopup("<%# Eval("bcompany_name") %>","<%# Eval("bus_type") %>","<%# Eval("origin") %>","<%# Eval("destination") %>","<%# Eval("weekday") %>","<%# Eval("time") %>","<%# Eval("fare") %>","<%# Eval("Transport_id") %>")' data-toggle="modal" data-target="#myModal" Text="Book"></asp:Button>--%>
                            <asp:LinkButton runat="server" data-toggle="modal" data-target="#myModal"></asp:LinkButton>
                        </ItemTemplate>

                        <ControlStyle CssClass="btn btn-primary" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT Bus_company.bcompany_name, bus_details.bus_type, Bus_routes.origin, Bus_routes.destination, Bus_schedule.weekday, Bus_schedule.time, Bus_schedule.fare, Bus_schedule.Transport_id FROM Bus_company INNER JOIN bus_details ON Bus_company.bcompany_id = bus_details.bcompany_id INNER JOIN Bus_schedule ON bus_details.bus_id = Bus_schedule.Transport_id INNER JOIN Bus_routes ON Bus_schedule.routeid = Bus_routes.routeid WHERE (Bus_schedule.weekday = @weekday) AND (Bus_schedule.routeid = @routeid)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="td2" Name="weekday" PropertyName="Text" />
                    <asp:ControlParameter ControlID="td1" Name="routeid" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
                <div class="modal fade" id="myModal" style="display: none">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">
                                Buy Bus Ticket</h4>
                        </div>
                        <div class="modal-body">
                                <asp:Label ID="lblBuscompany" runat="server" Font-Bold="true" Text="Bus Company Name :"></asp:Label>&nbsp;
                                <asp:Label ID="lblBuscompanyname" runat="server"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="lblBusty" runat="server" Font-Bold="true" Text="Bus Type :"></asp:Label>&nbsp;
                                <asp:Label ID="lblBustype" runat="server" Text="Label"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="lblBusStart" runat="server" Font-Bold="true" Text="Starting Place :"></asp:Label>&nbsp;
                                <asp:Label ID="lblBusStratplace" runat="server" Text="Label"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="lblBusdestination" runat="server" Font-Bold="true" Text="Destination Place :"></asp:Label>&nbsp;
                                <asp:Label ID="lblBusdestinationplace" runat="server" Text="Label"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="lblBusdeparture" runat="server" Font-Bold="true" Text="Departure Time :"></asp:Label>&nbsp;
                                <asp:Label ID="lblBusdeparturetime" runat="server" Text="Label"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="lblBusdate" runat="server" Font-Bold="true" Text="Journey Date :"></asp:Label>&nbsp;
                                <asp:Label ID="lblBusjourneydate" runat="server" Text="Label"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="lblBusfa" runat="server" Font-Bold="true" Text="Fare :"></asp:Label>&nbsp;
                                <asp:Label ID="lblBusfare" runat="server" Text="Label"></asp:Label>
                              <br />
                                <br />
                                <asp:Label ID="lblBusid" runat="server" Font-Bold="true" Text="Coach No :"></asp:Label>&nbsp;
                                <asp:Label ID="lblbusnumber" runat="server"></asp:Label>
                        </div>
                        <div class="modal-footer">
                        <asp:Button type="button" class="btn btn-primary" runat="server" Text="Buy ticket"></asp:Button>
                            <button type="button" class="btn btn-default" data-dismiss="modal"> Close</button>

                        </div>
                    </div>
                </div>
            </div>
            </div>
 
    </div>
</asp:Content>
