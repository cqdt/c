<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ket-noi-theo-dia-diem.ascx.cs" Inherits="Admin_Modules_ket_noi_theo_dia_diem" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %>

<style>
.dong{

    background-color: #86a95f;
    color: white;

}
</style>
<center>
    <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>
<br />
<table border="0" width="100%" cellpadding="0" cellspacing="0">
    <tr>
     <td width="10" bgcolor="#f9cd58">
        </td>
    <td id="Td1" width="280" runat="server" bgcolor="#f9cd58">
            Lựa chọn địa điểm:
            <asp:DropDownList ID="ddlCongty" runat="server" Width="150"  height="25">          
				   				          				    				  		   			
           
            
             <asp:ListItem value="Không yêu cầu" >Không yêu cầu</asp:ListItem>
                <asp:ListItem value="Hà Nội" Text="">Hà Nội</asp:ListItem>
                <asp:ListItem value="TP HCM" Text="">TP HCM</asp:ListItem>
                <asp:ListItem value="An Giang" Text="">An Giang</asp:ListItem>
                <asp:ListItem value="Bà Rịa - Vũng Tàu" Text="">Bà Rịa - Vũng Tàu</asp:ListItem>
                <asp:ListItem value="Bắc Giang" Text="">Bắc Giang</asp:ListItem>
                <asp:ListItem value="Bắc Kạn" Text="">Bắc Kạn</asp:ListItem>
                <asp:ListItem value="Bạc Liêu" Text="">Bạc Liêu</asp:ListItem>
                <asp:ListItem value="Bắc Ninh" Text="">Bắc Ninh</asp:ListItem>
                <asp:ListItem value="Bến Tre" Text="">Bến Tre</asp:ListItem>
                <asp:ListItem value="Bình Định" Text="">Bình Định</asp:ListItem>
                <asp:ListItem value="Bình Dương" Text="">Bình Dương</asp:ListItem>
                <asp:ListItem value="Bình Phước" Text="">Bình Phước</asp:ListItem>
                <asp:ListItem value="Bình Thuận" Text="">Bình Thuận</asp:ListItem>
                <asp:ListItem value="Cà Mau" Text="">Cà Mau</asp:ListItem>
                <asp:ListItem value="Cần Thơ" Text="">Cần Thơ</asp:ListItem>
                <asp:ListItem value="Cao Bằng" Text="">Cao Bằng</asp:ListItem>
                <asp:ListItem value="Đà Nẵng" Text="">Đà Nẵng</asp:ListItem>
                <asp:ListItem value="Đắk Lắk" Text="">Đắk Lắk</asp:ListItem>
                <asp:ListItem value="Đắk Nông" Text="">Đắk Nông</asp:ListItem>
                <asp:ListItem value="Điện Biên" Text="">Điện Biên</asp:ListItem>
                <asp:ListItem value="Đồng Nai" Text="">Đồng Nai</asp:ListItem>
                <asp:ListItem value="Đồng Tháp" Text="">Đồng Tháp</asp:ListItem>
                <asp:ListItem value="Gia Lai" Text="">Gia Lai</asp:ListItem>
                <asp:ListItem value="Hà Giang" Text="">Hà Giang</asp:ListItem>
                <asp:ListItem value="Hà Nam" Text="">Hà Nam</asp:ListItem>
                <asp:ListItem value="Hà Tĩnh">Hà Tĩnh</asp:ListItem>
                <asp:ListItem value="Hải Phòng" Text="">Hải Phòng</asp:ListItem>
                <asp:ListItem value="Hải Dương" Text="">Hải Dương</asp:ListItem>
                <asp:ListItem value="Hậu Giang" Text="">Hậu Giang</asp:ListItem>
                <asp:ListItem value="Hòa Bình" Text="">Hòa Bình</asp:ListItem>
                <asp:ListItem value="Hưng Yên" Text="">Hưng Yên</asp:ListItem>
                <asp:ListItem value="Khánh Hòa" Text="">Khánh Hòa</asp:ListItem>
                <asp:ListItem value="Kiên Giang" Text="">Kiên Giang</asp:ListItem>
                <asp:ListItem value="Kon Tum" Text="">Kon Tum</asp:ListItem>
                <asp:ListItem value="Lai Châu" Text="">Lai Châu</asp:ListItem>
                <asp:ListItem value="Lâm Đồng" Text="">Lâm Đồng</asp:ListItem>
                <asp:ListItem value="Lạng Sơn" Text="">Lạng Sơn</asp:ListItem>
                <asp:ListItem value="Lào Cai" Text="">Lào Cai</asp:ListItem>
                <asp:ListItem value="Long An" Text="">Long An</asp:ListItem>
                <asp:ListItem value="Nam Định" Text="">Nam Định</asp:ListItem>
                <asp:ListItem value="Nghệ An">Nghệ An</asp:ListItem>
                <asp:ListItem value="Ninh Bình">Ninh Bình</asp:ListItem>
                <asp:ListItem value="Ninh Thuận">Ninh Thuận</asp:ListItem>
                <asp:ListItem value="Phú Thọ">Phú Thọ</asp:ListItem>
                <asp:ListItem value="Quảng Bình">Quảng Bình</asp:ListItem>
                <asp:ListItem value="Quảng Nam">Quảng Nam</asp:ListItem>
                <asp:ListItem value="Quảng Ngãi">Quảng Ngãi</asp:ListItem>
                <asp:ListItem value="Quảng Ninh">Quảng Ninh</asp:ListItem>
                <asp:ListItem value="Quảng Trị">Quảng Trị</asp:ListItem>
                <asp:ListItem value="Sóc Trăng">Sóc Trăng</asp:ListItem>
                <asp:ListItem value="Sơn La">Sơn La</asp:ListItem>
                <asp:ListItem value="Tây Ninh">Tây Ninh</asp:ListItem>
                <asp:ListItem value="Thái Bình">Thái Bình</asp:ListItem>
                <asp:ListItem value="Thái Nguyên">Thái Nguyên</asp:ListItem>
                <asp:ListItem value="Thanh Hóa">Thanh Hóa</asp:ListItem>
                <asp:ListItem value="Thừa Thiên Huế">Thừa Thiên Huế</asp:ListItem>
                <asp:ListItem value="Tiền Giang">Tiền Giang</asp:ListItem>
                <asp:ListItem value="Trà Vinh">Trà Vinh</asp:ListItem>
                <asp:ListItem value="Tuyên Quang">Tuyên Quang</asp:ListItem>
                <asp:ListItem value="Vĩnh Long">Vĩnh Long</asp:ListItem>
                <asp:ListItem value="Vĩnh Phúc">Vĩnh Phúc</asp:ListItem>
                <asp:ListItem value="Yên Bái" Text="">Yên Bái</asp:ListItem>
                <asp:ListItem value="Phú Yên" Text="">Phú Yên</asp:ListItem>
             </asp:DropDownList>
        </td>
        <td bgcolor="#f9cd58">
            <asp:Button ID="btnTimkiem" runat="server" Text="    LỌC    " OnClick="btnTimkiem_Click" />
        </td>
        <td align="left" bgcolor="#f9cd58"  height="30" >
            <b>Kết nối vị trí tuyển dụng và người lao động tại  : <asp:Label ID="Label1" runat="server" Text="" ForeColor="red"></asp:Label></b>
        </td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr>
    <td height="5px">
        </td>
        </tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
    
    <tr>
    <td width="10" height="30px" class="dong">
        </td>

     <td align="left" height="30px" class="dong">
      <b>   DANH SÁCH CÔNG TY ĐẠT YÊU CẦU </b>
    </td>
    
    <td align="right" height="30px" class="dong">
            Tổng số: <span style="font-weight: bold">
                <% =total %> đơn vị</span>
        </td>
        <td width="10" height="30px" class="dong">
        </td>
    </tr>
