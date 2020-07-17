<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Danh-sach-dang-ky-kiem-tra-tieng-han.ascx.cs" Inherits="Admin_Modules_Danh_sach_dang_ky_kiem_tra_tieng_han" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 
<%@ Register Assembly="RadEditor.Net2" Namespace="Telerik.WebControls" TagPrefix="radE" %>
<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>
<table border="0" width="100%">
  <tr>
     <td align="center" bgcolor="#e4f2fe" colspan="4">
      <b>Thống kê - Kết quả điểm kiểm tra tiếng Hàn</b>
     </td>     
  </tr>
  <tr>
    <td>
        Trạng thái: 
        <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true" 
            onselectedindexchanged="ddlStatus_SelectedIndexChanged">
            <asp:ListItem Value="-1" Text="Tất cả"></asp:ListItem>
            <asp:ListItem Value="1" Text="Hiện"></asp:ListItem>
            <asp:ListItem Value="0" Text="Ẩn"></asp:ListItem>
        </asp:DropDownList>
    </td>
    <td>
    Tỉnh:
        <asp:DropDownList ID="ddlTinh" AutoPostBack="true" runat="server" 
            onselectedindexchanged="ddlTinh_SelectedIndexChanged">
                            <asp:ListItem Text="Tất cả" Value=""></asp:ListItem>
							 <asp:ListItem Text="An Giang" Value="An Giang"></asp:ListItem>
							 <asp:ListItem Text="Bà Rịa-Vũng Tàu" Value="Bà Rịa-Vũng Tàu"></asp:ListItem>
							 <asp:ListItem Text="Bạc Liêu" Value="Bạc Liêu"></asp:ListItem>
							 <asp:ListItem Text="Bắc Cạn" Value="Bắc Cạn"></asp:ListItem>
							 <asp:ListItem Text="Bắc Giang" Value="Bắc Giang"></asp:ListItem>
							 <asp:ListItem Text="Bắc Ninh" Value="Bắc Ninh"></asp:ListItem>
							 <asp:ListItem Text="Bến Tre" Value="Bến Tre"></asp:ListItem>
							 <asp:ListItem Text="Bình Dương" Value="Bình Dương"></asp:ListItem>
							 <asp:ListItem Text="Bình Định" Value="Bình Định"></asp:ListItem>
							 <asp:ListItem Text="Bình Phước" Value="Bình Phước"></asp:ListItem>
							 <asp:ListItem Text="Bình Thuận" Value="Bình Thuận"></asp:ListItem>
							 <asp:ListItem Text="Cà Mau" Value="Cà Mau"></asp:ListItem>
							 <asp:ListItem Text="Cao Bằng" Value="Cao Bằng"></asp:ListItem>
							 <asp:ListItem Text="Cần Thơ" Value="Cần Thơ"></asp:ListItem>
							 <asp:ListItem Text="Đà Nẵng" Value="Đà Nẵng"></asp:ListItem>
							 <asp:ListItem Text="Đắk Lắk" Value="Đắk Lắk"></asp:ListItem>
							 <asp:ListItem Text="Đắk Nông" Value="Đắk Nông"></asp:ListItem>
							 <asp:ListItem Text="Điện Biên" Value="Điện Biên"></asp:ListItem>
							 <asp:ListItem Text="Đồng Nai" Value="Đồng Nai"></asp:ListItem>
							 <asp:ListItem Text="Đồng Tháp" Value="Đồng Tháp"></asp:ListItem>
							 <asp:ListItem Text="Gia Lai" Value="Gia Lai"></asp:ListItem>
							 <asp:ListItem Text="Hà Giang" Value="Hà Giang"></asp:ListItem>
							 <asp:ListItem Text="Hà Nam" Value="Hà Nam"></asp:ListItem>
							 <asp:ListItem Text="Hà Nội" Value="Hà Nội"></asp:ListItem>
							 <asp:ListItem Text="Hà Tĩnh" Value="Hà Tĩnh"></asp:ListItem>
							 <asp:ListItem Text="Hải Dương" Value="Hải Dương"></asp:ListItem>
							 <asp:ListItem Text="Hải Phòng" Value="Hải Phòng"></asp:ListItem>
							 <asp:ListItem Text="Hậu Giang" Value="Hậu Giang"></asp:ListItem>
							 <asp:ListItem Text="Hòa Bình" Value="Hòa Bình"></asp:ListItem>
							 <asp:ListItem Text="Thành phố Hồ Chí Minh" Value="Thành phố Hồ Chí Minh"></asp:ListItem>
							 <asp:ListItem Text="Hưng Yên" Value="Hưng Yên"></asp:ListItem>
							 <asp:ListItem Text="Khánh Hoà" Value="Khánh Hoà"></asp:ListItem>
							 <asp:ListItem Text="Kiên Giang" Value="Kiên Giang"></asp:ListItem>
							 <asp:ListItem Text="Kon Tum" Value="Kon Tum"></asp:ListItem>
							 <asp:ListItem Text="Lai Châu" Value="Lai Châu"></asp:ListItem>
							 <asp:ListItem Text="Lạng Sơn" Value="Lạng Sơn"></asp:ListItem>
							 <asp:ListItem Text="Lào Cai" Value="Lào Cai"></asp:ListItem>
							 <asp:ListItem Text="Lâm Đồng" Value="Lâm Đồng"></asp:ListItem>
						     <asp:ListItem Text="Long An" Value="Long An"></asp:ListItem>							    
						     <asp:ListItem Text="Nam Định" Value="Nam Định"></asp:ListItem>							    
						     <asp:ListItem Text="Nghệ An" Value="Nghệ An"></asp:ListItem>							    
						     <asp:ListItem Text="Ninh Bình" Value="Ninh Bình"></asp:ListItem>							    
						     <asp:ListItem Text="Ninh Thuận" Value="Ninh Thuận"></asp:ListItem>							    
						     <asp:ListItem Text="Phú Thọ" Value="Phú Thọ"></asp:ListItem>							    
						     <asp:ListItem Text="Phú Yên" Value="Phú Yên"></asp:ListItem>							    
						     <asp:ListItem Text="Quảng Bình" Value="Quảng Bình"></asp:ListItem>							    
						     <asp:ListItem Text="Quảng Nam" Value="Quảng Nam"></asp:ListItem>							    
						     <asp:ListItem Text="Quảng Ngãi" Value="Quảng Ngãi"></asp:ListItem>							    
						     <asp:ListItem Text="Quảng Ninh" Value="Quảng Ninh"></asp:ListItem>							    
						     <asp:ListItem Text="Quảng Trị" Value="Quảng Trị"></asp:ListItem>							    
						     <asp:ListItem Text="Sóc Trăng" Value="Sóc Trăng"></asp:ListItem>							    
						     <asp:ListItem Text="Sơn La" Value="Sơn La"></asp:ListItem>							    
						     <asp:ListItem Text="Tây Ninh" Value="Tây Ninh"></asp:ListItem>							    
						     <asp:ListItem Text="Thái Bình" Value="Thái Bình"></asp:ListItem>							    
						     <asp:ListItem Text="Thái Nguyên" Value="Thái Nguyên"></asp:ListItem>							    
						     <asp:ListItem Text="Thanh Hoá" Value="Thanh Hoá"></asp:ListItem>							   
						     <asp:ListItem Text="Thừa Thiên-Huế" Value="Thừa Thiên-Huế"></asp:ListItem>							    
						     <asp:ListItem Text="Tiền Giang" Value="Tiền Giang"></asp:ListItem>
						     <asp:ListItem Text="Trà Vinh" Value="Trà Vinh"></asp:ListItem>
						     <asp:ListItem Text="Tuyên Quang" Value="Tuyên Quang"></asp:ListItem>
						     <asp:ListItem Text="Vĩnh Long" Value="Vĩnh Long"></asp:ListItem>
						     <asp:ListItem Text="Vĩnh Phúc" Value="Vĩnh Phúc"></asp:ListItem>
						     <asp:ListItem Text="Yên Bái" Value="Yên Bái"></asp:ListItem>
							</asp:DropDownList>
    </td>
  
   <td>
    Ngành:
         <asp:DropDownList ID="ddlNganh" DataSourceID="nganhDataSource" 
           DataTextField="C_NAME" DataValueField="C_NAME" runat="server" 
           AutoPostBack="True" ondatabound="ddlNganh_DataBound" 
           onselectedindexchanged="ddlNganh_SelectedIndexChanged" >
                </asp:DropDownList>
    </td>
     <td>
    Đơn vị:
         <asp:DropDownList ID="ddlDonvi" DataSourceID="DVDataSource" 
           DataTextField="C_NAME" DataValueField="C_NAME" runat="server" 
           AutoPostBack="True" ondatabound="ddlDonvi_DataBound" 
           onselectedindexchanged="ddlDonvi_SelectedIndexChanged" >
                </asp:DropDownList>
    </td>
  </tr>
  <tr>
    <td colspan="4">Điểm: 
     <asp:DropDownList ID="ddlColumn" runat="server">
            <asp:ListItem Value="" Text="Chọn cột"></asp:ListItem>
            <asp:ListItem Value="C_DIEM_DOC" Text="Điểm đọc"></asp:ListItem>
            <asp:ListItem Value="C_DIEM_NGHE" Text="Điểm nghe"></asp:ListItem>
            <asp:ListItem Value="C_DIEM_DOC+C_DIEM_NGHE" Text="Tổng điểm"></asp:ListItem>
        </asp:DropDownList>
     <asp:DropDownList ID="ddlCompare" runat="server">                                        
                <asp:ListItem Text="=" Value="=" ></asp:ListItem> 
                <asp:ListItem Text="<" Value="<"></asp:ListItem>
                <asp:ListItem Text="<=" Value="<="></asp:ListItem>
                <asp:ListItem Text=">" Value=">"> </asp:ListItem>
                <asp:ListItem Text=">=" Value=">="></asp:ListItem> 
           </asp:DropDownList>
            <asp:TextBox ID="txtDK" runat="server" Width="60"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="Giá trị không thể rỗng" ControlToValidate="txtDK" SetFocusOnError="True" ValidationGroup="vProductG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            <asp:RangeValidator ID="rvPrice" runat="server" ControlToValidate="txtDK" ErrorMessage="Giá trị phải là chữ số >=0" ValidationGroup="vProductG1" MaximumValue="9999999999" MinimumValue="0" SetFocusOnError="True" Type="Double" Display="Dynamic">*</asp:RangeValidator>
              <asp:Button ID="btnSearch" runat="server" Text="Lọc" ValidationGroup="vProductG1"
                    onclick="btnSearch_Click" />
    </td>
   
  </tr>
