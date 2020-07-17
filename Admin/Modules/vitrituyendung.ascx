<%@ Control Language="C#" AutoEventWireup="true" CodeFile="vitrituyendung.ascx.cs"  Inherits="Admin_Modules_vitrituyendung" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %>
<center>
    <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>
<br />
<table border="0" width="100%">
    <tr>
        <td align="center" bgcolor="#e4f2fe" colspan="3" height="30">
            <b>Vị trí tuyển dụng</b>
        </td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td width="230" runat="server">
            Chọn công ty:
            <asp:DropDownList ID="ddlCongty" runat="server" Width="145">
            </asp:DropDownList>
        </td>
        <td>
            <asp:Button ID="btnTimkiem" runat="server" Text="Tìm kiếm" OnClick="btnTimkiem_Click" />
        </td>
        <td align="right">
            Tổng số: <span style="font-weight: bold">
                <% =total %></span>
        </td>
        <td width="10">
        </td>
    </tr>
</table>
<asp:GridView ID="gvList" Width="100%" runat="server" DataKeyNames="ID" AutoGenerateColumns="False"
    AllowPaging="true" PageSize="20" AllowSorting="false" OnRowCreated="gvList_RowCreated"
    OnPageIndexChanging="gvList_PageIndexChanging">
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <input name="chkGallerys" class="checkbox" type="checkbox" value="<%# Eval("ID") %>" />
            </ItemTemplate>
            <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="STT">
            <ItemTemplate>
            </ItemTemplate>
            <ItemStyle Width="10px" />
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
<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkGallerys" runat="server" />
&nbsp;&nbsp; Hiển thị :
<asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
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
    <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ" OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');"
        OnClick="btnDelete_Click" />
</center>
