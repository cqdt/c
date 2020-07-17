<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Tu-nghiep-sinhs.ascx.cs" Inherits="Modules_Base_Tu_nghiep_sinhs" %>
 <asp:GridView id="gvArticles" runat="server" GridLines="Both" ShowHeader="true" Width="94%" SkinID="Cart"
		AutoGenerateColumns="False" AllowPaging="true" HorizontalAlign="Center" CaptionAlign="Top" PageSize="10">
		<Columns>
				<asp:TemplateField ShowHeader="true" HeaderText="Họ tên">
					 <ItemTemplate>		
					        <table width="100%" border="0" cellspacing="0" cellpadding="0">
					            <tr>
					                <td width="20"></td>					                
					                <td>
					                   <a class="tintuyendung" href="Default.aspx?ctl=Tu-nghiep-sinh&hID=<%# Eval("PK_TNS")%>"><%# Eval("C_HO_TEN")%>		</a>			                
					                </td>
					            </tr>					            
					        </table>					
					 </ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField ShowHeader="true" HeaderText="Ngày sinh">
					 <ItemTemplate>		
					        <table width="100%" border="0" cellspacing="0" cellpadding="0">
					            <tr>	                
					                 <td>
					                   <%# Eval("C_NGAY_SINH","{0:dd/MM/yyyy}")%>	                
					                </td>
					            </tr>					            
					        </table>					
					 </ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField ShowHeader="true" HeaderText="Giới tính">
					 <ItemTemplate>		
					        <table width="100%" border="0" cellspacing="0" cellpadding="0">
					            <tr>	                
					                 <td>
					                   <%# Eval("C_GIOI_TINH")%>	                
					                </td>
					            </tr>					            
					        </table>					
					 </ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField ShowHeader="true" HeaderText="Nghề nghiệp">
					 <ItemTemplate>		
					        <table width="100%" border="0" cellspacing="0" cellpadding="0">
					            <tr>	                
					                 <td>
					                   <%# Eval("C_NGHE_NGHIEP")%>	                
					                </td>
					            </tr>					            
					        </table>					
					 </ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField ShowHeader="true" HeaderText="Địa chỉ">
					 <ItemTemplate>		
					        <table width="100%" border="0" cellspacing="0" cellpadding="0">
					            <tr>	                
					                 <td>
					                   <%# Eval("C_DIA_CHI")%>	                
					                </td>
					            </tr>					            
					        </table>					
					 </ItemTemplate>
				</asp:TemplateField>
		</Columns>
</asp:GridView> 