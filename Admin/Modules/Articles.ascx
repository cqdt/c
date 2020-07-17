<%@ Control Language="C#" AutoEventWireup="true" Inherits="CMS.TTV.Admin.Articles" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 
 

<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>

<table border="0" width="100%">
  <tr>
    <td style="text-align:left">
        <CMS:DropDownList ID="ddlMenus" Type="ARTICLE" LText="Tất cả" CssClass="ddlMenu" FieldValue="PK_MENU" TableName="T_MENU" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlMenus_SelectedIndexChanged" Width="170px"></CMS:DropDownList>
        Trạng thái: 
        <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true">
            <asp:ListItem Value="-1" Text="Tất cả"></asp:ListItem>
            <asp:ListItem Value="1" Text="Hiển thị"></asp:ListItem>
            <asp:ListItem Value="0" Text="Chưa hiển thị"></asp:ListItem>
        </asp:DropDownList>
        Tiêu đề tin: 
        <asp:TextBox ID="txtTitle" runat="server" Width="90px"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" />
     </td>
     <td style="text-align:right">
       Ngôn ngữ: <asp:DropDownList ID="ddlLang" DataSourceID="LangDataSource" DataTextField="C_TITLE" DataValueField="PK_LANG" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLang_SelectedIndexChanged"></asp:DropDownList>
     </td>
  </tr>
</table>

<asp:GridView ID="gvArticles"  Width="100%" runat="server" DataKeyNames="PK_ARTICLE" AutoGenerateColumns="False" DataSourceID="ArticlesDataSource" AllowPaging="True" PageSize="50" AllowSorting="false" OnRowCreated="gvArticles_RowCreated" OnPreRender="gvArticles_PreRender" >
    <Columns>
        <asp:TemplateField HeaderText="STT" >
           <ItemTemplate>
           </ItemTemplate>
           <ItemStyle Width="10px" />
        </asp:TemplateField >
        <asp:TemplateField HeaderText="#" >
           <ItemTemplate>
             <input name="chkArticles" class="checkbox" type="checkbox" value="<%# Eval("PK_ARTICLE") %>" />
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField>
           <ItemTemplate>
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Sửa" SortExpression="PK_ARTICLE">
           <ItemTemplate>
              <a href="Default.aspx?ctl=Article&MenuID=<%= ddlMenus.SelectedValue %>&aID=<%# Eval("PK_ARTICLE") %>&PageSize=<%= ddlPageSize.SelectedValue %>&Page=<%= gvArticles.PageIndex %>"><img src="Images/Edit.png" border="0" alt="" /></a>
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Tiêu đề tin bài" SortExpression="C_TITLE">
           <ItemTemplate>
              &nbsp;
              <a class="Link" href="Default.aspx?ctl=Article&MenuID=<%= ddlMenus.SelectedValue %>&aID=<%# Eval("PK_ARTICLE") %>&PageSize=<%= ddlPageSize.SelectedValue %>&Page=<%= gvArticles.PageIndex %>"><%# Eval("C_TITLE")%></a>
              &nbsp;
              <%# HighLight(Eval("C_HOT")) %>
           </ItemTemplate>
           <ItemStyle HorizontalAlign="Left" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Thứ tự" SortExpression="C_ORDER">
           <ItemTemplate>
              <%# Eval("C_ORDER")%>
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Người đăng" SortExpression="FK_USER">
           <ItemTemplate>
              <CMS:Label ID="lblUser" runat="server" TableName="T_USER" PkColumn="PK_USER" PkVColumn='<%# Eval("FK_USER") %>' Column="C_LOGIN_NAME"></CMS:Label>
           </ItemTemplate>
           <ItemStyle Width="70px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngày đăng" SortExpression="C_ENTRY_DATE">
           <ItemTemplate>
              <%# Eval("C_ENTRY_DATE", "{0:dd/MM/yyyy}")%>
           </ItemTemplate>
           <ItemStyle Width="70px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Người sửa" SortExpression="FK_USER_EDIT">
           <ItemTemplate>
              <CMS:Label ID="lblUserEdit" runat="server" TableName="T_USER" PkColumn="PK_USER" PkVColumn='<%# Eval("FK_USER_EDIT") %>' Column="C_LOGIN_NAME"></CMS:Label>
           </ItemTemplate>
           <ItemStyle Width="70px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngày sửa" SortExpression="C_MODIFY_DATE">
           <ItemTemplate>
              <%# Eval("C_MODIFY_DATE", "{0:dd/MM/yyyy}")%>
           </ItemTemplate>
           <ItemStyle Width="70px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngày bắt đầu" SortExpression="C_BEGIN_DATE">
           <ItemTemplate>
              <%# Eval("C_BEGIN_DATE","{0:dd/MM/yyyy  HH:mm}")%>
           </ItemTemplate>
           <ItemStyle Width="70px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngày kết thúc" SortExpression="C_END_DATE">
           <ItemTemplate>
              <%# Eval("C_END_DATE", "{0:dd/MM/yyyy  HH:mm}")%>
           </ItemTemplate>
           <ItemStyle Width="70px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Trạng th&#225;i" SortExpression="C_STATUS">
           <ItemTemplate>
              <CMS:Status ID="Status1" ActiveText="Hiển thị" InActiveText="Chưa hiển thị" Value='<%# Eval("C_STATUS") %>' runat="server"></CMS:Status>
           </ItemTemplate>
           <ItemStyle Width="70px" />
        </asp:TemplateField>
    </Columns>
