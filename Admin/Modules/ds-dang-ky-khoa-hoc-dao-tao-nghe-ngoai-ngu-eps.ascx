<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ds-dang-ky-khoa-hoc-dao-tao-nghe-ngoai-ngu-eps.ascx.cs" Inherits="Admin_Modules_ds_dang_ky_khoa_hoc_dao_tao_nghe_ngoai_ngu_eps" %>

<center>
    <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>

<br />
<table border="0" width="100%">
  <tr>
     <td align="center" bgcolor="#e4f2fe" colspan="3" height="30">
      <b>Danh sách đăng ký khóa học đào tạo nghề ngoại ngữ chương trình EPS</b>
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



<asp:GridView ID="gvList" Width="100%" runat="server" DataKeyNames="PK_KHOAHOC"
    AutoGenerateColumns="False" AllowPaging="false" PageSize="20" AllowSorting="false"
    OnRowCreated="gvList_RowCreated" DataSourceID="ListRegisterDataSource">
    <Columns>
        <asp:TemplateField HeaderText="STT">
            <ItemTemplate>
            </ItemTemplate>
            <ItemStyle Width="10px" />
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="Họ tên">
            <ItemTemplate>
                <%# Eval("C_HOTEN")%>
            </ItemTemplate>
        </asp:TemplateField>
       
        <asp:TemplateField HeaderText="Ngày sinh">
            <ItemTemplate>
                <%# Eval("C_NGAYSINH")%>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Giới tính">
            <ItemTemplate>
                <%# Eval("C_GIOITINH")%>
            </ItemTemplate>
        </asp:TemplateField>


        <asp:TemplateField HeaderText="Số hộ chiếu cũ">
            <ItemTemplate>
                <%# Eval("C_HOCHIEUCU")%>
            </ItemTemplate>
        </asp:TemplateField>
        

        <asp:TemplateField HeaderText="Số hộ chiếu mới">
            <ItemTemplate>
                <%# Eval("C_HOCHIEUMOI")%>
            </ItemTemplate>
        </asp:TemplateField>
        
         <asp:TemplateField HeaderText="Số điện thoại">
            <ItemTemplate>
                <%# Eval("C_DIENTHOAI1")%> / <%# Eval("C_DIENTHOAI2")%>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Số CMND Việt Nam">
            <ItemTemplate>
                <%# Eval("C_CMNDVN")%>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Số CMND nước ngoài">
            <ItemTemplate>
                <%# Eval("C_CMNDNN")%>
            </ItemTemplate>
        </asp:TemplateField>

        

        <asp:TemplateField HeaderText="Ngày đăng ký">
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
    SelectCommand="SELECT * from T_DANGKY_DAOTAONGHE order by PK_KHOAHOC desc"></asp:SqlDataSource>