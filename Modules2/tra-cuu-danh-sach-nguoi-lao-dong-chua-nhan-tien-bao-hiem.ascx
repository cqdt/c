﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="tra-cuu-danh-sach-nguoi-lao-dong-chua-nhan-tien-bao-hiem.ascx.cs" Inherits="Modules_tra_cuu_danh_sach_nguoi_lao_dong_chua_nhan_tien_bao_hiem" %>
<div class="bg_title_cate">
<div class="title_cate">
    <div class="title_cate_ico"></div>
    <a class="a_title_cate">Tra cứu thông tin</a>
</div>    
<div class="title_cate_right"></div>
</div>


<div class="img_24">
    <ul class="dangkytienghan">
        <li><span class="hoten baohiem">Họ và tên:</span><asp:TextBox ID="txthoten" CssClass="txthoten" Width="300" runat="server"></asp:TextBox>
            <i class="vidu">( DUONG TAN TAI )</i>
        </li>
        <li><span class="hoten baohiem">Ngày sinh:</span><asp:TextBox ID="txtngaysinh" CssClass="txthoten"  Width="300" runat="server"></asp:TextBox>
             <i class="vidu">( 23/11/1970 )</i>
        </li>
                
         <li><asp:Button ID="btngui" OnClientClick="return CheckSubmit()" runat="server" Text="Tìm kiếm" CssClass="btngui im" 
                onclick="btngui_Click"/></li>
    </ul>

<div class="ketquatracuu"><p>kết quả tra cứu</p>
    <asp:DataList ID="dlKetqua" RepeatColumns="1" runat="server" HorizontalAlign="Center" Width="99%" CaptionAlign="Top" CellPadding="10" GridLines="Both">
        <ItemTemplate>
            <table cellpadding="1" cellspacing="1" border="0" width="615">
                <tr style="background:#E4F2FE">
                    <td width="150" height="30">Họ và tên</td>
                    <td><%# Eval("C_HOTEN")%></td>
                </tr>
                <tr>
                    <td height="30">Ngày sinh</td>
                    <td><%# Eval("C_NGAYSINH")%></td>
                </tr>
                <tr style="background:#E4F2FE">
                    <td height="30">CMND tại Hàn Quốc</td>
                    <td><%# Eval("C_CMNDNN")%></td>
                </tr>
                <tr>
                    <td height="30">Số hộ chiếu</td>
                    <td><%# Eval("C_HOCHIEU")%></td>
                </tr>
                <tr style="background:#E4F2FE">
                    <td height="30">Số tiền</td>
                    <td><%# Eval("C_SOTIEN")%></td>
                </tr>
                <tr>
                    <td height="30">Số xác nhận bảo hiểm</td>
                    <td><%# Eval("C_SOXACNHAN")%></td>
                </tr>
            </table>
             
        </ItemTemplate>
    </asp:DataList>
</div>
</div>

<script type="text/javascript" language="javascript">
    function CheckSubmit() {

        var txthoten = document.getElementById("<%=txthoten.ClientID %>").value;
        var txtngaysinh = document.getElementById("<%=txtngaysinh.ClientID %>").value;       

        if (txthoten == "") {
            alert("Hãy nhập Họ và tên");
            return false;
        }
        else if (txtngaysinh == "") {
            alert("Hãy nhập Ngày sinh");
            return false;
        }
        else {
            return true;
        }
    }

</script>