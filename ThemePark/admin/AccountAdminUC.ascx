<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AccountAdminUC.ascx.cs" Inherits="admin_AccountAdminUC" %>

<asp:HiddenField ID="UserNameHiddenField" runat="server" />
<asp:HiddenField ID="SkipValueHiddenField" Value="0" runat="server" />
<asp:HiddenField ID="CurrentlyViewedHiddenField" Value="-1" runat="server" />

<asp:RoundedCornersExtender ID="AccountAdminRoundedCornersExtender" runat="server" TargetControlID="AccountAdminPanel" />
<asp:DropShadowExtender ID="AccountAdminDropShadow" runat="server" TargetControlID="AccountAdminPanel" />
<asp:Panel ID="AccountAdminPanel" runat="server" CssClass="AccountAdminControlPanel" width="600px">

    <asp:Table CssClass="AccountAdminTable" runat="server" ID="AccountAdminTable">

        <asp:TableRow runat="server" ID="AccountAdminTableRow1">

            <asp:TableCell ID="AccountAdminTableRow1Cell1" ColumnSpan="5" runat="server">
                <asp:GridView CssClass="AccountAdminGridView" runat="server" ID="AccountAdminGridView"
                    OnSelectedIndexChanged="AccountAdminGridViewSelectedChanged" AutoGenerateSelectButton="true"
                    AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="User Name">
                            <ItemTemplate>
                                <p class="AccountAdminGridViewTextPanel">
                                    <asp:Label ID="GridViewNameLabel" CssClass="AccountAdminGridViewText" Text='<%# Eval("UserName") %>' runat="server" />
                                </p>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email Address">
                            <ItemTemplate>
                                <p class="AccountAdminGridViewTextPanel">
                                    <asp:Label ID="GridViewEmailLabel" CssClass="AccountAdminGridViewText" Text='<%# Eval("Email") %>' runat="server" />
                                </p>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <p class="AccountAdminGridViewTextPanel">
                                    <asp:Label ID="GridViewLockedLabel" CssClass="AccountAdminGridViewText" Text='<%# Eval("IsLockedOut").ToString() == "False" ? "Okay" : "LOCKED" %>' runat="server" />
                                </p>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Admin">
                            <ItemTemplate>
                                <p class="AccountAdminGridViewTextPanel">
                                    <asp:Label ID="GridViewAdminLabel" CssClass="AccountAdminGridViewText" Text='<%# Roles.IsUserInRole(Eval("UserName").ToString(), "Admin") == false ? "" : "YES" %>' runat="server" />
                                </p>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Restricted">
                            <ItemTemplate>
                                <p class="AccountAdminGridViewTextPanel">
                                    <asp:Label ID="GridViewRestrictedLabel" CssClass="AccountAdminGridViewText" Text='<%# Roles.IsUserInRole(Eval("UserName").ToString(), "Restricted") == false ? "" : "YES" %>' runat="server" />
                                </p>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle CssClass="AccountAdminGridViewRow" />
                    <AlternatingRowStyle CssClass="AccountAdminGridViewAltRow" />
                    <SelectedRowStyle CssClass="AccountAdminGridViewSelectedRow" />
                    <HeaderStyle CssClass="AccountAdminGridViewHeader" />
                    <EmptyDataTemplate>
                        <asp:Label ID="EmptyDataLabel" Text="You have reached the end of the user list." runat="server"></asp:Label>
                    </EmptyDataTemplate>
                </asp:GridView>
            </asp:TableCell>

        </asp:TableRow>

        <asp:TableRow runat="server" ID="AccountAdminTableRow2">
            <asp:TableCell ID ="AccountAdminTableRow3Cell1" runat="server">
                <asp:Button ID="LeftButton" CssClass="AccountAdminButtons" OnCommand="LeftButtonClick" runat="server" Text="<" />
            </asp:TableCell>

            <asp:TableCell ID ="AccountAdminTableRow3Cell2" runat="server">
                
            </asp:TableCell>

            <asp:TableCell ID ="AccountAdminTableRow3Cell3" runat="server">
                
            </asp:TableCell>

            <asp:TableCell ID ="AccountAdminTableRow3Cell4" runat="server">
                
            </asp:TableCell>

            <asp:TableCell ID ="AccountAdminTableRow3Cell5" runat="server">
                <asp:Button ID="RightButton" CssClass="AccountAdminButtons" OnCommand="RightButtonClick" runat="server" Text=">" />
            </asp:TableCell>

        </asp:TableRow>

        <asp:TableRow runat="server" ID="AccountAdminTableRow3">

            <asp:TableCell ID="AccountAdminTableRow2Cell1" runat="server">
                <asp:Panel runat="server" ID="SpacerPanel1" Height="50px"></asp:Panel>
            </asp:TableCell>

        </asp:TableRow>

        <asp:TableRow runat="server" ID="AccountAdminTableRow4">
            <asp:TableCell ID ="AccountAdminTableRow4Cell1" runat="server">
                <asp:Button ID="ToggleUserAdminButton" CssClass="AccountAdminButtons" OnCommand="ToggleUserAdminButtonClick" runat="server" Text="Toggle Admin" />
            </asp:TableCell>

            <asp:TableCell ID ="AccountAdminTableRow4Cell2" runat="server">
                <asp:Button ID="ToggleUserRestrictedButton" CssClass="AccountAdminButtons" OnCommand="ToggleUserRestrictedButtonClick" runat="server" Text="Toggle Restricted" />
            </asp:TableCell>

            <asp:TableCell ID ="AccountAdminTableRow4Cell3" runat="server">
                <asp:Button ID="UnlockUserButton" CssClass="AccountAdminButtons" OnCommand="UnlockUserButtonClick" runat="server" Text="Unlock Account" />
            </asp:TableCell>

            <asp:TableCell ID ="AccountAdminTableRow4Cell4" runat="server">
                <asp:Panel runat="server" ID="SpacerPanel2" Width="50px"></asp:Panel>
            </asp:TableCell>

            <asp:TableCell ID ="AccountAdminTableRow4Cell5" runat="server">
                <asp:Button ID="DeleteUserButton" CssClass="AccountAdminButtons" OnCommand="DeleteUserButtonClick" runat="server" Text="Delete User" />
            </asp:TableCell>

        </asp:TableRow>

    </asp:Table>

</asp:Panel>

<br />

<asp:RoundedCornersExtender ID="AccountAdminErrorRoundedCornersExtender" runat="server" TargetControlID="AccountAdminErrorPanel" />
<asp:DropShadowExtender ID="AccountAdminErrorRoundedCornersExtended" runat="server" TargetControlID="AccountAdminErrorPanel" />
<asp:Panel CssClass="AccountAdminErrorPanel" ID="AccountAdminErrorPanel" runat="server" Width="600px">
    <asp:LoginName CssClass="AccountAdminErrorText" ID="ErrorLabel" runat="server" FormatString="Welcome, {0}." />
</asp:Panel>
