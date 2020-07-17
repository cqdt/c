<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Tu-nghiep-sinh.ascx.cs" Inherits="Modules_Tu_nghiep_sinh" %>
<%@ Register Src="Base/Tu-nghiep-sinh.ascx" TagName="Tunghiepsinh" TagPrefix="uc1" %>
<%@ Register Src="Base/Tu-nghiep-sinhs.ascx" TagName="Tunghiepsinhs" TagPrefix="uc2" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td height="300" align="center" valign="top" background="Images/Index2_52.jpg" style="background-repeat:no-repeat">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left" height="42" class="title_box" background="Images/Index2_21.png"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td>Chi tiết thông tin tu nghiệp sinh</td>
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
                                <uc1:Tunghiepsinh ID="Tunghiepsinh1" runat="server" />           
                            </td>
                            <td width="20px">&nbsp;</td>
                        </tr>  
                        
                        <tr>
                            <td width="20px">&nbsp;</td>
                            <td align="left"  class="div_footer_notify">                           
                                     Danh sách tu nghiệp sinh khác
                            </td>
                            <td width="20px">&nbsp;</td>
                        </tr> 
                          <tr>
                            <td width="20px">&nbsp;</td>
                            <td align="center">                           
                               <uc2:Tunghiepsinhs id="Tunghiepsinhs1" runat="server" />       
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