</table>
<asp:GridView ID="gvList" Width="100%" runat="server" DataKeyNames="ID" AutoGenerateColumns="False"
    AllowPaging="true" PageSize="1000" AllowSorting="false" OnRowCreated="gvList_RowCreated"
    OnPageIndexChanging="gvList_PageIndexChanging">
    <Columns>
     
        <asp:TemplateField HeaderText="STT">
            <ItemTemplate>
            </ItemTemplate>
            <ItemStyle Width="10px" />
        </asp:TemplateField>
        
         <asp:TemplateField HeaderText="Mã tuyển dụng">
            <ItemTemplate>
                <%# Eval("C_MATUYENDUNG")%>
            </ItemTemplate>
           
        </asp:TemplateField>
        
        
        <asp:TemplateField HeaderText="Công ty">
            <ItemTemplate>
                <%# Eval("C_TENCTY")%>
            </ItemTemplate>
           
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Vị trí">
            <ItemTemplate>
                <%# Eval("C_VITRI_KR")%>
                
            </ItemTemplate>
            
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Thời gian tuyển">
            <ItemTemplate>
                <%# Eval("C_THOIGIANTUYEN", "{0:MM/dd/yyyy}")%>
            </ItemTemplate>
        </asp:TemplateField>
    
        <asp:TemplateField HeaderText="Ngày gửi">
            <ItemTemplate>
                 <%# Eval("C_NGAY", "{0:MM/dd/yyyy}")%>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr>
    <td height="5px">
        </td>
        </tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
    
    <tr>
    <td width="10" height="30px" class="dong">
        </td>

     <td align="left" height="30px" class="dong">
      <b>   DANH SÁCH NGƯỜI LAO ĐỘNG ĐẠT YÊU CẦU </b>
    </td>
    
    <td align="right" height="30px" class="dong">
            Tổng số: <span style="font-weight: bold">
                <% =total2 %> người</span>
        </td>
        <td width="10" height="30px" class="dong">
        </td>
    </tr>
