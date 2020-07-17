<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Top1NewsArtile.ascx.cs" Inherits="Modules_BDS_Top1NewsArtile" %>
<%@ Register Src="../Base/Top1News.ascx" TagName="Top1News" TagPrefix="uc1" %>
<%@ Register Src="../Base/BArticles.ascx" TagName="BArticles" TagPrefix="uc2" %>
<table border="0" cellpadding="1" cellspacing="1" width="100%">
    <tr>
        <td height="43" background="images/Index_05_02.jpg" valign="bottom">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>   
                            <td width="75">&nbsp;</td>                            
                                <td height="20" valign="top" align="left">
                             <span class="sanphammoi">   <a class="sanphammoi" href="Default.aspx?ctl=Articles&mID=<%= Top1News1._iMenuID %>">    <%= Top1News1.Title %></a></span>
                                </td>                               
                            </tr>
                        </table>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td background="images/Index_05_01.jpg" style="background-repeat:repeat-y">
            <uc1:Top1News ID="Top1News1" Type="Articles" IsParent="true" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td background="images/dot_line.gif">
                        <img height="1" src="images/dot_line.gif" width="3" /></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <uc2:BArticles ID="BArticles1" Count="3" IsParent="true" runat="server" />
        </td>
    </tr>
</table>
