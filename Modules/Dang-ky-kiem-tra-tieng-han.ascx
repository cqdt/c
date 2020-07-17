<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Dang-ky-kiem-tra-tieng-han.ascx.cs" Inherits="Modules_Dang_ky_kiem_tra_tieng_han" %>
<%@ Register Src="Base/Dang-ky-kiem-tra-tieng-han.ascx" TagName="Dangky" TagPrefix="uc1" %>
<%@ Register Src="Base/Article.ascx" TagName="Article" TagPrefix="uc2" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td height="300" align="center" valign="top" background="Images/Index2_52.jpg" style="background-repeat:no-repeat">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left" height="42" class="title_box" background="Images/Index2_21.png"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td>Đăng ký kiểm tra tiếng Hàn</td>
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
                            <td width="20px">&nbsp;</td>
                            <td align="center">                           
                                  <uc2:Article ID="Huongdan1" ArticleID="354" AutoLang="true" runat="server" />              
                            </td>
                            <td width="20px">&nbsp;</td>
                        </tr>    
                        <tr>
                            <td height="10" width="20px">&nbsp;</td>
                            <td align="center">                           
                                 
                            </td>
                            <td width="20px">&nbsp;</td>
                        </tr>     
                        <tr>
                            <td width="20px">&nbsp;</td>
                            <td align="center">                           
                                  <uc1:Dangky ID="Dangky1" runat="server" />               
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