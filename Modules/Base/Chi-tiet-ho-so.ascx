<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Chi-tiet-ho-so.ascx.cs" Inherits="Modules_Base_Chi_tiet_ho_so" %>
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
								                <td class="breadcrumbs" width="60">Tên hồ sơ : </td>								                
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
								        Thông tin liên hệ
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
								                        Họ tên:
								                    </td>
								                    <td width="8"></td>
								                    <td class="impress_link">
								                      <%# Eval("C_HO_TEN")%>
								                    </td>
								               </tr>
								                <tr>
								                    <td class="left_cell" valign="top" align="left"> 
								                       Ngày sinh:  	 
								                    </td>
								                    <td width="8"></td>
								                    <td >
								                       <%# Eval("C_NGAY_SINH","{0:dd/MM/yyyy}")%>
								                    </td>
								               </tr>
								                 <tr>
								                    <td class="left_cell" valign="top" align="left"> 
								                        Giới tính:  	  	 
								                    </td>
								                    <td width="8"></td>
								                    <td >
								                       <%# Eval("C_GIOI_TINH")%>
								                    </td>
								               </tr>
								               <tr>
								                    <td class="left_cell" valign="top" align="left"> 
								                       Tình trạng hôn nhân:  	 
								                    </td>
								                    <td width="8"></td>
								                    <td>
								                       <%# Eval("C_TINH_TRANG_HON_NHAN")%>
								                    </td>
								               </tr>
								               <tr>
								                    <td class="left_cell" valign="top" align="left"> 
								                      Địa chỉ:  
								                    </td>
								                    <td width="8"></td>
								                    <td>
								                        <%# Eval("C_DIA_CHI")%>
								                    </td>
								               </tr>
								               <tr>
								                    <td class="left_cell" valign="top" align="left"> 
								                    Điện thoại: 	 
								                    </td>
								                    <td width="8"></td>
								                    <td>
								                        <%# Eval("C_DIEN_THOAI")%>
								                    </td>
								               </tr>
								               <tr>
								                    <td class="left_cell" valign="top" align="left"> 
								                    Di động: 	 
								                    </td>
								                    <td width="8"></td>
								                    <td>
								                        <%# Eval("C_DI_DONG")%>
								                    </td>
								               </tr>
								                <tr>
								                    <td class="left_cell" valign="top" align="left"> 
								                    Trình độ: 	 
								                    </td>
								                    <td width="8"></td>
								                    <td>
								                        <%# Eval("C_TRINH_DO")%>
								                    </td>
								               </tr>
								                <tr>
								                    <td class="left_cell" valign="top" align="left"> 
								                    Email: 	 
								                    </td>
								                    <td width="8"></td>
								                    <td>
								                        <%# Eval("C_EMAIL")%>
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
								        Việc làm mong muốn
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
								                      <%# Eval("C_CHUC_DANH")%>
								                    </td>
								               </tr>
								                <tr>
								                    <td class="left_cell" width="170" valign="top" align="left">  
								                    Mô tả công việc mong muốn:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                      <%# Eval("C_MO_TA_CONG_VIEC")%>
								                    </td>
								               </tr>
								               <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                  Mức lương hiện tại:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_MUC_LUONG_HIEN_TAI")%>
								                    </td>
								               </tr>
								                <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                   Mức lương mong muốn:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                      <%# Eval("C_MUC_LUONG_MONG_MUON")%>
								                    </td>
								               </tr>
								                <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                   Chức danh:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                      <%# Eval("C_CHUC_DANH")%>
								                    </td>
								               </tr>
								                 <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                   Loại hình công việc:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_LOAI_HINH_CV")%>
								                    </td>
								               </tr>
								               <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                   Ngành nghề mong muốn:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_NGANH_NGHE_MONG_MUON")%>
								                    </td>
								               </tr>
								                <tr>
								                    <td class="left_cell" width="170" valign="top" align="left">  
								                   Địa điểm làm việc mong muốn:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_DIA_DIEM")%>
								                    </td>
								               </tr>
								               <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                  Sẵn sàng di chuyển:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                      <%# Eval("C_DI_CHUYEN")%>
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
								        Quá trình học tập và các bằng cấp đạt được 
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
								                    Bằng cấp: 	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_BANG_CAP")%>
								                    </td>
								               </tr>
								               <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                   Trường tốt nghiệp:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                   <%# Eval("C_TRUONG_TN")%>
								                    </td>
								               </tr>
								               <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                    Năm tốt nghiệp:   	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                   <%# Eval("C_NAM")%>
								                    </td>
								               </tr>
								               <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                   Nội dung học:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_NOI_DUNG_HOC")%>
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
								       Kinh nghiệm làm việc  
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
								                    Kinh nghiệm: 	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_KINH_NGHIEM")%>
								                    </td>
								               </tr>
								               <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                  Kĩ năng cá nhân:  	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                   <%# Eval("C_KI_NANG")%>
								                    </td>
								               </tr>
								               <tr>
								                    <td  width="130" valign="top">  
								                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabletd">
								                            <tr>
								                                <td class="left_cell" align="right">Từ:</td>
								                                <td><%# Eval("C_TU","{0:dd/MM/yyyy}")%></td>
								                            </tr>
								                             <tr>
								                                <td class="left_cell" align="right">Đến:</td>
								                                <td><%# Eval("C_DEN", "{0:dd/MM/yyyy}")%></td>
								                            </tr>
								                        </table>
								                           	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                   <%# Eval("C_LAM")%>
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