<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Database Administration.ascx.cs" Inherits="ThemePark.Database_Administration" %>

<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ParkID" DataSourceID="SqlDataSource1" AllowSorting="True">
    <Columns>
        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
        <asp:BoundField DataField="ParkID" HeaderText="Park ID" ReadOnly="True" SortExpression="ParkID" />
        <asp:BoundField DataField="ParkName" HeaderText="Park Name" SortExpression="ParkName" />
        <asp:BoundField DataField="AddressStreet" HeaderText="Address Street" SortExpression="AddressStreet" />
        <asp:BoundField DataField="AddressCity" HeaderText="Address City" SortExpression="AddressCity" />
        <asp:BoundField DataField="AddressState" HeaderText="Address State" SortExpression="AddressState" />
        <asp:BoundField DataField="URL" HeaderText="URL" SortExpression="URL" />
        <asp:BoundField DataField="ImagePath" HeaderText="Image Path" SortExpression="ImagePath" />
        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:LocalSQL mdf string %>" DeleteCommand="DELETE FROM [Park] WHERE [ParkID] = @original_ParkID AND (([ParkName] = @original_ParkName) OR ([ParkName] IS NULL AND @original_ParkName IS NULL)) AND (([AddressStreet] = @original_AddressStreet) OR ([AddressStreet] IS NULL AND @original_AddressStreet IS NULL)) AND (([AddressCity] = @original_AddressCity) OR ([AddressCity] IS NULL AND @original_AddressCity IS NULL)) AND (([AddressState] = @original_AddressState) OR ([AddressState] IS NULL AND @original_AddressState IS NULL)) AND (([URL] = @original_URL) OR ([URL] IS NULL AND @original_URL IS NULL)) AND (([ImagePath] = @original_ImagePath) OR ([ImagePath] IS NULL AND @original_ImagePath IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))" InsertCommand="INSERT INTO [Park] ([ParkID], [ParkName], [AddressStreet], [AddressCity], [AddressState], [URL], [ImagePath], [Description]) VALUES (@ParkID, @ParkName, @AddressStreet, @AddressCity, @AddressState, @URL, @ImagePath, @Description)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Park]" UpdateCommand="UPDATE [Park] SET [ParkName] = @ParkName, [AddressStreet] = @AddressStreet, [AddressCity] = @AddressCity, [AddressState] = @AddressState, [URL] = @URL, [ImagePath] = @ImagePath, [Description] = @Description WHERE [ParkID] = @original_ParkID AND (([ParkName] = @original_ParkName) OR ([ParkName] IS NULL AND @original_ParkName IS NULL)) AND (([AddressStreet] = @original_AddressStreet) OR ([AddressStreet] IS NULL AND @original_AddressStreet IS NULL)) AND (([AddressCity] = @original_AddressCity) OR ([AddressCity] IS NULL AND @original_AddressCity IS NULL)) AND (([AddressState] = @original_AddressState) OR ([AddressState] IS NULL AND @original_AddressState IS NULL)) AND (([URL] = @original_URL) OR ([URL] IS NULL AND @original_URL IS NULL)) AND (([ImagePath] = @original_ImagePath) OR ([ImagePath] IS NULL AND @original_ImagePath IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_ParkID" Type="Int32" />
        <asp:Parameter Name="original_ParkName" Type="String" />
        <asp:Parameter Name="original_AddressStreet" Type="String" />
        <asp:Parameter Name="original_AddressCity" Type="String" />
        <asp:Parameter Name="original_AddressState" Type="String" />
        <asp:Parameter Name="original_URL" Type="String" />
        <asp:Parameter Name="original_ImagePath" Type="String" />
        <asp:Parameter Name="original_Description" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="ParkID" Type="Int32" />
        <asp:Parameter Name="ParkName" Type="String" />
        <asp:Parameter Name="AddressStreet" Type="String" />
        <asp:Parameter Name="AddressCity" Type="String" />
        <asp:Parameter Name="AddressState" Type="String" />
        <asp:Parameter Name="URL" Type="String" />
        <asp:Parameter Name="ImagePath" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="ParkName" Type="String" />
        <asp:Parameter Name="AddressStreet" Type="String" />
        <asp:Parameter Name="AddressCity" Type="String" />
        <asp:Parameter Name="AddressState" Type="String" />
        <asp:Parameter Name="URL" Type="String" />
        <asp:Parameter Name="ImagePath" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="original_ParkID" Type="Int32" />
        <asp:Parameter Name="original_ParkName" Type="String" />
        <asp:Parameter Name="original_AddressStreet" Type="String" />
        <asp:Parameter Name="original_AddressCity" Type="String" />
        <asp:Parameter Name="original_AddressState" Type="String" />
        <asp:Parameter Name="original_URL" Type="String" />
        <asp:Parameter Name="original_ImagePath" Type="String" />
        <asp:Parameter Name="original_Description" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>