</table>
<asp:ValidationSummary ID="vsProduct" ValidationGroup="vProductG1" ShowSummary="false" HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="true" />  

<asp:GridView ID="gvListRegister"  Width="100%" runat="server" DataKeyNames="PK_DANG_KY" 
    AutoGenerateColumns="False" AllowPaging="True" 
    PageSize="10" AllowSorting="false" onrowcreated="gvListRegister_RowCreated" OnPageIndexChanging="gvListRegister_PageIndexChanging">
    <Columns>
   <asp:TemplateField HeaderText="STT" >
           <ItemTemplate>
           </ItemTemplate>
           <ItemStyle Width="10px" />
        </asp:TemplateField >
        <asp:TemplateField HeaderText="#">
           <ItemTemplate>
             <input name="chkFAQs" class="checkbox" type="checkbox" value="<%# Eval("PK_DANG_KY") %>" />
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
                
        <asp:TemplateField HeaderText="Họ và tên">
           <ItemTemplate>              
              <%# Eval("C_HO_TEN")%>
           </ItemTemplate>
        </asp:TemplateField>   
               
        <asp:TemplateField HeaderText="Ngày sinh">
           <ItemTemplate>
          <%# Eval("C_NGAY_SINH", "{0:dd/MM/yyyy}")%>              
           </ItemTemplate>
        </asp:TemplateField>      
         <asp:TemplateField HeaderText="Tỉnh">
           <ItemTemplate>
           <%# Eval("C_TINH")%>              
           </ItemTemplate>
        </asp:TemplateField>     
      <asp:TemplateField HeaderText="Đơn vị">
           <ItemTemplate>
            <%# Eval("C_DON_VI")%>              
           </ItemTemplate>
        </asp:TemplateField>      
        
        <asp:TemplateField HeaderText="Ngành">
           <ItemTemplate>
            <%# Eval("C_NGANH")%>              
           </ItemTemplate>
        </asp:TemplateField>                      
         <asp:TemplateField HeaderText="SBD">
           <ItemTemplate>
            <%# Eval("C_SBD")%>              
           </ItemTemplate>
        </asp:TemplateField>  
        <asp:TemplateField HeaderText="Điểm đọc">
           <ItemTemplate>
           <%# Eval("C_DIEM_DOC")%>              
           </ItemTemplate>
        </asp:TemplateField>
        
           <asp:TemplateField HeaderText="Điểm nghe">
           <ItemTemplate>
            <%# Eval("C_DIEM_NGHE")%>              
           </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Tổng điểm">
           <ItemTemplate>
            <%# Eval("C_TONG")%>              
           </ItemTemplate>
        </asp:TemplateField>           
       
    </Columns>
