<%@ Control Language="C#" AutoEventWireup="true" CodeFile="phien-gdvl.ascx.cs" Inherits="Admin_Modules_phien_gdvl" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 

<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>

<asp:GridView ID="gvAVotes"  Width="100%" runat="server" DataKeyNames="ID" AutoGenerateColumns="False" 
DataSourceID="AVotesDataSource" AllowPaging="True" PageSize="20" AllowSorting="false">
    <Columns>
        <asp:TemplateField>
           <ItemTemplate>
             <input name="chkAVotes" class="checkbox" type="checkbox" value="<%# Eval("ID") %>" />
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
              <a href="Default.aspx?ctl=phien-gdvl-detail&fID=<%# Eval("ID") %>"><img src="Images/Edit.png" border="0" alt="" /></a>
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Import công ty" >
           <ItemTemplate>
              <a href="Default.aspx?ctl=import-cty&fID=<%# Eval("ID") %>"><img src="Images/import.png" width="18" border="0" alt="" /></a>
           </ItemTemplate>
           <ItemStyle Width="90px" />
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Phiên GDVL">
           <ItemTemplate>
             <a href="Default.aspx?ctl=import-cty&fID=<%# Eval("ID") %>">  <%# Eval("C_PHIEN")%></a>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngày tạo phiên">
           <ItemTemplate>              
               <%# Eval("C_NGAY", "{0:dd/MM/yyyy}")%>
           </ItemTemplate>
        </asp:TemplateField>        
        
    </Columns>
</asp:GridView>
<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkAVotes" runat="server" />

<center>
   <asp:Button ID="btnInsert" runat="server" Text="Thêm mới" OnClick="btnInsert_Click"  />
   &nbsp;&nbsp;
   <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
   &nbsp;&nbsp;
  <asp:Button ID="btnExport" runat="server" Text="Xuất danh sách người lao động tham gia phiên" OnClick="btnExport_Click"  />
</center>

<br />

<asp:SqlDataSource ID="AVotesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT * FROM T_PHIEN_GDVL ORDER BY ID DESC">  
</asp:SqlDataSource>
