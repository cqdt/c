<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Articles.ascx.cs" Inherits="Modules_Base_Articles" %>
            
   <asp:GridView id="gvArticles" runat="server" GridLines="None" 
    ShowHeader="false" Width="100%"
		AutoGenerateColumns="False" AllowPaging="False" HorizontalAlign="Center" 
    CaptionAlign="Top" PageSize="5" style="margin-bottom: 0px">
		<Columns>
				<asp:TemplateField ShowHeader="False">
					 <ItemTemplate>					
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									 <td colspan="2" style="vertical-align:top;" valign="top" align="left">     									
     									<a class="tieu_de_tin" href='<%# Newwind.VQS.GetURL("tin-tuc", Eval("C_TITLE").ToString(), Eval("PK_ARTICLE")) %>'><%# Replace(Eval("C_TITLE"))%></a>
									 </td>
								 </tr>
								 <tr>
									 <td width="1" style="vertical-align:text-top" valign="top" align="left">
											<a href='<%# Newwind.VQS.GetURL("tin-tuc", Eval("C_TITLE").ToString(), Eval("PK_ARTICLE")) %>'> <%# CMS.TTV.Web.Utils.CreateLink(Eval("C_IMAGE_FILE_NAME"), 120, 0, 0, "imgnews", true)%></a>
									 </td>
									 <td style="text-align:justify;" valign="top" align="left">
													<%# Replace(Eval("C_HEAD"))%>
									 </td>
								 </tr>											
							</table>							
					 </ItemTemplate>
				</asp:TemplateField>
		</Columns>
		 <PagerStyle CssClass="Gird_Page" />
</asp:GridView> 
  <br />
                       <div style="text-align:left;float:left;display:inline;padding:7px;">
                        <%= strHtmlPage %>
                     </div>     

              


