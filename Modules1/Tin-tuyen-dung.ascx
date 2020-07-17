<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Tin-tuyen-dung.ascx.cs" Inherits="Modules_Tin_tuyen_dung" %>
<%@ Register Src="Base/Tin-tuyen-dung.ascx" TagName="Tintuyendung" TagPrefix="uc1" %>
<%@ Register Src="Base/Tuyen-dungs.ascx" TagName="Tuyendung" TagPrefix="uc2" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td height="300" align="center" valign="top" background="Images/Index2_52.jpg" style="background-repeat:no-repeat">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left" height="42" class="title_box" background="Images/Index2_21.png"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td>Chi tiết việc làm tuyển dụng</td>
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
                                  <uc1:Tintuyendung ID="Tintuyendung1" runat="server" />            
                            </td>
                            <td width="20px">&nbsp;</td>
                        </tr>  
                        
                        <tr>
                            <td width="20px">&nbsp;</td>
                            <td align="left"  class="div_footer_notify">                           
                                     Tin tuyển dụng khác  
                            </td>
                            <td width="20px">&nbsp;</td>
                        </tr> 
                          <tr>
                            <td width="20px">&nbsp;</td>
                            <td align="center">                           
                                  <uc2:Tuyendung ID="Tuyendung2" runat="server" />      
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