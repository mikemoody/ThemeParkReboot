<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ParksDatabaseAdmin.aspx.cs" Inherits="ThemePark.ParksDatabaseAdmin" %>

<%@ Register Src="~/Database Administration.ascx" TagPrefix="uc1" TagName="DatabaseAdministration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <uc1:DatabaseAdministration runat="server" id="DatabaseAdministration" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
