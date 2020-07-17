<%@ Control Language="C#" AutoEventWireup="true" CodeFile="List-dang-ky-kiem-tra-tieng-han.ascx.cs" Inherits="Modules_Base_List_dang_ky_kiem_tra_tieng_han" %>
<asp:GridView id="gvArticles" runat="server" GridLines="None" ShowHeader="false" Width="100%" SkinID="Tracuudiemkiemtratienghan"
		AutoGenerateColumns="False" AllowPaging="false" HorizontalAlign="Center" CaptionAlign="Top" PageSize="5">
		<Columns>
				<asp:TemplateField ShowHeader="False">
					 <ItemTemplate>		<center>			
							<table width="80%" border="0" cellspacing="1" cellpadding="1" bgcolor="#97978f">
								<tr>								
									 <td class="nentd" width="120">Họ tên  </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     								<b>	<%# Eval("C_HO_TEN")%></b>
									 </td>
								 </tr>	
								 <tr>								
									 <td class="nentd" width="120">Số báo danh  </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     								<b>	<%# Eval("C_SBD")%></b>
									 </td>
								 </tr>
								  <tr>								 
									 <td class="nentd">Số CMND  </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     									<%# Eval("C_CMND")%>
									 </td>
								 </tr>	
								  <tr>								  
									 <td class="nentd">Ngành đăng ký  </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     									<%# Eval("C_NGANH")%>
									 </td>
								 </tr>	
								  <tr>								  
									 <td class="nentd">Điểm đọc  </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     								<b>	<%# Eval("C_DIEM_DOC")%></b>
									 </td>
								 </tr>			
								 <tr>								  
									 <td class="nentd">Điểm nghe  </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     								<b>	<%# Eval("C_DIEM_NGHE")%></b>
									 </td>
								 </tr>							 																	 
								   <tr>								  
									 <td class="nentd">Trạng thái  </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     								<b>	<%# Eval("C_TRANGTHAI")%></b>
									 </td>
								 </tr>	
							</table>	
							</center>						
					 </ItemTemplate>
				</asp:TemplateField>
		</Columns>
</asp:GridView> 