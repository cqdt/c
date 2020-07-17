<%@ Control Language="C#" AutoEventWireup="true" CodeFile="module.ascx.cs" Inherits="Admin_Modules_module" %>
<asp:GridView ID="gvBanners"  Width="100%" runat="server" DataKeyNames="PK_MODULE" AutoGenerateColumns="False" DataSourceID="AdvsDataSource" AllowPaging="True" PageSize="20" AllowSorting="false">
    <Columns>
        <asp:TemplateField HeaderText="Sửa" >
           <ItemTemplate>
              <a href="Default.aspx?ctl=module1&fID=<%# Eval("PK_MODULE") %>"><img src="Images/Edit.png" border="0" alt="" /></a>
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Tên">
           <ItemTemplate>
             <%# Eval("C_NAME") %>
           </ItemTemplate>
        </asp:TemplateField>
          <asp:TemplateField HeaderText="Link">
           <ItemTemplate>
              <%# Eval("C_TYPE")%>
           </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

<center>
   <asp:Button ID="btnInsert" runat="server" Text="Thêm mới" OnClick="btnInsert_Click"  />
   
   </center>
   
   <asp:SqlDataSource ID="AdvsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT T_MODULE.* FROM T_MODULE">

</asp:SqlDataSource>