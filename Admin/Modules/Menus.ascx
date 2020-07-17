<%@ Control Language="C#" AutoEventWireup="true" Inherits="CMS.TTV.Admin.Menus" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 
 

<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>
<table border="0" width="100%">
  <tr>
    <td style="text-align:left">
        <CMS:Map ID="cmsMapMenus" CssClass="Link" runat="server" ModuleName="menus" ModuleText="Chuyên mục" FieldValue="PK_MENU" TableName="T_MENU" /> 
     </td>
     <td style="text-align:right">
       Ngôn ngữ : <asp:DropDownList ID="ddlLang" DataSourceID="LangDataSource" DataTextField="C_TITLE" DataValueField="PK_LANG" runat="server" AutoPostBack="true"></asp:DropDownList>
     </td>
  </tr>
</table>
<asp:GridView ID="gvMenus"  Width="100%" runat="server" DataKeyNames="PK_MENU" AutoGenerateColumns="False" DataSourceID="MenusDataSource" AllowPaging="True" PageSize="200" AllowSorting="false" OnPreRender="gvMenus_PreRender">
    <Columns>
        <asp:TemplateField>
           <ItemTemplate>
             <input name="chkMenus" class="checkbox" type="checkbox" value="<%# Eval("PK_MENU") %>" />
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
         <asp:TemplateField>
           <ItemTemplate>
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Sửa" >
           <ItemTemplate>
              <a href="Default.aspx?ctl=Menu&LangID=<%# Eval("FK_LANG") %>&pID=<%# Eval("C_PARENT") %>&mID=<%# Eval("PK_MENU") %>"><img src="Images/Edit.png" border="0" alt="" /></a>
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="T&#234;n chuy&#234;n mục">
           <ItemTemplate>
              <a class="Link" href="Default.aspx?ctl=Menus&pID=<%# Eval("PK_MENU") %>"><%# Eval("C_NAME") %></a>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Link" SortExpression="C_LINK" >
           <ItemTemplate>
           <%# Eval("C_LINK")%>
           </ItemTemplate>
           
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="Thứ tự">
           <ItemTemplate>
              <%# Eval("C_ORDER") %>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Trạng th&#225;i">
           <ItemTemplate>
              <CMS:Status ID="Status1" ActiveText="Hiển thị" InActiveText="Chưa hiển thị" Value='<%# Eval("C_STATUS") %>' runat="server"></CMS:Status>
           </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkMenus" runat="server" />

<center>
   <asp:Button ID="btnInsert" runat="server" Text="Thêm mới" OnClick="btnInsert_Click"  />
   &nbsp; &nbsp;&nbsp;
   <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
</center>



<asp:SqlDataSource ID="MenusDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_MENU,C_NAME,C_LINK,C_ORDER,C_STATUS,C_PARENT,FK_LANG FROM T_MENU WHERE C_PARENT=@C_PARENT AND FK_LANG=@FK_LANG ORDER BY C_ORDER">
    <SelectParameters>
       <asp:QueryStringParameter Name="C_PARENT" QueryStringField="pID" DefaultValue="0" Type="Int32" />
       <asp:ControlParameter Name="FK_LANG" ControlID="ddlLang" DefaultValue="0" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="LangDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_LANG,C_TITLE FROM T_LANG"   
    >
</asp:SqlDataSource>