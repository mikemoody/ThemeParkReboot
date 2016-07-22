<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebUserControl1.ascx.cs" Inherits="ThemePark.WebUserControl1" %>


<table style="width:100%;">
    <tr>
        <td>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="ParkDropDown" DataTextField="ParkName" DataValueField="ParkID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="ParkDropDown" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSQL mdf string %>" SelectCommand="SELECT [ParkID], [ParkName] FROM [Park]"></asp:SqlDataSource>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="RideID" DataSourceID="RidesGridView">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="RideName" HeaderText="Ride Name" SortExpression="RideName" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:CheckBoxField DataField="SafeForKids" HeaderText="Safe For Kids?" SortExpression="SafeForKids" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CheckBoxField>
                    <asp:BoundField DataField="RideTypeText" HeaderText="Ride Type" SortExpression="RideTypeText" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="MinHeightInInches" HeaderText="Minimum Height (In)" SortExpression="MinHeightInInches" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="MinAgeInYears" HeaderText="Minimum Age (Years)" SortExpression="MinAgeInYears" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="RideScore" HeaderText="Ride Score" SortExpression="RideScore" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="RidesGridView" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSQL mdf string %>" SelectCommand="SELECT [RideID], [RideName], [SafeForKids], [RideScore], [MinHeightInInches], [MinAgeInYears], [RideTypeText] FROM [Ride] WHERE ([ParkID] = @ParkID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="ParkID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
        <td>
            &nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="ReviewTextLabel" runat="server" Text='<%# Eval("ReviewText") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ReviewScoreLabel" runat="server" Text='<%# Eval("ReviewScore") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:TextBox ID="ReviewTextTextBox" runat="server" Text='<%# Bind("ReviewText") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ReviewScoreTextBox" runat="server" Text='<%# Bind("ReviewScore") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table id="Table1" runat="server" style="">
                        <tr>
                            <td>No reviews available. Select a ride to see reviews.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>
                            <asp:TextBox ID="ReviewTextTextBox" runat="server" Text='<%# Bind("ReviewText") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ReviewScoreTextBox" runat="server" Text='<%# Bind("ReviewScore") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="ReviewTextLabel" runat="server" Text='<%# Eval("ReviewText") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ReviewScoreLabel" runat="server" Text='<%# Eval("ReviewScore") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table id="Table2" runat="server">
                        <tr id="Tr1" runat="server">
                            <td id="Td1" runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr id="Tr2" runat="server" style="">
                                        <th id="Th1" runat="server">Review</th>
                                        <th id="Th2" runat="server">Score</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr3" runat="server">
                            <td id="Td2" runat="server" style=""></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="ReviewTextLabel" runat="server" Text='<%# Eval("ReviewText") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ReviewScoreLabel" runat="server" Text='<%# Eval("ReviewScore") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSQL mdf string %>" SelectCommand="SELECT [ReviewText], [ReviewScore] FROM [Review] WHERE ([RideID] = @RideID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" DefaultValue="1000" Name="RideID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>