<%@ Control Language="C#" AutoEventWireup="true" CodeFile="List-nguoi-lao-dong-xc.ascx.cs" Inherits="Modules_Base_List_nguoi_lao_dong_xc" %>
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
     								<b>	<%# Eval("C_HO_TEN")%></b>
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
     									<%# Eval("C_NGAY_SINH", "{0:dd/MM/yyyy}")%>
									 </td>
								 </tr>
								 <tr>								 
									 <td class="nentd">Số CMND : </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     									<%# Eval("C_CMND")%>
									 </td>
								 </tr>	
								 <tr>								 
									 <td class="nentd">Đơn vị : </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     									<%# Eval("C_DON_VI")%>
									 </td>
								 </tr>	
								  <tr>								 
									 <td class="nentd">Ngày xuất cảnh : </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     									<%# Eval("C_NGAY_XC", "{0:dd/MM/yyyy}")%>
									 </td>
								 </tr>	
								 <tr>								 
									 <td class="nentd">Khoá học : </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     									<%# Eval("C_KHOA_HOC")%>
									 </td>
								 </tr>	
								 <tr>								 
									 <td class="nentd">Ngày tập trung : </td> 
									 <td height="20" valign="middle" align="left" class="nentd">
     									<%# Eval("C_NGAY_TAP_TRUNG", "{0:dd/MM/yyyy}")%>
									 </td>
								 </tr>	
								  <tr>								  
									 <td class="nentd">Địa điểm tập trung : </td>
									 <td height="20" valign="middle" align="left" class="nentd">
     									<%# Eval("C_DIA_DIEM")%>
									 </td>
								 </tr>	
								  <tr>
								    <td class="nentd" colspan="2"><uc3:Article ID="Huongdan2" ArticleID="388" AutoLang="true" runat="server" /> </td>
								 </tr>
							</table>	</center>						
					 </ItemTemplate>
				</asp:TemplateField>
		</Columns>
</asp:GridView> 