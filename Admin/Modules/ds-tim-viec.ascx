<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ds-tim-viec.ascx.cs" Inherits="Admin_Modules_ds_tim_viec" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 
<center>
    <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>

<br />
<table border="0" width="100%">
  <tr>
     <td align="center" bgcolor="#e4f2fe" colspan="3" height="30">
      <b>Danh sách đăng ký tìm việc trong nước</b>
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

<asp:GridView ID="gvList" Width="100%" runat="server" DataKeyNames="PK_TIMVIEC"
    AutoGenerateColumns="False" AllowPaging="true" PageSize="20" AllowSorting="false"
    OnRowCreated="gvList_RowCreated" DataSourceID="ListRegisterDataSource">
    <Columns>
       <asp:TemplateField>
           <ItemTemplate>
             <input name="chkGallerys" class="checkbox" type="checkbox" value="<%# Eval("PK_TIMVIEC") %>" />
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>    
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
        <asp:TemplateField HeaderText="Giới tính">
            <ItemTemplate>
                <%# Eval("C_GIOITINH")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Địa chỉ gửi thư">
            <ItemTemplate>
                <%# Eval("C_DIACHIGUITHU")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Địa chỉ Email">
            <ItemTemplate>
                <%# Eval("C_EMAIL")%>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Điện thoại liên hệ">
            <ItemTemplate>
                <%# Eval("C_DIENTHOAI")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngày xuất cảnh">
            <ItemTemplate>
                <%# Eval("C_NGAYXUATCANH", "{0:dd/MM/yyyy}")%>
            </ItemTemplate><ItemStyle Width="80px" />
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Ngày về nước">
            <ItemTemplate>
                <%# Eval("C_NGAYVENUOC", "{0:dd/MM/yyyy}")%>
            </ItemTemplate><ItemStyle Width="80px" />
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Tên chương trình đã tham gia">
            <ItemTemplate>
                <%# Eval("C_TRINHDO")%>
            </ItemTemplate>
        </asp:TemplateField>

          <asp:TemplateField HeaderText="Công việc mong muốn">
            <ItemTemplate>
                <%# Eval("C_CONGVIECMONGMUON")%>
            </ItemTemplate>
        </asp:TemplateField>


         <asp:TemplateField HeaderText="Mức lương mong muốn">
            <ItemTemplate>
                <%# Eval("C_MUCLUONG")%>
            </ItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Địa chỉ làm việc mong muốn">
            <ItemTemplate>
                <%# Eval("C_DIACHILAMVIEC")%>
            </ItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Công việc cụ thể được giao khi làm việc tại nước ngoài">
            <ItemTemplate>
                <%# Eval("C_CONGVIECCUTHE")%>
            </ItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Thời gian làm việc">
            <ItemTemplate>
                <%# Eval("C_THOIGIANLAMVIEC")%>
            </ItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Ngành nghề được đào tạo">
            <ItemTemplate>
                <%# Eval("C_TENNUOC")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Bằng cấp">
            <ItemTemplate>
                <%# Eval("C_BANGCAP")%>
            </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Trình độ ngoại ngữ">
            <ItemTemplate>
                <%# Eval("C_NGOAINGU")%>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Ngày đăng ký">
            <ItemTemplate>
                <%# Eval("C_NGAYGUI", "{0:dd/MM/yyyy}")%>
            </ItemTemplate><ItemStyle Width="80px" />
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkGallerys" runat="server" />

&nbsp;&nbsp;
Hiển thị : 
    <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
        <asp:ListItem Value="5" Text="5"></asp:ListItem>
        <asp:ListItem Value="10" Text="10"></asp:ListItem>
        <asp:ListItem Value="20" Selected="True" Text="20"></asp:ListItem>
        <asp:ListItem Value="50" Text="50"></asp:ListItem>
        <asp:ListItem Value="1000" Text="1000"></asp:ListItem>
    </asp:DropDownList>  bản ghi / 1 trang&nbsp;<br />
<br />


<br />
<center>
    &nbsp;<asp:Button ID="btnExportExcel" runat="server" Text="Xuất ra file Excel" OnClick="btnExportExcel_Click" />
     &nbsp;
     <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
   
</center>

<asp:SqlDataSource ID="ListRegisterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT * from T_TIMVIEC order by PK_TIMVIEC desc"></asp:SqlDataSource>