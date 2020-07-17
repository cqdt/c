<%@ Control Language="C#" AutoEventWireup="true" Inherits="CMS.TTV.Admin.GImage" %>

<center>
    <table style="width: 100%">
        <tr class="GridHeader">
            <td colspan="2">
                 Thư mục
            </td>
        </tr>
        <tr class="GridAlterItem2">
            <td style="width: 108px">
                Tên :
            </td>
            <td >
               <asp:TextBox ID="txtName" runat="server" Width="216px"></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Tên không thể rỗng" ControlToValidate="txtName" SetFocusOnError="True" ValidationGroup="GImageG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr class="GridItem2">
            <td colspan="2" style="text-align:center">
                <asp:Button ID="btnUpdate" runat="server" Text="Thêm mới" ValidationGroup="GImageG1" OnClick="btnUpdate_Click" >
                </asp:Button>
                <asp:Button ID="btnList" runat="server" Text="Danh sách" OnClick="btnList_Click" />
            </td>
        </tr>
    </table>   
</center>

<asp:ValidationSummary ID="vsGImage" ShowSummary="false" HeaderText="Vui lòng kiểm tra lại :" runat="server" ValidationGroup="GImageG1" ShowMessageBox="True"/>   
