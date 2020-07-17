<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Tim-viecs.ascx.cs" Inherits="Modules_Base_Tim_viecs" %>
 <asp:GridView id="gvArticles" runat="server" GridLines="Both" ShowHeader="true" Width="94%" SkinID="Cart"
		AutoGenerateColumns="False" AllowPaging="true" HorizontalAlign="Center" CaptionAlign="Top" PageSize="10">
		<Columns>
				<asp:TemplateField ShowHeader="true" HeaderText="Tên hồ sơ">
					 <ItemTemplate>		
					        <table width="100%" border="0" cellspacing="0" cellpadding="0">
					            <tr>
					                <td width="20"></td>					                
					                <td>
					                   <a class="tintuyendung" href="Default.aspx?ctl=Chi-tiet-ho-so&hID=<%# Eval("PK_TIM_VIEC")%>"><%# Eval("C_TITLE")%>		</a>			                
					                </td>
					            </tr>					            
					        </table>					
					 </ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField ShowHeader="true" HeaderText="Tên ứng viên">
					 <ItemTemplate>		
					        <table width="100%" border="0" cellspacing="0" cellpadding="0">
					            <tr>	                
					                 <td>
					                   <%# Eval("C_HO_TEN")%>	                
					                </td>
					            </tr>					            
					        </table>					
					 </ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField ShowHeader="true" HeaderText="Kinh nghiệm">
					 <ItemTemplate>		
					        <table width="100%" border="0" cellspacing="0" cellpadding="0">
					            <tr>	                
					                 <td>
					                   <%# Eval("C_KINH_NGHIEM")%>	                
					                </td>
					            </tr>					            
					        </table>					
					 </ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField ShowHeader="true" HeaderText="Ngày đăng">
					 <ItemTemplate>		
					        <table width="100%" border="0" cellspacing="0" cellpadding="0">
					            <tr>	                
					                 <td>
					                   <%# Eval("C_NGAY_DANG","{0:dd/MM/yyyy}")%>	                
					                </td>
					            </tr>					            
					        </table>					
					 </ItemTemplate>
				</asp:TemplateField>
		</Columns>
</asp:GridView> 