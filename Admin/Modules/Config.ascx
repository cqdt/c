<%@ Control Language="C#" AutoEventWireup="true" Inherits="CMS.TTV.Admin.Config" %>


<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>
    
   
<center>
    <table style="width: 100%">
        <tr class="GridHeader">
             <td colspan="2">
                 Cấu hình hệ thống
            </td>
        </tr>
        <tr class="GridAlterItem2">
            <td style="width: 208px">
                Chế độ Cache(bộ nhớ đệm) :
            </td>
            <td >
                <asp:DropDownList ID="ddlIscache" runat="server">
                  <asp:ListItem Text="Tắt" Value="0"></asp:ListItem>
                  <asp:ListItem Text="Bật" Value="1"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr class="GridItem2">
            <td style="width: 208px;">
                Thời gian Cache(bộ nhớ đệm) :
            </td>
            <td >
              <asp:TextBox ID="txtTimecache" runat="server" ></asp:TextBox> (Phút)
              <asp:RangeValidator ID="rvTimecache" runat="server" ErrorMessage="Thời gian Cache là chữ số >= 0 và < 10000" ControlToValidate="txtTimecache" MaximumValue="10000" MinimumValue="0" SetFocusOnError="True" Type="Integer" Display="Dynamic" ValidationGroup="ConfigG1">*</asp:RangeValidator>
            </td>
        </tr>
        <tr class="GridAlterItem2">
            <td style="width: 208px;">
                Email liên hệ :
            </td>
            <td >
               <asp:TextBox ID="txtFeedback_email" runat="server" ></asp:TextBox>
            </td>
        </tr>
        <tr class="GridAlterItem2">
            <td colspan="2" style="text-align:center">
                <asp:Button ID="btnConfig" ValidationGroup="ConfigG1" UseSubmitBehavior="false" runat="server" Text="Cấu hình" OnClick="btnConfig_Click" >
                </asp:Button>
                <asp:Button ID="btnClearCache" UseSubmitBehavior="false" runat="server" Text="Xóa Cache" OnClick="btnClearCache_Click" >
                </asp:Button>
            </td>
        </tr>
    </table>   
</center>

<asp:ValidationSummary ID="vsConfig" ShowSummary="false" HeaderText="Vui lòng kiểm tra lại :" runat="server" ValidationGroup="ConfigG1" ShowMessageBox="True"/>   


