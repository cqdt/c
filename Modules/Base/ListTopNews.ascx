<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ListTopNews.ascx.cs" Inherits="Modules_Base_ListTopNews" %>
 <asp:DataList ID="dlListTopNews" runat="server" HorizontalAlign="Center" Width="97%" CaptionAlign="Top">
         <ItemTemplate>
          
             <table width="100%" border="0" cellspacing="0" cellpadding="0" align="left">
	               <tr>				
					
					 <td class="text" valign="top">
                    
					<table align="left" border="0"  cellspacing="0" width="1">
						<tr>
							<td align="left" style="padding-right:2px">
								<a href="Default.aspx?ctl=<%= Module_Detail %>&aID=<%# Eval("PK_ARTICLE")%>"><%# CMS.TTV.Web.Utils.CreateLink(Eval("C_IMAGE_FILE_NAME"), 164, 0, 0, "cms_images", true)%></a>
							</td>
							
						</tr>						
					</table>                  
                    					
						
						      						
					</td>
					<td align="left" valign="top" style="padding-top:2px">
					    <a class="tintuc"  href="Default.aspx?ctl=<%= Module_Detail %>&aID=<%# Eval("PK_ARTICLE")%>" ><%# Eval("C_TITLE")%></a>
                            
                   <br />
                  
                     <span class="head">	       
                      <%# CMS.TTV.Web.Utils.Cut(Eval("C_HEAD"),200)%>     </span>		     
                                     
					</td>
				</tr>			
	              	               
	               </table>	        
               
                
         </ItemTemplate>         
 </asp:DataList>