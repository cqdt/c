<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Gallerys.ascx.cs" Inherits="Modules_Base_Gallerys" %>
<asp:DataList ID="dlListTopNews" RepeatColumns="1" runat="server" HorizontalAlign="Center" Width="97%" CaptionAlign="Top">
         <ItemTemplate>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0"> 
                  <tr>
                    <td align="center">                   
                   
                       <%# CMS.TTV.Web.Utils.CreateLink(Eval("C_FILE"), 150, 110, 0, "cms_images1", true)%>                        
                      
                    </td>               
                  </tr>
                  
                </table>
         </ItemTemplate>         
 </asp:DataList>
 <br />
 <br />
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td align="left" style="padding-left:20px">
                <% if (Count<0)
            { %> 
 
        <%= strHtmlPage %>
   
     <%} %>       
        </td>
    </tr>
 </table>
 