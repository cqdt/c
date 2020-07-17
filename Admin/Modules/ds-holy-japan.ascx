<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ds-holy-japan.ascx.cs" Inherits="Admin_Modules_ds_holy_japan" %>

<center>
    <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>

<br />
<table border="0" width="100%">
  <tr>
     <td align="center" bgcolor="#e4f2fe" colspan="3" height="30">
      <b>Ứng viên đăng ký tham gia dự tuyển chương trình Hộ lý tại Nhật Bản</b>
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

<asp:GridView ID="gvList" Width="100%" runat="server" DataKeyNames="PK_HoLy"
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
                <%# Eval("C_GIOITINH")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Nơi đăng ký hộ khẩu thường trú (Tỉnh/thành phố)">
            <ItemTemplate>
                <%# Eval("C_HKTT")%>
            </ItemTemplate>
        </asp:TemplateField>
       
        <asp:TemplateField HeaderText="Số điện thoại">
            <ItemTemplate>
                <%# Eval("C_DIENTHOAI")%>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Số điện thoại 2">
            <ItemTemplate>
                <%# Eval("C_DIENTHOAI2")%>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Hệ đào tạo">
            <ItemTemplate>
                <%# Eval("C_HEDAOTAO")%>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Tên trường đào tạo">
            <ItemTemplate>
                <%# Eval("C_TENTRUONGDAOTAO")%>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Chuyên ngành đào tạo">
            <ItemTemplate>
                <%# Eval("C_CHUYENNGANHDAOTAO")%>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Sinh viên năm(nếu chưa tốt nghiệp)">
            <ItemTemplate>
                <%# Eval("C_SINHVIENNAMTHU")%>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Công việc hiện tại">
            <ItemTemplate>
                <%# Eval("C_CONGVIECHIENTAI")%>
            </ItemTemplate>
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="Thời gian đăng ký trên hệ thống">
            <ItemTemplate>
                <%# Eval("C_NGAYGUI", "{0:dd/MM/yyyy}")%>
            </ItemTemplate><ItemStyle Width="80px" />
        </asp:TemplateField>
    </Columns>
</asp:GridView>

<br />
<center>
    &nbsp;<asp:Button ID="btnExportExcel" runat="server" Text="Xuất ra file Excel" OnClick="btnExportExcel_Click" />
</center>

<asp:SqlDataSource ID="ListRegisterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT * from T_HoLy order by PK_HoLy desc"></asp:SqlDataSource>
