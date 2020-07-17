<%@ Control Language="C#" AutoEventWireup="true" Inherits="CMS.TTV.Admin.Users" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 
 

<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>
<table border="0" width="100%">
  <tr>
    <td style="text-align:left">
        Trạng thái : 
        <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true">
            <asp:ListItem Value="-1" Text="Tất cả"></asp:ListItem>
            <asp:ListItem Value="1" Text="Hoạt động"></asp:ListItem>
            <asp:ListItem Value="0" Text="Chưa hoạt động"></asp:ListItem>
        </asp:DropDownList>
        Tên đăng nhập : 
        <asp:TextBox ID="txtUserName" runat="server" Width="90px"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" />
     </td>
  </tr>
</table>

<asp:GridView ID="gvUsers"  Width="100%" runat="server" DataKeyNames="PK_USER" AutoGenerateColumns="False" DataSourceID="UsersDataSource" AllowPaging="True" PageSize="20" AllowSorting="false">
    <Columns>
        <asp:TemplateField>
           <ItemTemplate>
             <input name="chkUsers" class="checkbox" type="checkbox" value="<%# Eval("PK_USER") %>" />
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Sửa" >
           <ItemTemplate>
              <a href="Default.aspx?ctl=User&uID=<%# Eval("PK_USER") %>"><img src="Images/Edit.png" border="0" alt="" /></a>
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="T&#234;n đăng nhập">
           <ItemTemplate>
              <a class="Link" href="Default.aspx?ctl=User&uID=<%# Eval("PK_USER") %>"><%# Eval("C_LOGIN_NAME")%></a>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Email">
           <ItemTemplate>
              <%# Eval("C_EMAIL")%>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Quản trị">
           <ItemTemplate>
              <CMS:Status ID="Status1" ActiveText="Quản trị" InActiveText="Sử dụng" Value='<%# Eval("C_IS_ADMIN") %>' runat="server"></CMS:Status>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Trạng th&#225;i">
           <ItemTemplate>
              <CMS:Status ID="Status2" ActiveText="Hoạt động" InActiveText="Chưa hoạt động" Value='<%# Eval("C_STATUS") %>' runat="server"></CMS:Status>
           </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>


<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkUsers" runat="server" />


<center>
   <asp:Button ID="btnInsert" runat="server" Text="Thêm mới" OnClick="btnInsert_Click"  />
   &nbsp; &nbsp;&nbsp;
   <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
</center>





<asp:SqlDataSource ID="UsersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_USER,C_LOGIN_NAME,C_EMAIL,C_IS_ADMIN,C_STATUS FROM T_USER WHERE ((@C_STATUS = -1) OR (@C_STATUS in (0, 1) AND C_STATUS = @C_STATUS)) AND (C_LOGIN_NAME LIKE '%' + @C_LOGIN_NAME + '%')">
    <SelectParameters>
       <asp:ControlParameter Name="C_STATUS" Type="Int32" ControlID="ddlStatus" DefaultValue="-1" />
       <asp:ControlParameter Name="C_LOGIN_NAME" Type="String" ControlID="txtUserName" PropertyName="Text" ConvertEmptyStringToNull="False" />
    </SelectParameters>
</asp:SqlDataSource>
