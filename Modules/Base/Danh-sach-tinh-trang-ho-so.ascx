<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Danh-sach-tinh-trang-ho-so.ascx.cs" Inherits="Modules_Base_Danh_sach_tinh_trang_ho_so" %>
<%@ Register Src="Article.ascx" TagName="Article" TagPrefix="uc3" %>
<asp:GridView id="gvArticles" runat="server" GridLines="None" ShowHeader="false" Width="100%" SkinID="Tracuudiemkiemtratienghan"
		AutoGenerateColumns="False" AllowPaging="false" HorizontalAlign="Center" CaptionAlign="Top" PageSize="5">
		<Columns>
				<asp:TemplateField ShowHeader="False">
					 <ItemTemplate>		<center>			
							<table width="80%" border="0" cellspacing="1" cellpadding="1" bgcolor="#97978f">
								<tr>								
									 <td class="nentd" width="120">Họ tên : </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     								<b>	<%# Eval("C_HOTEN")%></b>
									 </td>
								 </tr>	
								 <tr>								
									 <td class="nentd" width="120">Mã số : </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     									<b><%# Eval("C_MASO")%></b>
									 </td>
								 </tr>								 
								 <tr>								 
									 <td class="nentd">Ngày sinh : </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     									<%# Eval("C_NGAYSINH", "{0:dd/MM/yyyy}")%>
									 </td>
								 </tr>
								 <tr>								 
									 <td class="nentd">Đơn vị : </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     									<%# Eval("C_DONVI")%>
									 </td>
								 </tr>	
								 <tr>								 
									 <td class="nentd">Tình trạng : </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     									<%# Eval("C_TINHTRANG")%>
									 </td>
								 </tr>	
								 
								 <tr>								 
									 <td class="nentd">Ghi chú : </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     									<%# Eval("C_GHICHU")%>
									 </td>
								 </tr>	
								
								
							</table>	</center>						
					 </ItemTemplate>
				</asp:TemplateField>
		</Columns>
</asp:GridView> 