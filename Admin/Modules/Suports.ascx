<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Suports.ascx.cs" Inherits="Admin_Modules_Suports" %>

<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 


<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>

<table border="0" width="100%">
  <tr>
     <td>
       Danh sách nick yahoo hỗ trợ trực tuyến :       
     </td>
     <td style="text-align:right">
       
     </td>
  </tr>
</table>

<asp:GridView ID="gvSuports"  Width="100%" runat="server" DataKeyNames="PK_SUPORT" AutoGenerateColumns="False" DataSourceID="AdvsDataSource" AllowPaging="True" PageSize="20" AllowSorting="false">
    <Columns>
        <asp:TemplateField>
           <ItemTemplate>
             <input name="chkSuports" class="checkbox" type="checkbox" value="<%# Eval("PK_SUPORT") %>" />
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        
        <asp:TemplateField Visible="false">
           <ItemTemplate>
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        
        
        <asp:TemplateField HeaderText="Sửa" >
           <ItemTemplate>
              <a href="Default.aspx?ctl=Suport&sID=<%# Eval("PK_SUPORT") %>&Page=<%= gvSuports.PageIndex %>"><img src="Images/Edit.png" border="0" alt="" /></a>
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Yahoooooo">
           <ItemTemplate>
              <a class="Link" href="Default.aspx?ctl=Suport&sID=<%# Eval("PK_SUPORT") %>&Page=<%= gvSuports.PageIndex %>"><%# Eval("C_YAHOO")%></a>
           </ItemTemplate>
        </asp:TemplateField>
        
        
        
        
         <asp:TemplateField HeaderText="Phụ trách">
           <ItemTemplate>
              <a class="Link" href="Default.aspx?ctl=Suport&sID=<%# Eval("PK_SUPORT") %>&Page=<%= gvSuports.PageIndex %>"><%# Eval("C_NAME")%></a>
           </ItemTemplate>
        </asp:TemplateField>
       
        <asp:TemplateField HeaderText="Điện thoại">
           <ItemTemplate>
              <%# Eval("C_TEL") %>
           </ItemTemplate>
        </asp:TemplateField>
        
    </Columns>
</asp:GridView>
<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkSuports" runat="server" />


<center>
   <asp:Button ID="btnInsert" runat="server" Text="Thêm mới" OnClick="btnInsert_Click"  />
   &nbsp;&nbsp;
   <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
   &nbsp;&nbsp;
  
</center>

<br />

<asp:SqlDataSource ID="AdvsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT T_SUPORT.* FROM T_SUPORT">
   
</asp:SqlDataSource>


