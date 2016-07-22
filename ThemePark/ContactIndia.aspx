<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" Culture="kn-IN" AutoEventWireup="true" CodeBehind="ContactIndia.aspx.cs" Inherits="ThemePark.ContactIndia" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        
        <h2>Theme Park Contact Page</h2>
     
    </hgroup>


    <section class="contact">
        <header>
               
            <h3>Phone:</h3>
        </header>
        <p>
            <span class="label">Main:</span>
            <span>123.555.0100</span>
        </p>

    </section>

    <section class="contact">
        <header>
            <h3>Email:</h3>
        </header>
        <p>
            <span class="label">Theme Park Support:</span>
            <span><a href="mailto:themeparkreview@yahoo.com">Themeparkreview@yahoo.com</a></span>
        </p>

    </section>

    <section class="contact">
        <header>
            <h3>Address:</h3>
        </header>
        <p>
            One Theme Park Way<br />
            Columbus, GA 90210
        </p>
    </section>

    <!DOCTYPE html>
<html>
<head>
    <title>Contact Theme Park Site for Assistance</title>
</head>
<body>
  <h2>
      <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Contact.aspx" >I am from USA, Change Globalization Here!</asp:HyperLink>
      <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" ShowGridLines="True" Width="220px">
          <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
          <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
          <OtherMonthDayStyle ForeColor="#CC9966" />
          <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
          <SelectorStyle BackColor="#FFCC66" />
          <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
          <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
      </asp:Calendar>
      Submit Email Request for Assistance</h2>
  <form method="post" action="ProcessRequest.cshtml">
    <div>
        Your Name:
        <input type="text" name="customerName" />
    </div>

    <div>
        Your email address:
        <input type="text" name="customerEmail" />
    </div>

    <div>
        Please describe how we can help you at the Theme Park Site: <br />
        <textarea name="customerRequest" cols="45" rows="4"></textarea>
    </div>

    <div>
        <input type="submit" value="Submit" />
    </div>
  </form>
</body>
</html>



        <asp:AdRotator ID="AdRotator1" runat="server" DataSourceID="XMLFile1" />


        <asp:XmlDataSource ID="XMLFile1" runat="server" DataFile="XMLFile1.xml"></asp:XmlDataSource>

    </asp:Content>