<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Advs.ascx.cs" Inherits="Admin_Modules_Advs" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 


<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>

<table border="0" width="100%">
  <tr>
     <td>
         Vị trí hiển thị : 
         <asp:DropDownList ID="ddlType" AutoPostBack="true" runat="server">
				    <asp:ListItem Text="Đối tác" Value="CLIENT"></asp:ListItem>
				    <asp:ListItem Text="Bên phải" Value="RIGHT"></asp:ListItem>		
				     <asp:ListItem Text="Banner giữa" Value="CENTER"></asp:ListItem>			   
				 </asp:DropDownList>
     </td>
     <td style="text-align:right">
       Ngôn ngữ : <asp:DropDownList ID="ddlLang" DataSourceID="LangDataSource" DataTextField="C_TITLE" DataValueField="PK_LANG" runat="server" AutoPostBack="true" ></asp:DropDownList>
     </td>
  </tr>
</table>

<asp:GridView ID="gvAdvs"  Width="100%" runat="server" DataKeyNames="PK_ADV" AutoGenerateColumns="False" DataSourceID="AdvsDataSource" AllowPaging="True" PageSize="20" AllowSorting="false" OnPreRender="gvAdvs_PreRender">
    <Columns>
        <asp:TemplateField>
           <ItemTemplate>
             <input name="chkAdvs" class="checkbox" type="checkbox" value="<%# Eval("PK_ADV") %>" />
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
              <a href="Default.aspx?ctl=Adv&fID=<%# Eval("PK_ADV") %>&Page=<%= gvAdvs.PageIndex %>&LangID=<%= ddlLang.SelectedValue %>"><img src="Images/Edit.png" border="0" alt="" /></a>
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="T&#234;n">
           <ItemTemplate>
              <a class="Link" href="Default.aspx?ctl=Adv&fID=<%# Eval("PK_ADV") %>&Page=<%= gvAdvs.PageIndex %>&LangID=<%= ddlLang.SelectedValue %>"><%# Eval("C_NAME")%></a>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Thứ tự">
           <ItemTemplate>
              <%# Eval("C_ORDER") %>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Hình ảnh">
           <ItemTemplate>
              <%# CMS.TTV.Web.Utils.CreateLink(Eval("C_IMAGE_FILE_NAME"),100,120,0,"",false) %>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="URL">
           <ItemTemplate>
              <a href="<%# Eval("C_LINK") %>" target="_blank"><%# Eval("C_LINK") %></a>
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
<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkAdvs" runat="server" />


<center>
   <asp:Button ID="btnInsert" runat="server" Text="Thêm mới" OnClick="btnInsert_Click"  />
   &nbsp;&nbsp;
   <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
   &nbsp;&nbsp;
   <asp:Button ID="btnSetStatus" runat="server" Text="Hiển thị quảng cáo" OnClick="btnSetStatus_Click"  />
   &nbsp;&nbsp;
   <asp:Button ID="btnUnSetStatus" runat="server" Text="Bỏ hiển thị quảng cáo" OnClick="btnUnSetStatus_Click"  />
</center>

<br />

<asp:SqlDataSource ID="AdvsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT T_ADV.* FROM T_ADV WHERE FK_LANG=@FK_LANG AND C_TYPE=@C_TYPE ORDER BY C_ORDER DESC">
   <SelectParameters>
       <asp:ControlParameter Name="FK_LANG" ControlID="ddlLang" DefaultValue="1" Type="Int32" />
       <asp:ControlParameter Name="C_TYPE" ControlID="ddlType" DefaultValue="" Type="String" />
   </SelectParameters>
</asp:SqlDataSource>


<asp:SqlDataSource ID="LangDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_LANG,C_TITLE FROM T_LANG"   
    >
</asp:SqlDataSource>