<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ToQuotes.ascx.cs" Inherits="Admin_Modules_ToQuotes" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 


<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>

<table border="0" width="100%">
  <tr>
     <td style="text-align:right">
       Ngôn ngữ : <asp:DropDownList ID="ddlLang" DataSourceID="LangDataSource" DataTextField="C_TITLE" DataValueField="PK_LANG" runat="server" AutoPostBack="true" ></asp:DropDownList>
     </td>
  </tr>
</table>

<asp:GridView ID="gvToQuotes"  Width="100%" runat="server" DataKeyNames="PK_TOQUOTE" AutoGenerateColumns="False" DataSourceID="ToQuotesDataSource" AllowPaging="True" PageSize="20" AllowSorting="false" OnPreRender="gvToQuotes_PreRender">
    <Columns>
        <asp:TemplateField>
           <ItemTemplate>
             <input name="chkToQuotes" class="checkbox" type="checkbox" value="<%# Eval("PK_TOQUOTE") %>" />
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
              <a href="Default.aspx?ctl=ToQuote&fID=<%# Eval("PK_TOQUOTE") %>&Page=<%= gvToQuotes.PageIndex %>&LangID=<%= ddlLang.SelectedValue %>"><img src="Images/Edit.png" border="0" alt="" /></a>
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="T&#234;n">
           <ItemTemplate>
              <a class="Link" href="Default.aspx?ctl=ToQuote&fID=<%# Eval("PK_TOQUOTE") %>&Page=<%= gvToQuotes.PageIndex %>&LangID=<%= ddlLang.SelectedValue %>"><%# Eval("C_NAME")%></a>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Thứ tự">
           <ItemTemplate>
              <%# Eval("C_ORDER") %>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Download">
           <ItemTemplate>
              <asp:HyperLink ID="hlFileName" NavigateUrl='<%# Eval("C_FILE_NAME")%>' Target="_blank" runat="server"><%# Eval("C_FILE_NAME")%></asp:HyperLink>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Trạng th&#225;i">
           <ItemTemplate>
              <CMS:Status ID="Status1" ActiveText="Hiển thị" InActiveText="Chưa hiển thị" Value='<%# Eval("C_STATUS") %>' runat="server"></CMS:Status>
           </ItemTemplate>
           <ItemStyle Width="70px" />
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkToQuotes" runat="server" />


<center>
   <asp:Button ID="btnInsert" runat="server" Text="Thêm mới" OnClick="btnInsert_Click"  />
   &nbsp;&nbsp;
   <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
   &nbsp;&nbsp;
   <asp:Button ID="btnSetStatus" runat="server" Text="Hiển thị báo giá" OnClick="btnSetStatus_Click"  />
   &nbsp;&nbsp;
   <asp:Button ID="btnUnSetStatus" runat="server" Text="Bỏ hiển thị báo giá" OnClick="btnUnSetStatus_Click"  />
</center>

<br />

<asp:SqlDataSource ID="ToQuotesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT T_TOQUOTE.* FROM T_TOQUOTE WHERE FK_LANG=@FK_LANG ORDER BY C_ORDER DESC">
   <SelectParameters>
       <asp:ControlParameter Name="FK_LANG" ControlID="ddlLang" DefaultValue="1" Type="Int32" />
   </SelectParameters>
</asp:SqlDataSource>


<asp:SqlDataSource ID="LangDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_LANG,C_TITLE FROM T_LANG"   
    >
</asp:SqlDataSource>