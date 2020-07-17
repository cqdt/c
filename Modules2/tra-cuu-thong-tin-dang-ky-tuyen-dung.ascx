<%@ Control Language="C#" AutoEventWireup="true" CodeFile="tra-cuu-thong-tin-dang-ky-tuyen-dung.ascx.cs" Inherits="Modules_tra_cuu_thong_tin_dang_ky_tuyen_dung" %>

<div class="bg_title_cate">
<div class="title_cate">
    <div class="title_cate_ico"></div>
    <a class="a_title_cate">Tra cứu thông tin đăng ký tuyển dụng lao động</a>
</div>    
<div class="title_cate_right"></div>
</div>

<div class="img_24">
       <ul class="dangkytienghan">
        <li><span class="hoten">Tên công ty:</span><asp:TextBox ID="txtcongty" CssClass="txthoten" Width="300" runat="server"></asp:TextBox>
            
        </li>
        <li><span class="hoten">Số điện thoại:</span><asp:TextBox ID="txtdienthoai" CssClass="txthoten"  Width="300" runat="server"></asp:TextBox>
           
        </li>
                
         <li><asp:Button ID="btngui" OnClientClick="return CheckSubmit()" runat="server" 
                 Text="Tìm kiếm" CssClass="btngui im" 
                onclick="btngui_Click" style="height: 26px"/></li>
    </ul>
    <div class="ketquatracuu">
        <p>kết quả tra cứu</p>

        <asp:DataList ID="dlKetqua" RepeatColumns="1" runat="server" HorizontalAlign="Center" Width="99%" CaptionAlign="Top" CellPadding="10" GridLines="Both">
        <ItemTemplate>
            <table cellpadding="1" cellspacing="1" border="0" width="615">
                <tr style="background:#E4F2FE">
                    <td width="220" height="30">Tên công ty</td>
                    <td><%# Eval("C_TENCTY")%></td>
                </tr>
                <tr>
                    <td height="30">Ngành nghề, lĩnh vực hoạt động</td>
                    <td><%# Eval("C_NGANHNGHE")%></td>
                </tr>
                 <tr style="background:#E4F2FE">
                    <td height="30">Địa chỉ</td>
                    <td><%# Eval("C_DIACHI")%></td>
                </tr>
                <tr>
                    <td height="30">Số điện thoại</td>
                    <td><%# Eval("C_DIENTHOAI")%></td>
                </tr>
               
                <tr style="background:#E4F2FE">
                    <td height="30">Email hoặc Website</td>
                    <td><%# Eval("C_EMAIL")%></td>
                </tr>                          

                 <tr>
                    <td height="30">Vị trí tuyển dụng</td>
                    <td><%# Eval("C_VITRI")%></td>
                </tr>

                 <tr style="background:#E4F2FE">
                    <td height="30">Điều kiện tuyển dụng</td>
                    <td><%# Eval("C_DIEUKIEN")%></td>
                </tr>

                 <tr>
                    <td height="30">Yêu cầu của công việc</td>
                    <td><%# Eval("C_YEUCAU")%></td>
                </tr>

                 <tr style="background:#E4F2FE">
                    <td height="30">Số lượng cần tuyển</td>
                    <td><%# Eval("C_SOLUONG")%></td>
                </tr>

                 <tr>
                    <td height="30">Mức lương</td>
                    <td><%# Eval("C_THUNHAP")%></td>
                </tr>

                 <tr style="background:#E4F2FE">
                    <td height="30">Hồ sơ dự tuyển gồm có</td>
                    <td><%# Eval("C_HOSO")%></td>
                </tr>

                 <tr>
                    <td height="30">Thời gian nhận hồ sơ từ</td>
                    <td><%# Eval("C_THOIGIANNHAN")%></td>
                </tr>

                 <tr style="background:#E4F2FE">
                    <td height="30">Nhận hồ sơ đến</td>
                    <td><%# Eval("C_NHANHSDEN")%></td>
                </tr>
                                

            </table>
             
        </ItemTemplate>
    </asp:DataList>

    </div>


</div>

<script type="text/javascript" language="javascript">
    function CheckSubmit() {

        var txtcongty = document.getElementById("<%=txtcongty.ClientID %>").value;
        var txtdienthoai = document.getElementById("<%=txtdienthoai.ClientID %>").value;

        if (txtcongty == "") {
            alert("Hãy nhập Tên công ty");
            return false;
        }
        else if (txtdienthoai == "") {
            alert("Hãy nhập Số điện thoại");
            return false;
        }
        else {
            return true;
        }
    }

</script>