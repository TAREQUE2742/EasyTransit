<%@ Page Title="Train Reservation" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="TrainrReservation.aspx.cs" Inherits="EasyTransit.Admin.TrainrReservation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background-color:#67C8B7;">
        <h3 style="text-align:center;">View Train Reservation Details</h3>
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table table-responsive" DataKeyNames="ticket_id" DataSourceID="sdsViewTrainReserve" Width="100%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ticket_id" HeaderText="Ticket ID" InsertVisible="False" ReadOnly="True" SortExpression="ticket_id" />
                <asp:BoundField DataField="seat" HeaderText="Seat" SortExpression="seat" />
                <asp:BoundField DataField="passenger_id" HeaderText="Passenger ID" SortExpression="passenger_id" />
                <asp:BoundField DataField="Transport_id" HeaderText="Train ID" SortExpression="Transport_id" />
                <asp:BoundField DataField="routeid" HeaderText="Route ID" SortExpression="routeid" />
                <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                <asp:CommandField HeaderText="Actions" ShowDeleteButton="True" ShowEditButton="True">
                <ControlStyle CssClass="btn btn-primary" />
                </asp:CommandField>
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


        <asp:SqlDataSource ID="sdsViewTrainReserve" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" DeleteCommand="DELETE FROM [train_reservation] WHERE [ticket_id] = @ticket_id" InsertCommand="INSERT INTO [train_reservation] ([seat], [passenger_id], [Transport_id], [routeid], [date]) VALUES (@seat, @passenger_id, @Transport_id, @routeid, @date)" SelectCommand="SELECT * FROM [train_reservation] ORDER BY [Transport_id]" UpdateCommand="UPDATE [train_reservation] SET [seat] = @seat, [passenger_id] = @passenger_id, [Transport_id] = @Transport_id, [routeid] = @routeid, [date] = @date WHERE [ticket_id] = @ticket_id">
            <DeleteParameters>
                <asp:Parameter Name="ticket_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="seat" Type="String" />
                <asp:Parameter Name="passenger_id" Type="Int32" />
                <asp:Parameter Name="Transport_id" Type="String" />
                <asp:Parameter Name="routeid" Type="Int32" />
                <asp:Parameter DbType="Date" Name="date" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="seat" Type="String" />
                <asp:Parameter Name="passenger_id" Type="Int32" />
                <asp:Parameter Name="Transport_id" Type="String" />
                <asp:Parameter Name="routeid" Type="Int32" />
                <asp:Parameter DbType="Date" Name="date" />
                <asp:Parameter Name="ticket_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <center>
        <asp:TextBox ID="txtTrainSearch" runat="server" placeholder="Search Train Reservation by Train ID" CssClass="form-control" Width="100%"></asp:TextBox>
        <br />

        <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" Text="Search Train Reservation" Width="100%" />
        <br />
            </center>
        <br />
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ticket_id" DataSourceID="sdsViewTrain" ForeColor="#333333" GridLines="None" Width="100%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ticket_id" HeaderText="Ticket ID" InsertVisible="False" ReadOnly="True" SortExpression="ticket_id" />
                <asp:BoundField DataField="seat" HeaderText="Seat" SortExpression="seat" />
                <asp:BoundField DataField="passenger_id" HeaderText="Passenger ID" SortExpression="passenger_id" />
                <asp:BoundField DataField="Transport_id" HeaderText="Train ID" SortExpression="Transport_id" />
                <asp:BoundField DataField="routeid" HeaderText="Route ID" SortExpression="routeid" />
                <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                <asp:CommandField HeaderText="Actions" ShowDeleteButton="True" ShowEditButton="True">
                <ControlStyle CssClass="btn btn-primary" />
                </asp:CommandField>
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
        <asp:SqlDataSource ID="sdsViewTrain" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" DeleteCommand="DELETE FROM [train_reservation] WHERE [ticket_id] = @ticket_id" InsertCommand="INSERT INTO [train_reservation] ([seat], [passenger_id], [Transport_id], [routeid], [date]) VALUES (@seat, @passenger_id, @Transport_id, @routeid, @date)" SelectCommand="SELECT * FROM [train_reservation] WHERE ([Transport_id] LIKE '%' + @Transport_id + '%')" UpdateCommand="UPDATE [train_reservation] SET [seat] = @seat, [passenger_id] = @passenger_id, [Transport_id] = @Transport_id, [routeid] = @routeid, [date] = @date WHERE [ticket_id] = @ticket_id">
            <DeleteParameters>
                <asp:Parameter Name="ticket_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="seat" Type="String" />
                <asp:Parameter Name="passenger_id" Type="Int32" />
                <asp:Parameter Name="Transport_id" Type="String" />
                <asp:Parameter Name="routeid" Type="Int32" />
                <asp:Parameter DbType="Date" Name="date" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txtTrainSearch" Name="Transport_id" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="seat" Type="String" />
                <asp:Parameter Name="passenger_id" Type="Int32" />
                <asp:Parameter Name="Transport_id" Type="String" />
                <asp:Parameter Name="routeid" Type="Int32" />
                <asp:Parameter DbType="Date" Name="date" />
                <asp:Parameter Name="ticket_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />




    </div>
</asp:Content>
