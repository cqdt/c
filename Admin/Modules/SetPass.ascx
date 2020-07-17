<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SetPass.ascx.cs" Inherits="Admin_Modules_SetPass" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 
<%@ Register Assembly="RadEditor.Net2" Namespace="Telerik.WebControls" TagPrefix="radE" %>
<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>
<table border="0" width="100%">
  <tr>
     <td align="center">
   Quản lý - Cấp mật khẩu cho trung tâm
     </td>     
  </tr>
</table>
<asp:GridView ID="gvListLD"  Width="100%" runat="server" DataKeyNames="PK_TT" 
    AutoGenerateColumns="False" DataSourceID="ListLDsDataSource" AllowPaging="True" 
    PageSize="20" AllowSorting="false" onrowcreated="gvListLD_RowCreated">
    <Columns>
    <asp:TemplateField HeaderText="STT" >
           <ItemTemplate>
           </ItemTemplate>
           <ItemStyle Width="10px" />
        </asp:TemplateField >
        <asp:TemplateField HeaderText="#">
           <ItemTemplate>
             <input name="chkFAQs" class="checkbox" type="checkbox" value="<%# Eval("PK_TT") %>" />
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
                
        <asp:TemplateField HeaderText="Mã trung tâm">
           <ItemTemplate>
            <a href="Default.aspx?ctl=AddSetPass&fID=<%# Eval("PK_TT") %>&Page=<%= gvListLD.PageIndex %>">
            <%# Eval("C_MA")%>       </a>  
           </ItemTemplate>
        </asp:TemplateField>            
        <asp:TemplateField HeaderText="Tên trung tâm">
           <ItemTemplate>
           <a href="Default.aspx?ctl=AddSetPass&fID=<%# Eval("PK_TT") %>&Page=<%= gvListLD.PageIndex %>">
           <%# Eval("C_TEN")%></a>  
              
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Mật khẩu">
           <ItemTemplate>
           
           <%# Eval("C_PASS")%>
              
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Điện thoại">
           <ItemTemplate>
            <%# Eval("C_TEL")%>           
           </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Địa chỉ">
           <ItemTemplate>
            <%# Eval("C_ADDRESS")%>
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
<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkFAQs" runat="server" />
&nbsp;&nbsp;
Hiển thị : 
    <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
        <asp:ListItem Value="5" Text="5"></asp:ListItem>
        <asp:ListItem Value="10" Selected="True" Text="10"></asp:ListItem>
        <asp:ListItem Value="20" Text="20"></asp:ListItem>
        <asp:ListItem Value="50" Text="50"></asp:ListItem>
        <asp:ListItem Value="100" Text="100"></asp:ListItem>
    </asp:DropDownList> 
<center>
 &nbsp;
 <asp:Button ID="btnInsert" runat="server" Text="Thêm mới" 
    onclick="btnInsert_Click" />

 &nbsp;
   <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
</center>
<br /

<center>

    
 <asp:SqlDataSource ID="ListLDsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT * FROM T_TT">   
</asp:SqlDataSource>