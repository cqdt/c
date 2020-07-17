<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Gallerys.ascx.cs" Inherits="Admin_Modules_Gallerys" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 


<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>

<table border="0" width="100%">
  <tr>
     <td style="text-align:left">
        Nhóm : <CMS:DropDownList ID="ddlMenu" Type="GALLERY" LText="Tất cả" CssClass="ddlMenu" FieldValue="PK_MENU" TableName="T_MENU" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlMenu_SelectedIndexChanged" Width="170px"></CMS:DropDownList>
        Trạng thái : 
        <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true">
            <asp:ListItem Value="-1" Text="Tất cả"></asp:ListItem>
            <asp:ListItem Value="1" Text="Hiển thị"></asp:ListItem>
            <asp:ListItem Value="0" Text="Chưa hiển thị"></asp:ListItem>
        </asp:DropDownList>
        Tiêu đề : 
        <asp:TextBox ID="txtTitle" runat="server" Width="90px"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" />
     </td>
  </tr>
</table>

<asp:GridView ID="gvGallerys" Width="100%" runat="server" DataKeyNames="PK_GALLERY" AutoGenerateColumns="False" DataSourceID="GallerysDataSource" AllowPaging="True" PageSize="20" AllowSorting="False" OnPreRender="gvGallerys_PreRender">
    <Columns>
        <asp:TemplateField>
           <ItemTemplate>
             <input name="chkGallerys" class="checkbox" type="checkbox" value="<%# Eval("PK_GALLERY") %>" />
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>       
        <asp:TemplateField HeaderText="Sửa" SortExpression="PK_GALLERY" >
           <ItemTemplate>
              <a href="Default.aspx?ctl=Gallery&aID=<%# Eval("PK_GALLERY") %>&PageSize=<%= ddlPageSize.SelectedValue %>&Page=<%= gvGallerys.PageIndex %>&MenuID=<%= ddlMenu.SelectedValue %>"><img src="Images/Edit.png" border="0" alt="" /></a>
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ảnh" SortExpression="C_FILE" >
           <ItemTemplate>
              <%# CMS.TTV.Web.Utils.CreateLink(Eval("C_FILE"), 50,50,0,"",false)%>
           </ItemTemplate>
           <ItemStyle Width="50px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Tên" SortExpression="C_NAME" >
           <ItemTemplate>
              <a class="Link" href="Default.aspx?ctl=Gallery&aID=<%# Eval("PK_GALLERY") %>&PageSize=<%= ddlPageSize.SelectedValue %>&Page=<%= gvGallerys.PageIndex %>&MenuID=<%= ddlMenu.SelectedValue %>"><%# Eval("C_NAME")%></a>
               &nbsp;
               <%# HighLight(Eval("C_HOT")) %>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Danh mục" SortExpression="MENU_NAME" >
           <ItemTemplate>
              <%# Eval("MENU_NAME")%>
           </ItemTemplate>
           <ItemStyle Width="100px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Thứ tự">
           <ItemTemplate>
              <%# Eval("C_ORDER") %>
           </ItemTemplate>
           <ItemStyle Width="50px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngày tạo" SortExpression="C_ENTRY_DATE" >
           <ItemTemplate>
              <%# Eval("C_ENTRY_DATE", "{0:dd/MM/yyyy}")%>
           </ItemTemplate>
           <ItemStyle Width="60px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngày sửa" SortExpression="C_MODIFY_DATE" >
           <ItemTemplate>
              <%# Eval("C_MODIFY_DATE", "{0:dd/MM/yyyy}")%>
           </ItemTemplate>
           <ItemStyle Width="60px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Trạng thái" SortExpression="C_STATUS" >
           <ItemTemplate>
              <CMS:Status ID="Status1" ActiveText="Hiển thị" InActiveText="Chưa hiển thị" Value='<%# Eval("C_STATUS") %>' runat="server"></CMS:Status>
           </ItemTemplate>
           <ItemStyle Width="80px" />
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkGallerys" runat="server" />
&nbsp;&nbsp;
Hiển thị : 
    <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
        <asp:ListItem Value="5" Text="5"></asp:ListItem>
        <asp:ListItem Value="10" Selected="True" Text="10"></asp:ListItem>
        <asp:ListItem Value="20" Text="20"></asp:ListItem>
        <asp:ListItem Value="50" Text="50"></asp:ListItem>
        <asp:ListItem Value="100" Text="100"></asp:ListItem>
    </asp:DropDownList>  ảnh / 1 trang&nbsp;<br />
<br />



<center>
   <asp:Button ID="btnInsert" runat="server" Text="Thêm mới" OnClick="btnInsert_Click"  />
   &nbsp;
   <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
    &nbsp;
   <asp:Button ID="btnSetHighLight" runat="server" Text="Phân loại" OnClick="btnSetHighLight_Click"  />
   &nbsp;
   <asp:Button ID="btnUnSetHighLight" runat="server" Text="Bỏ phân loại" OnClick="btnUnSetHighLight_Click"   />
    &nbsp;
   <asp:Button ID="btnSetStatus" runat="server" Text="Hiển thị" OnClick="btnSetStatus_Click"  />
    &nbsp;
   <asp:Button ID="btnUnSetStatus" runat="server" Text="Bỏ hiển thị" OnClick="btnUnSetStatus_Click"  />
</center>



<asp:SqlDataSource ID="GallerysDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT T_GALLERY.*,T_MENU.C_NAME AS MENU_NAME FROM T_GALLERY,T_MENU WHERE T_GALLERY.FK_MENU=T_MENU.PK_MENU AND (T_GALLERY.FK_MENU=@FK_MENU OR @FK_MENU=0 OR @FK_MENU=2) AND ((@C_STATUS = -1) OR (@C_STATUS in (0, 1) AND T_GALLERY.C_STATUS = @C_STATUS)) AND (T_GALLERY.C_NAME LIKE '%' + @C_NAME + '%') ORDER BY T_GALLERY.C_ORDER">
  <SelectParameters>
      <asp:ControlParameter Name="FK_MENU" ControlID="ddlMenu" DefaultValue="0" Type="Int32" />
      <asp:ControlParameter Name="C_STATUS" Type="Int32" ControlID="ddlStatus" DefaultValue="-1" />
      <asp:ControlParameter Name="C_NAME" Type="String" ControlID="txtTitle" PropertyName="Text" ConvertEmptyStringToNull="False" />
   </SelectParameters>
</asp:SqlDataSource>