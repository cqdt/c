<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Danh-sach-diem-kiem-tra-tay-nghe.ascx.cs" Inherits="Modules_Base_Danh_sach_diem_kiem_tra_tay_nghe" %>
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
									 <td class="nentd" width="120">Số báo danh : </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     									<b><%# Eval("C_SBD")%></b>
									 </td>
								 </tr>								 
								 <tr>								 
									 <td class="nentd">Ngày sinh : </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     									<%# Eval("C_NGAYSINH", "{0:dd/MM/yyyy}")%>
									 </td>
								 </tr>
								 <tr>								 
									 <td class="nentd">Ngành : </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     									<%# Eval("C_NGANH")%>
									 </td>
								 </tr>	
								 <tr>								 
									 <td class="nentd">Nghề : </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     									<%# Eval("C_NGHE")%>
									 </td>
								 </tr>	
								  <tr>								 
									 <td class="nentd">Ngày kiểm tra : </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     									<%# Eval("C_NGAYKT", "{0:dd/MM/yyyy}")%>
									 </td>
								 </tr>	
								 <tr>								 
									 <td class="nentd">Điểm tay nghề : </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     									<%# Eval("C_DIEM_TAY_NGHE")%>
									 </td>
								 </tr>	
								 <tr>								 
									 <td class="nentd">Điểm thể lực : </td> 
									 <td height="20" valign="middle" align="left" class="nentd">
     									<%# Eval("C_DIEM_THE_LUC")%>
									 </td>
								 </tr>	
								  <tr>								  
									 <td class="nentd">Điểm kinh nghiệm và phỏng vấn : </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     									<%# Eval("C_DIEM_KN_PV")%>
									 </td>
								 </tr>	
								  <tr>								  
									 <td class="nentd">Tổng điểm : </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     									<%# Eval("C_TONG")%>
									 </td>
								 </tr>
								  <tr>								  
									 <td class="nentd">Xếp loại : </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     									<%# Eval("C_XEPLOAI")%>
									 </td>
								 </tr>
								
							</table>	</center>						
					 </ItemTemplate>
				</asp:TemplateField>
		</Columns>
</asp:GridView> 