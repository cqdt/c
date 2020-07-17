<%@ Control Language="C#" AutoEventWireup="true" CodeFile="dm-nganh-nghe.ascx.cs" Inherits="Admin_Modules_dm_nganh_nghe" %>

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
              <a href="Default.aspx?ctl=detail-nganh-nghe&fID=<%# Eval("ID") %>&Page=<%= gvAVotes.PageIndex %>"><img src="Images/Edit.png" border="0" alt="" /></a>
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Mã">
           <ItemTemplate>
              <a class="Link" href="Default.aspx?ctl=detail-nganh-nghe&fID=<%# Eval("ID") %>&Page=<%= gvAVotes.PageIndex %>"><%# Eval("C_MA")%></a>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngành nghề">
           <ItemTemplate>
              <%# Eval("C_NGHE_KR")%>
           </ItemTemplate>
        </asp:TemplateField>
       
    </Columns>
</asp:GridView>
<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkAVotes" runat="server" />


<center>
   <asp:Button ID="btnInsert" runat="server" Text="Thêm mới" OnClick="btnInsert_Click"  />
   &nbsp;&nbsp;
   <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
  
</center>

<br />

<asp:SqlDataSource ID="AVotesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT * FROM T_DM_NGHE ORDER BY ID">
   
</asp:SqlDataSource>

