<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Banner.ascx.cs" Inherits="Modules_Base_Banner" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td align="center">
            <% if(Url!="") {%> 
            <a href="<%= Url %>" target="_blank">
            <%= CMS.TTV.Web.Utils.CreateLink(Image_Url, ImageWidth, ImageHeight, 0, "", true)%></a>
            <%} else {%> 
            <%= CMS.TTV.Web.Utils.CreateLink(Image_Url, ImageWidth, ImageHeight, 0, "", true)%>
            <%}%>        
        </td>
    </tr>
</table>