</asp:GridView>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td align="left">
        <CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkFAQs" runat="server" />
&nbsp;&nbsp;
Hiển thị : 
    <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
        <asp:ListItem Value="5" Text="5"></asp:ListItem>
        <asp:ListItem Value="10" Selected="True" Text="10"></asp:ListItem>
        <asp:ListItem Value="20" Text="20"></asp:ListItem>
        <asp:ListItem Value="50" Text="50"></asp:ListItem>
        <asp:ListItem Value="100" Text="100"></asp:ListItem>
    </asp:DropDownList> 
        </td>
        <td align="right">
            Tổng số: <span style="font-weight:bold"> <% =total %></span>
        </td>
        <td width="10"></td>
    </tr>
</table>
<center> 
&nbsp;<asp:Button ID="btnExportExcel" runat="server" Text="Xuất ra file Excel" 
                onclick="btnExportExcel_Click" />
</center>
<asp:SqlDataSource ID="nganhDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT * FROM T_MENU where C_STATUS=1 and C_PARENT=298"   
    ></asp:SqlDataSource>
    <asp:SqlDataSource ID="DVDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT * FROM T_MENU where C_STATUS=1 and C_PARENT=302"   
    ></asp:SqlDataSource>

<%--<asp:SqlDataSource ID="ListRegisterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT *,(T_DIEM_DANG_KY_KIEM_TRA_TIENG_HAN.C_DIEM_DOC+T_DIEM_DANG_KY_KIEM_TRA_TIENG_HAN.C_DIEM_NGHE) as C_TONG from T_DIEM_DANG_KY_KIEM_TRA_TIENG_HAN where ((@C_STATUS = -1) OR (@C_STATUS in (0, 1) and (C_STATUS = @C_STATUS))) and ((C_TINH=@C_TINH) OR (@C_TINH=''))">   
   <SelectParameters>    
      <asp:ControlParameter Name="C_STATUS" Type="Int32" ControlID="ddlStatus" DefaultValue="-1" />
      <asp:ControlParameter Name="C_TINH" Type="String" ControlID="ddlTinh" PropertyName="Text" ConvertEmptyStringToNull="False" />
      
   </SelectParameters>  
</asp:SqlDataSource>--%>