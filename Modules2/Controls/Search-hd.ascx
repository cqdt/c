<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Search-hd.ascx.cs" Inherits="Modules_Controls_Search_hd" %>
<asp:Panel ID="pnSearchBDS" DefaultButton="btnTimkiemhd" runat="server">
    <asp:TextBox ID="txtSearch" Width="380" runat="server" CssClass="texbox5" Height="15px" onfocus="if(this.value=='Tìm kiếm câu hỏi...') this.value='';" onblur="if(this.value=='') this.value='Tìm kiếm câu hỏi...';" value="Tìm kiếm câu hỏi..."></asp:TextBox>
    <asp:DropDownList Width="160" Height="21" ID="ddlMenus" DataSourceID="FAQDataSource" CssClass="ddlfaq"
        DataTextField="C_NAME" DataValueField="PK_MENU" runat="server" OnDataBound="ddlMenus_DataBound">
    </asp:DropDownList>
    <asp:ImageButton ID="btnTimkiemhd" ImageUrl="~/Images/search.jpg" CssClass="image5"
        BorderWidth="0" OnClick="btnTimkiemhd_Click" runat="server" ToolTip="Search" />
</asp:Panel>
<asp:SqlDataSource ID="FAQDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT * FROM T_MENU where C_STATUS=1 and C_PARENT=283"></asp:SqlDataSource>
