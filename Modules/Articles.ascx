<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Articles.ascx.cs" Inherits="Modules_Articles" %>
<%@ Register Src="Base/BArticles.ascx" TagName="BArticles" TagPrefix="uc3" %>
<%@ Register Src="Base/Articles.ascx" TagName="Articles" TagPrefix="uc1" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %>
<%@ Register Src="BDS/ListNewsArticles.ascx" TagName="ListNewsArticles" TagPrefix="uc2" %>


 <asp:Panel ID="pnParent" runat="server">
    <uc2:ListNewsArticles ID="ListNewsArticles1" MenuID="1" runat="server" />
</asp:Panel>
 <asp:Panel ID="pnMenu" runat="server">
 
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td align="center" valign="top" background="Images/Index2_52.jpg" style="background-repeat:no-repeat">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left" height="42" class="title_box" background="Images/Index2_21.png">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td><%= Articles1.Title%></td>
                            </tr> 
                            <tr>
                                <td height="10">&nbsp;</td>
                            </tr>                            
                        </table>                        
                </td>
              </tr>
              <tr>
                <td background="Images/Index2_24.png" valign="top" align="left">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="20px">&nbsp;</td>
                            <td><uc1:Articles ID="Articles1" IsParent="true" OnPageIndexChange="Articles1_PageIndexChange" Count="10" runat="server" /></td>
                            <td width="20px">&nbsp;</td>
                        </tr>                                                 
                    </table>
                     
                </td>
              </tr>
              <tr>
                <td height="21" background="Images/Index2_31.png">&nbsp;</td>
              </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="53" background="Images/Index2_40.gif">&nbsp;</td>
                  </tr>
                  <tr>
                    <td height="76" background="Images/Index2_44.gif" valign="top" align="left">
                        <uc3:BArticles ID="BArticles1" Type="HOME" Count="10" runat="server"/> 
                    </td>
                  </tr>
                  <tr>
                    <td height="57" background="Images/Index2_47.jpg">&nbsp;</td>
                  </tr>
                </table>
        </td>
    </tr>
</table>
 
 </asp:Panel>
