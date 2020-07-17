<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Login.ascx.cs" Inherits="Modules_Controls_Login" %>
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
    
    
    <tr>
    <td width="70"></td>
        <td width="150" valign="bottom">
             Mã trung tâm<br />
             <asp:TextBox CssClass="formdangnhap" ID="txtUser"  runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator id="rfvUser" runat="server" ErrorMessage="" ControlToValidate="txtUser" ValidationGroup="G1" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
        <td width="160" valign="bottom">
        Mật khẩu <br />
             <asp:TextBox ID="txtPass" CssClass="formdangnhap"  TextMode="Password" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator id="rfvPass" runat="server" ErrorMessage="" ControlToValidate="txtPass" ValidationGroup="G1" Display="Dynamic"></asp:RequiredFieldValidator>
  
        </td>
        <td valign="bottom">
         <asp:ImageButton ID="btnLogin" ValidationGroup="G1" CssClass="login" 
     ImageUrl="~/Images/log.gif" BorderWidth="0" OnClick="btnLogin_Click" 
     runat="server" ToolTip="Search" style="height: 21px" /> 
        </td>
    </tr>
    
</table>                          


<asp:ValidationSummary ID="vsFeedBack" ValidationGroup="G1" ShowSummary="false"  HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="true" />  