</asp:GridView>

<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkArticles" runat="server" />
&nbsp;&nbsp;
Hiển thị : 
    <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
        <asp:ListItem Value="5" Text="5"></asp:ListItem>
        <asp:ListItem Value="10" Text="10"></asp:ListItem>
        <asp:ListItem Value="20" Text="20"></asp:ListItem>
        <asp:ListItem Value="50" Selected="True" Text="50"></asp:ListItem>
        <asp:ListItem Value="100" Text="100"></asp:ListItem>
    </asp:DropDownList> 
tin bài / 1 trang

<br />
<br />
<center>
   <asp:Button ID="btnInsert" runat="server" Text="Thêm mới" OnClick="btnInsert_Click"  />
   &nbsp;
   <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
   &nbsp;
   <asp:Button ID="btnSetHighLight" runat="server" Text="Phân loại tin" OnClick="btnSetHighLight_Click"  />
   &nbsp;
   <asp:Button ID="btnUnSetHighLight" runat="server" Text="Bỏ phân loại tin" OnClick="btnUnSetHighLight_Click"   />
    &nbsp;
   <asp:Button ID="btnSetStatus" runat="server" Text="Hiển thị tin" OnClick="btnSetStatus_Click"  />
    &nbsp;
   <asp:Button ID="btnUnSetStatus" runat="server" Text="Bỏ hiển thị tin" OnClick="btnUnSetStatus_Click"  />
</center>

<br />

<% if(CMS.TTV.Rule.IsAdmin()){ %>
<center>
Chuyển người đăng mới : 
<asp:DropDownList ID="ddlUser" DataSourceID="UserDataSource" DataTextField="C_LOGIN_NAME" DataValueField="PK_USER" runat="server"></asp:DropDownList>
<asp:Button ID="btnSetNewUser" runat="server" Text="Chuyển người đăng mới" OnClick="btnSetNewUser_Click" />
</center>
<br />
<%} %>




<asp:SqlDataSource ID="ArticlesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT T_ARTICLE.* FROM T_ARTICLE,T_MENU WHERE (T_MENU.PK_MENU=T_ARTICLE.FK_MENU AND T_MENU.FK_LANG=@FK_LANG AND T_MENU.C_TYPE='ARTICLE') AND (T_ARTICLE.FK_MENU=@FK_MENU OR @FK_MENU=0) AND (1=(SELECT C_IS_ADMIN FROM T_USER WHERE PK_USER=@FK_USER) OR 1=(SELECT COUNT(FK_MENU) FROM T_USER_MENU WHERE FK_MENU=T_ARTICLE.FK_MENU AND FK_USER=@FK_USER)) AND ((@C_STATUS = -1) OR (@C_STATUS in (0, 1) AND T_ARTICLE.C_STATUS = @C_STATUS)) AND (T_ARTICLE.C_TITLE LIKE '%' + @C_TITLE + '%') ORDER BY T_ARTICLE.C_ORDER DESC">
    <SelectParameters>
       <asp:ControlParameter Name="FK_MENU" ControlID="ddlMenus" DefaultValue="0" Type="Int32" />
       <asp:ControlParameter Name="FK_LANG" ControlID="ddlLang" DefaultValue="0" Type="Int32" />
       <asp:ControlParameter Name="C_STATUS" Type="Int32" ControlID="ddlStatus" DefaultValue="-1" />
       <asp:ControlParameter Name="C_TITLE" Type="String" ControlID="txtTitle" PropertyName="Text" ConvertEmptyStringToNull="False" />
       <asp:Parameter Name="FK_USER" Type="int32" />
    </SelectParameters>
</asp:SqlDataSource>


<asp:SqlDataSource ID="LangDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
 SelectCommand="SELECT PK_LANG,C_TITLE FROM T_LANG">
</asp:SqlDataSource>


<asp:SqlDataSource ID="UserDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_USER,C_LOGIN_NAME FROM T_USER"   
    >
</asp:SqlDataSource>