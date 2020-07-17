<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Search-ce.ascx.cs" Inherits="Modules_Controls_Search_ce" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<asp:Panel ID="pnSearchBDS" DefaultButton="btnTimkiem" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td height="23" align="right">
                Họ tên&nbsp;
            </td>
            <td width="187" background="Images/bg_search1.jpg" style="background-repeat: no-repeat">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="13">
                            &nbsp;
                        </td>
                        <td>
                            <asp:TextBox ID="txtHoten" Width="145" runat="server" CssClass="texbox4" Height="15px"
                                BorderStyle="None"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="23" align="right">
                Số hộ chiếu&nbsp;
            </td>
            <td width="187" align="left" valign="middle" background="Images/bg_search1.jpg" style="background-repeat: no-repeat">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="13">
                            &nbsp;
                        </td>
                        <td>
                            <asp:TextBox ID="txtSohc" Width="145" runat="server" CssClass="texbox4" Height="15px"
                                BorderStyle="None"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="23" align="right">
                Trung tâm đào tạo&nbsp;
            </td>
            <td width="187" align="left" valign="middle">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <asp:DropDownList ID="ddlMenus" Width="183px" DataSourceID="FAQDataSource" DataTextField="C_TEN"
                                DataValueField="C_MA" runat="server" OnDataBound="ddlMenus_DataBound">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="23" align="right">
                Khoảng thời gian cấp chứng chỉ từ ngày&nbsp;
            </td>
            <td width="187" align="left" valign="middle">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="1">
                        </td>
                        <td>                           
                            <radCln:RadDatePicker MinDate="1900-01-01" ID="raddTungay" Width="89" 
                                OnLoad="raddTungay_Load" runat="server">
                            </radCln:RadDatePicker>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td width="155" height="23" align="right">
                đến ngày&nbsp;
            </td>
            <td width="187" align="left" valign="middle">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="1">
                        </td>
                        <td>                           
                            <radCln:RadDatePicker MinDate="1900-01-01" ID="raddDenngay" Width="89" 
                                OnLoad="raddDenngay_Load" runat="server">
                            </radCln:RadDatePicker>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td width="155" height="30" align="right">
            </td>
            <td width="187" align="left" valign="bottom">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <asp:ImageButton ID="btnTimkiem" ImageUrl="~/Images/search.jpg" CssClass="image5"
                                BorderWidth="0" OnClick="btnTimkiem_Click" runat="server" ToolTip="Search" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Panel>
<asp:SqlDataSource ID="FAQDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT * FROM T_TT where C_STATUS=1"></asp:SqlDataSource>
