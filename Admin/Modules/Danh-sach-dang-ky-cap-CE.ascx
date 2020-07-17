<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Danh-sach-dang-ky-cap-CE.ascx.cs"
    Inherits="Admin_Modules_Danh_sach_dang_ky_cap_CE" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %>
<%@ Register Assembly="RadEditor.Net2" Namespace="Telerik.WebControls" TagPrefix="radE" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<center>
    <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>
<table border="0" width="100%">
    <tr>
        <td align="center">
            <b>Thống kê - Danh sách đăng ký cấp chứng chỉ CE</b>
        </td>
    </tr>
</table>
<br />
<table border="0" width="100%">
    <tr>
        <td>
            Trung tâm đào tạo:
            <asp:DropDownList ID="ddlNganh" DataSourceID="nganhDataSource" DataTextField="C_TEN"
                DataValueField="C_MA" runat="server" AutoPostBack="True" OnDataBound="ddlNganh_DataBound"
                OnSelectedIndexChanged="ddlNganh_SelectedIndexChanged" Width="200">
            </asp:DropDownList>
        </td>
        <td style="text-align: left">
            Ngày cấp chứng chỉ từ :
            <radCln:RadDatePicker  MinDate="1900-01-01" ID="raddTungay" Width="89" runat="server">
            </radCln:RadDatePicker>
            đến :
            <radCln:RadDatePicker  MinDate="1900-01-01" ID="raddDenngay" Width="89" runat="server">
            </radCln:RadDatePicker>
            <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" OnClick="btnSearch_Click" />
        </td>
    </tr>
</table>
<asp:GridView ID="gvListRegister" Width="100%" runat="server" DataKeyNames="PK_CE"
    AutoGenerateColumns="False" AllowPaging="True" PageSize="20" AllowSorting="false"
    OnRowCreated="gvListRegister_RowCreated">
    <Columns>
        <asp:TemplateField HeaderText="STT">
            <ItemTemplate>
            </ItemTemplate>
            <ItemStyle Width="10px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="#">
            <ItemTemplate>
                <input name="chkFAQs" class="checkbox" type="checkbox" value="<%# Eval("PK_CE") %>" />
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
                <%# Eval("C_NGAY_SINH", "{0:MM/dd/yyyy}")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Số hộ chiếu">
            <ItemTemplate>
                <%# Eval("C_SO_HO_CHIEU")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Trung tâm đào tạo">
            <ItemTemplate>
                <%# Eval("C_TRUNG_TAM_DT")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngày cấp">
            <ItemTemplate>
                <%# Eval("C_NGAY_CAP", "{0:MM/dd/yyyy}")%>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td align="left">
            <CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkFAQs" runat="server" />
            &nbsp;&nbsp; Hiển thị :
            <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
                <asp:ListItem Value="5" Text="5"></asp:ListItem>
                <asp:ListItem Value="10" Selected="True" Text="10"></asp:ListItem>
                <asp:ListItem Value="20" Text="20"></asp:ListItem>
                <asp:ListItem Value="50" Text="50"></asp:ListItem>
                <asp:ListItem Value="100" Text="100"></asp:ListItem>
            </asp:DropDownList>
        </td>
        <td align="right">
            Tổng số: <span style="font-weight: bold">
                <% =total %></span>
        </td>
        <td width="10">
        </td>
    </tr>
</table>
<br />
<center>
    &nbsp;<asp:Button ID="btnExportExcel" runat="server" Text="Xuất ra file Excel" OnClick="btnExportExcel_Click" />
</center>
<asp:SqlDataSource ID="ListRegisterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT * from T_CAP_CE"></asp:SqlDataSource>
<asp:SqlDataSource ID="nganhDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT * FROM T_TT where C_STATUS=1"></asp:SqlDataSource>
