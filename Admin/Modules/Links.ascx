<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Links.ascx.cs" Inherits="Admin_Modules_Links" %>
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


<asp:GridView ID="gvLinks"  Width="100%" runat="server" DataKeyNames="PK_LINK" AutoGenerateColumns="False" DataSourceID="LinksDataSource" AllowPaging="True" PageSize="20" AllowSorting="false" OnPreRender="gvLinks_PreRender">
    <Columns>
        <asp:TemplateField>
           <ItemTemplate>
             <input name="chkLinks" class="checkbox" type="checkbox" value="<%# Eval("PK_LINK") %>" />
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
              <a href="Default.aspx?ctl=Link&lID=<%# Eval("PK_LINK") %>&Page=<%= gvLinks.PageIndex %>&LangID=<%= ddlLang.SelectedValue %>"><img src="Images/Edit.png" border="0" alt="" /></a>
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Logo">
           <ItemTemplate>
              <%# CMS.TTV.Web.Utils.CreateLink(Eval("C_IMAGE_FILE_NAME"),80,0,0,"",true) %>
           </ItemTemplate>
        </asp:TemplateField>


        <asp:TemplateField HeaderText="T&#234;n liên kết">
           <ItemTemplate>
              <a class="Link" href="Default.aspx?ctl=Link&lID=<%# Eval("PK_LINK") %>&Page=<%= gvLinks.PageIndex %>&LangID=<%= ddlLang.SelectedValue %>"><%# Eval("C_NAME")%></a>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="URL">
           <ItemTemplate>
             <a href="<%# Eval("C_LINK")%>" target="_blank"><%# Eval("C_LINK")%></a>
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
           <ItemStyle Width="70px" />
        </asp:TemplateField>
    </Columns>
</asp:GridView>


<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkLinks" runat="server" />


<center>
   <asp:Button ID="btnInsert" runat="server" Text="Thêm mới" OnClick="btnInsert_Click"  />
   &nbsp; 
   <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ" OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
   &nbsp;
   <asp:Button ID="btnSetStatus" runat="server" Text="Hiển thị" OnClick="btnSetStatus_Click"  />
    &nbsp;
   <asp:Button ID="btnUnSetStatus" runat="server" Text="Bỏ hiển thị" OnClick="btnUnSetStatus_Click"  />
</center>



<asp:SqlDataSource ID="LinksDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT * FROM T_LINK WHERE FK_LANG=@FK_LANG ORDER BY C_ORDER">
   <SelectParameters>
      <asp:ControlParameter Name="FK_LANG" ControlID="ddlLang" DefaultValue="0" Type="Int32" />
   </SelectParameters>
</asp:SqlDataSource>


<asp:SqlDataSource ID="LangDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_LANG,C_TITLE FROM T_LANG"   
    >
</asp:SqlDataSource>