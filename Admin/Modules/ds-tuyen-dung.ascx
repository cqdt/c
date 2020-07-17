<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ds-tuyen-dung.ascx.cs" Inherits="Admin_Modules_ds_tuyen_dung" %>



<center>
    <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>

<br />
<table border="0" width="100%">
  <tr>
     <td align="center" bgcolor="#e4f2fe" colspan="3" height="30">
      <b>Danh sách đăng ký tuyển dụng lao động</b>
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

<asp:GridView ID="gvList" Width="100%" runat="server" DataKeyNames="PK_TUYENDUNG"
    AutoGenerateColumns="False" AllowPaging="false" PageSize="20" AllowSorting="false"
    OnRowCreated="gvList_RowCreated" DataSourceID="ListRegisterDataSource">
    <Columns>
        <asp:TemplateField HeaderText="STT">
            <ItemTemplate>
            </ItemTemplate>
            <ItemStyle Width="10px" />
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="Tên công ty">
            <ItemTemplate>
                <%# Eval("C_TENCTY")%>
            </ItemTemplate>
        </asp:TemplateField>
       
        <asp:TemplateField HeaderText="Ngành nghề, lĩnh vực hoạt động">
            <ItemTemplate>
                <%# Eval("C_NGANHNGHE")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Địa chỉ">
            <ItemTemplate>
                <%# Eval("C_DIACHI")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Số điện thoại">
            <ItemTemplate>
                <%# Eval("C_DIENTHOAI")%>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Email hoặc Website">
            <ItemTemplate>
                <%# Eval("C_EMAIL")%>
            </ItemTemplate>
        </asp:TemplateField>
        
         <asp:TemplateField HeaderText="Vị trí tuyển dụng">
            <ItemTemplate>
                <%# Eval("C_VITRI")%>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Điều kiện tuyển dụng">
            <ItemTemplate>
                <%# Eval("C_DIEUKIEN")%>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Yêu cầu công việc">
            <ItemTemplate>
                <%# Eval("C_YEUCAU")%>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Số lượng cần tuyển">
            <ItemTemplate>
                <%# Eval("C_SOLUONG")%>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Thu nhập và chế độ đãi ngộ">
            <ItemTemplate>
                <%# Eval("C_THUNHAP")%>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Hồ sơ dự tuyển gồm có">
            <ItemTemplate>
                <%# Eval("C_HOSO")%>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Thời gian nhận hồ sơ">
            <ItemTemplate>
                <%# Eval("C_THOIGIANNHAN")%>
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
    SelectCommand="SELECT * from T_TUYENDUNG order by PK_TUYENDUNG desc"></asp:SqlDataSource>