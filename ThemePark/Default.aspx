<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" Theme="Skin1" CodeBehind="Default.aspx.cs" Inherits="ThemePark._Default" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">1
    <h3>On Theme Park Review you can:</h3>
    <ol class="round">
        <li class="one">
            <h5>Login and view your rides</h5>
            With a safe Login you can view your pre-viewed rides</li>
        <li class="two">
            <h5>Read Reviews of other peoples Sites</h5>
        </li>
        <li class="three">
            <h5>See Pictures and sort on details of all your favorite rides</h5>
            <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </p>
            <h3>Click Login Below to Get Started:</h3>
            <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </p>
        </li>
    </ol>
    <h3><asp:Button ID="Button1" runat="server" BackColor="Red" Font-Names="Impact" Font-Size="X-Large" Text="Login" Width="399px" />
        <asp:ImageMap ID="ImageMap2" runat="server" Width="16px">
        </asp:ImageMap>
</h3>
    <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <asp:XmlDataSource ID="XmlDataSource1" runat="server"></asp:XmlDataSource>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server">
        </asp:EntityDataSource>


    </h5>
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="HeadContent">
</asp:Content>

