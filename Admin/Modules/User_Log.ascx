<%@ Control Language="C#" AutoEventWireup="true" Inherits="CMS.TTV.Admin.User_Log" %>


<asp:GridView id="gvUser_Log" runat="server" DataSourceID="User_LogDataSource" 
    AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" PageSize="20">
    <Columns>
         <asp:BoundField DataField="C_LOGIN_NAME" SortExpression="C_LOGIN_NAME" HeaderText="Tên đăng nhập"></asp:BoundField>
         <asp:BoundField DataField="C_IP" SortExpression="C_IP" HeaderText="IP"></asp:BoundField>
         <asp:BoundField DataField="C_DATE" SortExpression="C_DATE" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" HeaderText="Ng&#224;y đăng nhập"></asp:BoundField>
    </Columns>
</asp:GridView>


<br />
<center>
    <asp:Button ID="btnClear" runat="server" Text="Làm sạch" OnClick="btnClear_Click" />
</center>
<br />

<asp:SqlDataSource ID="User_LogDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand = "SELECT T_USER.C_LOGIN_NAME,T_USER_LOG.C_IP,T_USER_LOG.C_DATE FROM [T_USER_LOG],[T_USER] WHERE T_USER_LOG.FK_USER=T_USER.PK_USER ORDER BY T_USER_LOG.PK_USER_LOG DESC" 
   DeleteCommand = "DELETE FROM T_USER_LOG">
</asp:SqlDataSource>