</table>
<asp:GridView ID="GridView1" Width="100%" runat="server" DataKeyNames="ID" AutoGenerateColumns="False"
    AllowPaging="true" PageSize="1000" AllowSorting="false" OnRowCreated="gvList_RowCreated1"
  >
    <Columns>
     
        <asp:TemplateField HeaderText="STT">
            <ItemTemplate>
            </ItemTemplate>
            <ItemStyle Width="10px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Mã tìm việc">
            <ItemTemplate>
                <%# Eval("C_MATIMVIEC")%>
            </ItemTemplate>
           
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Họ">
            <ItemTemplate>
                <%# Eval("C_HODEM")%>
                
            </ItemTemplate>
            
              </asp:TemplateField>
             <asp:TemplateField HeaderText="Tên">
            <ItemTemplate>
                <%# Eval("C_TEN")%>
            </ItemTemplate>
           
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Ngày sinh">
            <ItemTemplate>
                <%# Eval("C_NGAYSINH")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Điện thoại">
            <ItemTemplate>
                <%# Eval("C_DIENTHOAI")%>
                
            </ItemTemplate>           
        </asp:TemplateField>
       
    
        <asp:TemplateField HeaderText="Ngày gửi">
            <ItemTemplate>
                 <%# Eval("C_EMAIL")%>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<%--<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkGallerys" runat="server" />
&nbsp;&nbsp; Hiển thị :--%>
<%--<asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
    <asp:ListItem Value="5" Text="5"></asp:ListItem>
    <asp:ListItem Value="10" Text="10"></asp:ListItem>
    <asp:ListItem Value="20" Selected="True" Text="20"></asp:ListItem>
    <asp:ListItem Value="50" Text="50"></asp:ListItem>
    <asp:ListItem Value="1000" Text="1000"></asp:ListItem>
</asp:DropDownList>
bản ghi / 1 trang&nbsp;<br />
<br />
<br />
<center>
    &nbsp;<asp:Button ID="btnExportExcel" runat="server" Text="Xuất ra file Excel" OnClick="btnExportExcel_Click" />
    &nbsp;
    <%--<asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ" OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');"
        OnClick="btnDelete_Click" />
</center>
--%>