<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ds-DaiLoan.ascx.cs" Inherits="Admin_Modules_ds_DaiLoan" %>

<center>
    <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>

<br />
<table border="0" width="100%">
  <tr>
     <td align="center" bgcolor="#e4f2fe" colspan="3" height="30">
      <b>Ứng viên đăng ký tham gia dự tuyển chương trình làm việc tại Đài Loan</b>
     </td>     
  </tr> 
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>       
        <td align="right">
            Tổng số: <span style="font-weight: bold">
                <% =total %> bản ghi</span>
        </td>
        <td width="10">
        </td>
    </tr>
</table>

<asp:GridView ID="gvList" Width="100%" runat="server" DataKeyNames="PK_LV_DAILOAN"
    AutoGenerateColumns="False" AllowPaging="false" PageSize="20" AllowSorting="false"
    OnRowCreated="gvList_RowCreated" DataSourceID="ListRegisterDataSource">
    <Columns>
        <asp:TemplateField HeaderText="STT">
            <ItemTemplate>
            </ItemTemplate>
            <ItemStyle Width="10px" />
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="Họ và tên">
            <ItemTemplate>
                <%# Eval("C_HOTEN")%>
            </ItemTemplate><ItemStyle Width="150px" />
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="Ngày sinh">
            <ItemTemplate>
                <%# Eval("C_NGAYSINH", "{0:MM/dd/yyyy}")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Số CMND/căn cước công dân">
            <ItemTemplate>
                <%# Eval("C_CMND")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Giới tính">
            <ItemTemplate>
                <%# Eval("C_GioiTinh")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Chiều cao">
            <ItemTemplate>
                <%# Eval("C_ChieuCao")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Nơi đăng ký hộ khẩu thường trú (Tỉnh/thành phố)">
            <ItemTemplate>
                <%# Eval("C_HOKHAU")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Số điện thoại">
            <ItemTemplate>
                <%# Eval("C_DIENTHOAI1")%>
            </ItemTemplate><ItemStyle Width="80px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Trình độ học vấn">
            <ItemTemplate>
                <%# Eval("C_TRINHDO")%>
            </ItemTemplate>
        </asp:TemplateField>
        <%--<asp:TemplateField HeaderText="Tình trạng hôn nhân">
            <ItemTemplate>
                <%# Eval("C_HONNHAN")%>
            </ItemTemplate>
        </asp:TemplateField>--%>

        
        <%--<asp:TemplateField HeaderText="Số nhà/thôn/xóm">
            <ItemTemplate>
                <%# Eval("C_SONHA")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Phường/xã">
            <ItemTemplate>
                <%# Eval("C_PHUONGXA")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Quân/huyện">
            <ItemTemplate>
                <%# Eval("C_QUANHUYEN")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Thành phố/tỉnh">
            <ItemTemplate>
                <%# Eval("C_THANHPHO")%>
            </ItemTemplate>
        </asp:TemplateField>--%>
        

        <asp:TemplateField HeaderText="Trình độ tiếng Trung">
            <ItemTemplate>
                <%# Eval("C_TRINHDOTIENGTRUNG")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Đã làm việc tại Đài Loan">
            <ItemTemplate>
                <%# Eval("C_DALAMVIECTAIDAILOAN")%>
            </ItemTemplate>
        </asp:TemplateField>
        <%--<asp:TemplateField HeaderText="Số điện thoại thứ hai">
            <ItemTemplate>
                <%# Eval("C_DIENTHOAI2")%>
            </ItemTemplate><ItemStyle Width="80px" />
        </asp:TemplateField>--%>
        <%--<asp:TemplateField HeaderText="Họ và tên người liên hệ">
            <ItemTemplate>
                <%# Eval("C_NGUOILIENHE")%>
            </ItemTemplate><ItemStyle Width="150px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Quan hệ với người đăng ký tham gia chương trình">
            <ItemTemplate>
                <%# Eval("C_QUANHE")%>
            </ItemTemplate>
            <ItemStyle Width="80px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Địa chỉ thường trú">
            <ItemTemplate>
                <%# Eval("C_DIACHI")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Điện thoại liên hệ">
            <ItemTemplate>
                <%# Eval("C_DIENTHOAI")%>
            </ItemTemplate>
        </asp:TemplateField>--%>
        <asp:TemplateField HeaderText="Thời gian đăng ký trên hệ thống">
            <ItemTemplate>
                <%# Eval("C_NGAYDANGKY", "{0:dd/MM/yyyy}")%>
            </ItemTemplate><ItemStyle Width="80px" />
        </asp:TemplateField>
    </Columns>
</asp:GridView>

<br />
<center>
    &nbsp;<asp:Button ID="btnExportExcel" runat="server" Text="Xuất ra file Excel" OnClick="btnExportExcel_Click" />
    <asp:Button ID="btnExportWord" runat="server" Text="Xuất Word" OnClick="btnExportWord_Click" CssClass="btngui im" />
</center>

<asp:SqlDataSource ID="ListRegisterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT * from T_LV_DAILOAN  where C_NGAYDANGKY >  '2020-01-01 00:00:00.000'  order by PK_LV_DAILOAN desc"></asp:SqlDataSource>
