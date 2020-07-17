<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Tin-tuyen-dung.ascx.cs" Inherits="Modules_Base_Tin_tuyen_dung" %>
<asp:GridView id="gvArticles" runat="server" GridLines="None" ShowHeader="false" Width="100%"
		AutoGenerateColumns="False" AllowPaging="false" HorizontalAlign="Center" CaptionAlign="Top" PageSize="5">
		<Columns>
				<asp:TemplateField ShowHeader="False">
					 <ItemTemplate>		<center>			
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
								    <td>
								        <table width="100%" border="0" cellspacing="0" cellpadding="0">
								            <tr>								                
									             <td class="breadcrumbs" valign="middle" align="left" class="nentd">
     								            <span class="require">	<%# Eval("C_TITLE")%></span>
									             </td>   
								            </tr>
								        </table>
								    </td>						
									 
								 </tr>
								 <tr>
								    <td height="2"></td>
								 </tr>
								 <tr>
								    <td class="breadcrumbs">
								        Thông tin doanh nghiệp tuyển dụng 
								    </td>
								 </tr>	
								 <tr>
								    <td>
								        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabletd">
								               <tr>
								                <td height="15"></td>
								                <td width="8"></td>
								                <td></td>
								               </tr>
								               <tr>
								                    <td class="left_cell" width="130" valign="top" align="left"> 
								                        Công ty:
								                    </td>
								                    <td width="8"></td>
								                    <td class="impress_link">
								                        <%# Eval("C_TEN_CONG_TY")%>
								                    </td>
								               </tr>
								                <tr>
								                    <td class="left_cell" valign="top" align="left"> 
								                        Địa chỉ:  	 
								                    </td>
								                    <td width="8"></td>
								                    <td >
								                        <%# Eval("C_DIA_CHI")%>
								                    </td>
								               </tr>
								                 <tr>
								                    <td class="left_cell" valign="top" align="left"> 
								                        Mô tả:  	 
								                    </td>
								                    <td width="8"></td>
								                    <td >
								                        <%# Eval("C_MO_TA")%>
								                    </td>
								               </tr>
								               <tr>
								                    <td class="left_cell" valign="top" align="left"> 
								                       Điện thoại:  	 
								                    </td>
								                    <td width="8"></td>
								                    <td>
								                        <%# Eval("C_PHONE")%>
								                    </td>
								               </tr>
								               <tr>
								                    <td class="left_cell" valign="top" align="left"> 
								                      Quy mô:  	 
								                    </td>
								                    <td width="8"></td>
								                    <td>
								                        <%# Eval("C_QUY_MO")%>
								                    </td>
								               </tr>
								               <tr>
								                    <td class="left_cell" valign="top" align="left"> 
								                     Tiêu chí hoạt động:  	 
								                    </td>
								                    <td width="8"></td>
								                    <td>
								                        <%# Eval("C_TIEU_CHI")%>
								                    </td>
								               </tr>
								               <tr>
								                    <td class="left_cell" valign="top" align="left"> 
								                    Website:  	 
								                    </td>
								                    <td width="8"></td>
								                    <td>
								                        <%# Eval("C_WEBSITE")%>
								                    </td>
								               </tr>
								        </table>
								    </td>
								 </tr>	
								 <tr>
								    <td height="10">
								        
								    </td>
								 </tr>
								  <tr>
								    <td class="breadcrumbs">
								        Thông tin vị trí tuyển dụng
								    </td>
								 </tr>	
								  <tr>
								    <td height="10">
								        
								    </td>
								 </tr>		
								  <tr>
								    <td>
								        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabletd">
								               <tr>
								                    <td height="10">                								        
								                    </td>
								                    <td width="8"></td>
								                    <td></td>
								               </tr>
								               <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                    Chức danh/Vị trí:  	               								        
								                    </td>
								                    <td></td>
								                    <td class="impress_link">
								                     <%# Eval("C_VI_TRI")%>
								                    </td>
								               </tr>
								                <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                    Số lượng:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_SL_TUYEN")%>
								                    </td>
								               </tr>
								               <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                   Lĩnh vực ngành nghề:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_LINH_VUC")%>
								                    </td>
								               </tr>
								                <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                   Địa điểm làm việc:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_DIA_DIEM_LAM_VIEC")%>
								                    </td>
								               </tr>
								                <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                   Mô tả việc làm:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_MO_TA_VIEC_LAM")%>
								                    </td>
								               </tr>
								                 <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                   Kỹ năng tối thiểu:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_KY_NANG")%>
								                    </td>
								               </tr>
								               <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                   Trình độ tối thiểu:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_TRINH_DO_TOI_THIEU")%>
								                    </td>
								               </tr>
								                <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                   Kinh nghiệm yêu cầu:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_KINH_NGHIEM")%>
								                    </td>
								               </tr>
								               <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                   Yêu cầu giới tính:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_YC_GIOI_TINH")%>
								                    </td>
								               </tr>
								                <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                   Hình thức làm việc:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_HINH_THUC_LAM_VIEC")%>
								                    </td>
								               </tr>
								                <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                   Mức lương:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_MUC_LUONG")%>
								                    </td>
								               </tr>
								                <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                   Thời gian thử việc:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_THOI_GIAN_THU_VIEC")%>
								                    </td>
								               </tr>
								                <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                   Các chế độ khác:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_CAC_CHE_DO_KHAC")%>
								                    </td>
								               </tr>
								                <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                   Yêu cầu hồ sơ:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_YEU_CAU_HO_SO")%>
								                    </td>
								               </tr>
								                <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                   Thời gian đăng tin:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_NGAY_DANG","{0:dd/MM/yyyy}")%>
								                    </td>
								               </tr>
								                <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                  Hạn nộp hồ sơ:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_HAN_NOP_HS", "{0:dd/MM/yyyy}")%>
								                    </td>
								               </tr>
								        </table>
								    </td>
								 </tr>	
								  <tr>
								    <td height="10">
								        
								    </td>
								 </tr>
								  <tr>
								    <td class="breadcrumbs">
								        Thông tin liên hệ Nhà tuyển dụng 
								    </td>
								 </tr>	
								  <tr>
								    <td height="10">
								        
								    </td>
								 </tr>	
								 <tr>
								    <td>
								        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabletd">
								               <tr>
								                    <td height="10">                								        
								                    </td>
								                    <td width="8"></td>
								                    <td></td>
								               </tr>
								                <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                    Người liên hệ: 	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_NGUOI_LIEN_HE")%>
								                    </td>
								               </tr>
								               <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                    Địa chỉ liên hệ:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_DIA_CHI_LIEN_HE")%>
								                    </td>
								               </tr>
								               <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                    Email liên hệ:   	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_EMAIL_LIEN_HE")%>
								                    </td>
								               </tr>
								               <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                    Số điện thoại liên hệ:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_DIEN_THOAI_LIEN_HE")%>
								                    </td>
								               </tr>
								               <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                   Di động:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_DI_DONG")%>
								                    </td>
								               </tr>
								               <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                   Hình thức liên hệ:  	  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_HINH_THUC_LIEN_HE")%>
								                    </td>
								               </tr>
								         </table>
								    </td>
								 </tr>							 
							</table>	</center>						
					 </ItemTemplate>
				</asp:TemplateField>
		</Columns>
</asp:GridView> 