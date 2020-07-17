<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menus.ascx.cs" Inherits="Modules_Base_Menus" %>

<asp:DataList ID="dlMenus" runat="server" Width="100%" CellPadding="0" CellSpacing="0" >
    <ItemTemplate>
      <a href="Default.aspx?ctl=<%= Module_Detail %>&mID=<%# Eval("PK_MENU") %>" class="leftmenu"><%# Eval("C_NAME") %></a>     
    </ItemTemplate>
</asp:DataList>