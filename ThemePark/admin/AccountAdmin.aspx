<%@ Page Title="Theme Park Review - Account Administration" Language="C#" MasterPageFile="/Site.master" AutoEventWireup="true" CodeFile="AccountAdmin.aspx.cs" Inherits="admin_AccountAdmin" %>

<%@ Register Src="~/admin/AccountAdminUC.ascx" TagPrefix="uc1" TagName="AccountAdminUC" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    
    <uc1:AccountAdminUC runat="server" id="AccountAdminUC1" />
</asp:Content>

