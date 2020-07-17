<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Search-ld.ascx.cs" Inherits="Modules_Controls_Search_ld" %>
<asp:Panel ID="pnSearchBDS" DefaultButton="btnTimkiem" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td></td>
            <td>&nbsp;&nbsp; Số báo danh
             <asp:RequiredFieldValidator ID="rfvsbd" runat="server" ErrorMessage="Bạn chưa nhập Số báo danh"
                                ControlToValidate="txtSBD" SetFocusOnError="True" ValidationGroup="vSearch1"
                                Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
            <td>&nbsp;&nbsp;Họ tên
            <asp:RequiredFieldValidator ID="rfvhoten" runat="server" ErrorMessage="Bạn chưa nhập Họ tên"
                                ControlToValidate="txtSearch" SetFocusOnError="True" ValidationGroup="vSearch1"
                                Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
            <td></td>
        </tr>
        <tr>
            <td width="35" height="23">
            </td>
            <td width="187" background="Images/bg_search1.jpg" style="background-repeat: no-repeat">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="13">
                            &nbsp;
                        </td>
                        <td>
                            <asp:TextBox ID="txtSBD" Width="145" runat="server" CssClass="texbox4" 
                                Height="15px" BorderStyle="None"></asp:TextBox>
                           
                        </td>
                    </tr>
                </table>
            </td>
            <td width="187" align="left" valign="middle" background="Images/bg_search1.jpg" style="background-repeat: no-repeat">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="13">
                            &nbsp;
                        </td>
                        <td>
                            <asp:TextBox ID="txtSearch" Width="145" runat="server" CssClass="texbox4"  Height="15px"
                                BorderStyle="None"></asp:TextBox>
                            
                        </td>
                    </tr>
                </table>
            </td>
            <td align="left" valign="top">
                <asp:ValidationSummary ID="vSearch1" ValidationGroup="vSearch1" ShowSummary="false"
                    HeaderText="Vui lòng kiểm tra lại :" runat="server" 
                    ShowMessageBox="true" />
                <asp:ImageButton ID="btnTimkiem" ValidationGroup="vSearch1" ImageUrl="~/Images/search.jpg"
                    CssClass="image5" BorderWidth="0" OnClick="btnTimkiem_Click" runat="server" ToolTip="Tìm kiếm" />
            </td>
        </tr>
    </table>
</asp:Panel>
