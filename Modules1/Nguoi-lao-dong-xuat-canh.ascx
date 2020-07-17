<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Nguoi-lao-dong-xuat-canh.ascx.cs" Inherits="Modules_Nguoi_lao_dong_xuat_canh" %>
<%@ Register Src="Base/List-nguoi-lao-dong-xc.ascx" TagName="List" TagPrefix="uc2" %>
<%@ Register Src="Controls/Search-xc.ascx" TagName="Searchld" TagPrefix="uc1" %>
<%@ Register Src="Base/Article.ascx" TagName="Article" TagPrefix="uc3" %>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td height="300" align="center" valign="top" background="Images/Index2_52.jpg" style="background-repeat:no-repeat">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left" height="42" class="title_box" background="Images/Index2_21.png"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td>Tìm kiếm thông tin</td>
                        </tr>
                         <tr>
                            <td height="10">&nbsp;</td>
                        </tr>
                    </table>
                                                           
                </td>
              </tr>
              <tr>
                <td background="Images/Index2_24.png" style="background-repeat:repeat-y" valign="top">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td height="40" width="20px">&nbsp;</td>
                            <td align="center">                           
                                  <uc3:Article ID="Huongdan1" ArticleID="354" AutoLang="true" runat="server" />                 
                            </td>
                            <td width="20px">&nbsp;</td>
                        </tr>
                        <tr>
                            <td width="20px">&nbsp;</td>
                            <td align="center">                           
                                   <uc1:Searchld ID="Searchld1" runat="server" />                   
                            </td>
                            <td width="20px">&nbsp;</td>
                        </tr>
                         <tr>
                            <td width="20px" height="20px">&nbsp;</td>
                            <td align="center">                         
                                     &nbsp;                
                            </td>
                            <td width="20px">&nbsp;</td>
                        </tr>
                        <tr>
                            <td width="20px">&nbsp;</td>
                            <td align="center">
                            
                            <uc2:List ID="List1" runat="server" />
                            
                            </td>
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