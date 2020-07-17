<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Thong-ke-ky-hop-dong.ascx.cs"
    Inherits="Admin_Modules_Thong_ke_ky_hop_dong" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %>
<%@ Register Assembly="RadEditor.Net2" Namespace="Telerik.WebControls" TagPrefix="radE" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<center>
    <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>
<table border="0" width="100%">
    <tr>
        <td align="center">
            Thống kê - Danh sách người lao động được ký hợp đồng
        </td>
    </tr>
</table>
<br />
<table border="0" width="100%">
    <tr>
        <td style="text-align: left">
            Ngày tập trung từ :
            <radCln:RadDatePicker MinDate="1900-01-01" ID="raddTungay" Width="89" runat="server">
            </radCln:RadDatePicker>
            đến :
            <radCln:RadDatePicker MinDate="1900-01-01" ID="raddDenngay" Width="89" runat="server">
            </radCln:RadDatePicker>
            <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" OnClick="btnSearch_Click" />
        </td>
    </tr>
</table>
<asp:GridView ID="gvListLD" Width="100%" runat="server" DataKeyNames="PK_LD" AutoGenerateColumns="False"
    AllowPaging="True" PageSize="20" AllowSorting="false" OnRowCreated="gvListLD_RowCreated"
    OnPageIndexChanging="gvListLD_PageIndexChanging">
    <Columns>
        <asp:TemplateField HeaderText="STT">
            <ItemTemplate>
            </ItemTemplate>
            <ItemStyle Width="10px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="#">
            <ItemTemplate>
                <input name="chkFAQs" class="checkbox" type="checkbox" value="<%# Eval("PK_LD") %>" />
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
        <asp:TemplateField HeaderText="Số CMND">
            <ItemTemplate>
                <%# Eval("C_CMND")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Đơn vị">
            <ItemTemplate>
                <%# Eval("C_DON_VI")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Khoá học">
            <ItemTemplate>
                <%# Eval("C_KHOA_HOC")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngày tập trung">
            <ItemTemplate>
                <%# Eval("C_NGAY_TAP_TRUNG", "{0:dd/MM/yyyy}")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Địa điểm tập trung">
            <ItemTemplate>
                <%# Eval("C_DIA_DIEM")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Trạng th&#225;i" SortExpression="C_STATUS">
            <ItemTemplate>
                <asp:RadioButtonList ID="rblKho" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_STATUS") %>'>
                    <asp:ListItem Text="Hiện" Selected="True" Value="True"></asp:ListItem>
                    <asp:ListItem Text="Ẩn" Value="False"></asp:ListItem>
                </asp:RadioButtonList>
            </ItemTemplate>
            <ItemStyle Width="70px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Mã">
            <ItemTemplate>
                <asp:TextBox ID="txtSBD" BorderWidth="0" Text='<%# Eval("C_SBD")%>' Width="50px"
                    runat="server"></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkFAQs" runat="server" />
&nbsp;&nbsp; Hiển thị :
<asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
    <asp:ListItem Value="5" Text="5"></asp:ListItem>
    <asp:ListItem Value="10" Selected="True" Text="10"></asp:ListItem>
    <asp:ListItem Value="20" Text="20"></asp:ListItem>
    <asp:ListItem Value="50" Text="50"></asp:ListItem>
    <asp:ListItem Value="100" Text="100"></asp:ListItem>
</asp:DropDownList>
<center>
    <asp:Button ID="btnExportExcel" runat="server" Text="Xuất ra file Excel" OnClick="btnExportExcel_Click" />
    &nbsp;
    <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ" OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');"
        OnClick="btnDelete_Click" />
</center>
<br />
