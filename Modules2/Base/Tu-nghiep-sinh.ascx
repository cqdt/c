<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Tu-nghiep-sinh.ascx.cs" Inherits="Modules_Base_Tu_nghiep_sinh" %>
<asp:GridView id="gvArticles" runat="server" GridLines="None" ShowHeader="false" Width="100%"
		AutoGenerateColumns="False" AllowPaging="false" HorizontalAlign="Center" CaptionAlign="Top" PageSize="5">
		<Columns>
				<asp:TemplateField ShowHeader="False">
					 <ItemTemplate>		<center>			
							<table width="100%" border="0" cellspacing="0" cellpadding="0">							
								
								
								 <tr>
								    <td>
								        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabletd">
								               <tr>
								                <td height="10"></td>
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
								                      Địa chỉ:  
								                    </td>
								                    <td width="8"></td>
								                    <td>
								                        <%# Eval("C_DIA_CHI")%>
								                    </td>
								               </tr>
								               <tr>
								                    <td class="left_cell" valign="top" align="left"> 
								                      Nghề nghiệp:  
								                    </td>
								                    <td width="8"></td>
								                    <td>
								                        <%# Eval("C_NGHE_NGHIEP")%>
								                    </td>
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
								                    Bằng cấp: 	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_BANG_CAP")%>
								                    </td>
								               </tr>
								                 <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                    Trình độ ngoại ngữ: 	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_TRINH_DO_NN")%>
								                    </td>
								               </tr>
								                <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                   Nguyện vọng đăng ký: 	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_NGUYEN_VONG")%>
								                    </td>
								               </tr>
								                <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                   Thời gian làm việc: 	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_THOI_GIAN_LV")%>
								                    </td>
								               </tr>
								                <tr>
								                    <td class="left_cell" width="130" valign="top" align="left">  
								                 Mức lương yêu cầu: 	               								        
								                    </td>
								                    <td></td>
								                    <td>
								                     <%# Eval("C_MUC_LUONG_YC")%>
								                    </td>
								               </tr>
								                <tr>
								                <td height="10"></td>
								                <td width="8"></td>
								                <td></td>
								               </tr>
								        </table>
								    </td>
								 </tr>	
																								
								  
								 
								 						 
							</table>	</center>						
					 </ItemTemplate>
				</asp:TemplateField>
		</Columns>
</asp:GridView> 