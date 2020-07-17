<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Chi-tiet-ho-so.ascx.cs" Inherits="Modules_Chi_tiet_ho_so" %>
<%@ Register Src="Base/Chi-tiet-ho-so.ascx" TagName="Chitieths" TagPrefix="uc1" %>
<%@ Register Src="Base/Tim-viecs.ascx" TagName="Timviec" TagPrefix="uc2" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td height="300" align="center" valign="top" background="Images/Index2_52.jpg" style="background-repeat:no-repeat">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left" height="42" class="title_box" background="Images/Index2_21.png"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td>Chi tiết hồ sơ</td>
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
                                <uc1:Chitieths ID="Chitieths1" runat="server" />           
                            </td>
                            <td width="20px">&nbsp;</td>
                        </tr>  
                        
                        <tr>
                            <td width="20px">&nbsp;</td>
                            <td align="left"  class="div_footer_notify">                           
                                     Hồ sơ khác  
                            </td>
                            <td width="20px">&nbsp;</td>
                        </tr> 
                          <tr>
                            <td width="20px">&nbsp;</td>
                            <td align="center">                           
                               <uc2:Timviec id="Timviecs1" runat="server" />       
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