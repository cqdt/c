<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Lang.ascx.cs" Inherits="Modules_Controls_Lang" %>


<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
 <td align="center" Width="50">
     <asp:LinkButton  ID="btnLang5" runat="server" CommandArgument="1" ToolTip="Vietnam" OnClick="btnLang5_Click" ForeColor="#FD8401">Tiếng Việt</asp:LinkButton>
   </td>
   <td Width="3" align="center">|</td>
    <td align="center" Width="50">
     <asp:LinkButton  ID="btnLang1" runat="server" CommandArgument="2" ToolTip="English" OnClick="btnLang1_Click" ForeColor="#FD8401">English</asp:LinkButton>
    </td>
 </tr>
</table>