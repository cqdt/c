<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Consulting.ascx.cs" Inherits="Modules_Consulting" %>
<%@ Register Src="Base/POST_FAQ.ascx" TagName="POST_FAQ" TagPrefix="uc2" %>
<%@ Register Src="Base/FAQ.ascx" TagName="FAQ" TagPrefix="uc1" %>
<%@ Register Src="Controls/Search-hd.ascx" TagName="Search" TagPrefix="uc3" %>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td height="300" align="center" valign="top" background="Images/Index2_52.jpg" style="background-repeat:no-repeat">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left" height="42" class="title_box" background="Images/Index2_21.png">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>Tư vấn</td>
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
                            <td align="left" height="40" valign="top">
                                <uc3:Search ID="searchhd" runat="server" />
                            </td>
                            <td width="20px">&nbsp;</td>
                        </tr>
                        <tr>
                            <td width="20px">&nbsp;</td>
                            <td align="left"><uc1:FAQ ID="FAQ1" runat="server" Type="Consulting" /></td>
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

