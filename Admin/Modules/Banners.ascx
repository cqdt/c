<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Banners.ascx.cs" Inherits="Admin_Modules_Banners" %>
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


<asp:GridView ID="gvBanners"  Width="100%" runat="server" DataKeyNames="PK_BANNER" AutoGenerateColumns="False" DataSourceID="BannersDataSource" AllowPaging="True" PageSize="20" AllowSorting="false">
    <Columns>
        <asp:TemplateField HeaderText="Sửa" >
           <ItemTemplate>
              <a href="Default.aspx?ctl=Banner&bID=<%# Eval("PK_BANNER") %>&Page=<%= gvBanners.PageIndex %>"><img src="Images/Edit.png" border="0" alt="" /></a>
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ảnh">
           <ItemTemplate>
              <a class="Link" href="Default.aspx?ctl=Banner&bID=<%# Eval("PK_BANNER") %>&Page=<%= gvBanners.PageIndex %>"><%# CMS.TTV.Web.Utils.CreateLink(Eval("C_IMAGE_FILE_NAME"), 500,70,0,"",true)%></a>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="URL">
           <ItemTemplate>
              <a href="<%# Eval("C_LINK") %>" target="_blank"><%# Eval("C_LINK") %></a>
           </ItemTemplate>
        </asp:TemplateField>
          <asp:TemplateField HeaderText="Cỡ ảnh">
           <ItemTemplate>
              <%# Eval("C_SIZE")%>
           </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>



<asp:SqlDataSource ID="BannersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT * FROM T_BANNER WHERE FK_LANG=@FK_LANG">
   <SelectParameters>
       <asp:ControlParameter Name="FK_LANG" ControlID="ddlLang" DefaultValue="0" Type="Int32" />
   </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="LangDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_LANG,C_TITLE FROM T_LANG"   
    >
</asp:SqlDataSource>