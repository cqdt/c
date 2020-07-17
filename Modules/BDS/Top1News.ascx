<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Top1News.ascx.cs" Inherits="Modules_BDS_Top1News" %>
<%@ Register Src="../Base/Top1News.ascx" TagName="Top1News" TagPrefix="uc1" %>
<%@ Register Src="../Base/BArticles.ascx" TagName="BArticles" TagPrefix="uc2" %>
<table width="100%" border="0" cellspacing="1" cellpadding="1">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="10"><img src="images/home_title_l.jpg" width="10" height="19" /></td>
        <td background="images/home_title_c.jpg" class="title_box1">&nbsp;<%= Top1News1.Title %></td>
        <td width="10"><img src="images/home_title_r.jpg" width="10" height="19" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><uc1:Top1News ID="Top1News1" IsParent="true" runat="server" />
    </td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td background="images/dot_line.gif"><img src="images/dot_line.gif" width="3" height="1" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>
       <uc2:BArticles ID="BArticles1" Count="3" IsParent="true" runat="server" />
    </td>
  </tr>
</table>