<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Article.ascx.cs" Inherits="Modules_Base_Article" %>


<asp:DataList ID="dlArticle" runat="server" HorizontalAlign="Center" Width="99%" CaptionAlign="Top">
    <ItemTemplate>  
      <table width="100%" cellpadding="0" cellspacing="0" align="center">
      
      <% if (IsTitle)
         {%>
        <tr>
           <td align="left">
           	  <a class="tieu_de_tin"><%# Eval("C_TITLE")%></a>	
           </td>
        </tr>
        <%} %>
        
				<tr>
					<td align="left" style="vertical-align: top;text-align:justify;" valign="top">
					
					  <% if (IsImage)
          {%>
						<table align="left" border="0" cellpadding="3" cellspacing="0" width="1">
							<tr>
								<td align="left" style="padding-right:5px">
									<%# CMS.TTV.Web.Utils.CreateLink(Eval("C_IMAGE_FILE_NAME"), 200, ImageHeigth, 0, "cms_images", true)%>
								</td>
							</tr>
							<tr>
								<td align="center">
									<span class="image_desc">
										<%# Eval("C_IMAGE_FILE_TITLE")%>
									</span>
								</td>
							</tr>
						</table>
						<%} %>
						
						  <% if (IsHead)
          {%>
						        <span class="story_teaser">
							        <%# Eval("C_HEAD")%>
						        </span>
						
						<%} %>
						
						<div style="text-align: justify;font-weight:normal">
							<%# Eval("C_CONTENT")%>
						</div>
					</td>
				</tr>
			
			</table>
    </ItemTemplate>
</asp:DataList>