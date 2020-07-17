<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdvHome.ascx.cs" Inherits="Modules_BDS_AdvHome" %>
<asp:DataList ID="dlAdv" runat="server" HorizontalAlign="Center" Width="100%" CaptionAlign="Top">
    <ItemTemplate> 
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="48"><%# TTV.Utils.CreateLink(CMS.TTV.Web.Utils.CreateLink(Eval("C_IMAGE_FILE_NAME"), 38, 26, 0, "pic_l", true), Eval("C_LINK"))%></td>
              <td width="800"><%# Eval("C_NAME")%></td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>