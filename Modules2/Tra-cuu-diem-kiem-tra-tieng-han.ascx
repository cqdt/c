<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Tra-cuu-diem-kiem-tra-tieng-han.ascx.cs" Inherits="Modules_Tra_cuu_diem_kiem_tra_tieng_han" %>
<%@ Register Src="Base/List-dang-ky-kiem-tra-tieng-han.ascx" TagName="List" TagPrefix="uc2" %>
<%@ Register Src="Controls/Search-dk.ascx" TagName="Searchdk" TagPrefix="uc1" %>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td height="300" align="center" valign="top" background="Images/Index2_52.jpg" style="background-repeat:no-repeat">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left" height="42" class="title_box" background="Images/Index2_21.png"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td>Tra cứu điểm</td>
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
                                  Bạn hãy điền đủ thông tin: Số báo danh, họ tên                 
                            </td>
                            <td width="20px">&nbsp;</td>
                        </tr>
                        <tr>
                            <td width="20px">&nbsp;</td>
                            <td align="center">                           
                                   <uc1:Searchdk ID="Searchdk1" runat="server" />                   
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