<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ListMenuProducts.ascx.cs" Inherits="Modules_Base_ListMenuProducts" %>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>      
            <asp:DataList ID="dlListProducts" runat="server" HorizontalAlign="Center" Width="100%" CaptionAlign="Top">
                 <ItemTemplate>  
                                                          
                        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                        <tr>
                        <td><a href="Default.aspx?ctl=<%= Module_Detail %>&mID=<%# Eval("PK_MENU")%>">
							      <%# CMS.TTV.Web.Utils.CreateLink(Eval("C_IMAGE_FILE_NAME"), 183, 0, 0, "", false)%></a></td>
                         </tr>
                          <tr>
                            <td height="3"><img src="images/Trang_chu_25.gif" width="182" height="3"></td>
                          </tr>                            
                             
                            
                      </table>
                         
                         
                 </ItemTemplate>         
            </asp:DataList>  

        </td>
    </tr>
</table>       