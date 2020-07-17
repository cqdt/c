<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Search.ascx.cs" Inherits="Modules_Search" %>
<%@ Register Src="Base/Articles.ascx" TagName="Articles" TagPrefix="uc2" %>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td align="center" valign="top" background="Images/Index2_52.jpg" style="background-repeat:no-repeat">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left" height="42" class="title_box" background="Images/Index2_21.png">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>Kết quả tìm kiếm cho từ [<font class="cms_search"> <%=strSearch%></font> ]</td>
                            </tr> 
                            <tr>
                                <td height="10">&nbsp;</td>
                            </tr>                            
                        </table>
                        
                </td>
              </tr>
              <tr>
                <td background="Images/Index2_24.png" style="background-repeat:repeat-y" valign="top" align="left">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="20px">&nbsp;</td>
                            <td align="left"><uc2:Articles ID="Articles1" IsParent="true" runat="server" /></td>
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
</table>
