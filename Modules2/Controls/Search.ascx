<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Search.ascx.cs" Inherits="Modules_Controls_Search" %>
<asp:Panel ID="pnSearchBDS" DefaultButton="btnSearch" runat="server">
    <asp:TextBox ID="txtSearch" runat="server" CssClass="texbox4"></asp:TextBox>
    <asp:ImageButton ID="btnSearch" ImageUrl="~/Images/search.png" CssClass="btnSearch"
        BorderWidth="0" OnClick="btnSearch_Click" runat="server" ToolTip="Tìm kiếm" />
</asp:Panel>
