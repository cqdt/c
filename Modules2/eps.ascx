<%@ Control Language="C#" AutoEventWireup="true" CodeFile="eps.ascx.cs" Inherits="Modules_eps" %>


<div class="bg_title_cate">
<div class="title_cate">
    <div class="title_cate_ico"></div>
    <a class="a_title_cate">Thông tin người lao động EPS</a>
</div>    
<div class="title_cate_right"></div>
</div>

<div class="img_24">
     <ul class="dangkytienghan">
        <li><span class="hokhau epssss"><b>1. Họ và tên</b><i>(Viết hoa không dấu)</i></span><asp:TextBox ID="txthoten" CssClass="txthoten" Width="330" runat="server"></asp:TextBox>
            
        </li>
        <br /><br />
        <li><span class="hokhau"><b>2. Số báo danh</b><i>(16 ký tự)</i></span><asp:TextBox ID="txtsbd" CssClass="txthoten"  Width="330" runat="server"></asp:TextBox>
             
        </li>
        <li><span class="hokhau"><b>3. Số CMND</b></span><asp:TextBox ID="txtcmnd" CssClass="txthoten"  Width="330" runat="server"></asp:TextBox>
             
        </li>
        <li><span class="hokhau"><b>4. Hộ chiếu</b></span><asp:TextBox ID="txthochieu" CssClass="txthoten"  Width="330" runat="server"></asp:TextBox>
             
        </li>
                
         <li><asp:Button ID="btngui" OnClientClick="return CheckSubmit()" runat="server" Text="Tìm kiếm" CssClass="btngui im" 
                onclick="btngui_Click"/></li>


       
    </ul>

      <div class="luuy">
            <b style="text-decoration:underline">Lưu ý:</b><br />
            - Người lao động nhập thông tin cá nhân vào các mục tra cứu theo nội dung đã đăng ký trong hồ sơ dự tuyển đi làm việc tại Hàn Quốc.<br />
            - Mục <b>Họ và tên</b> bắt buộc phải nhập thông tin.<br />
            - Tại các mục tra cứu <b>Số báo danh - Số CMND - Số hộ chiếu</b>, người lao động chỉ cần điền thông tin cá nhân vào một mục duy nhất.  <br />
            - Người lao động thuộc diện lao động mẫu mực (không có số báo danh) nhập thông tin vào mục <b>Họ và tên</b> và 1 trong 2 mục <b>Số CMND/ Số hộ chiếu</b>.

         </div>

         <div class="ketquatracuu">
           <p>kết quả tra cứu</p>
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
                    <td height="30">CMND</td>
                    <td><%# Eval("C_CMND")%></td>
                </tr>
                <tr>
                    <td height="30">Số hộ chiếu</td>
                    <td><%# Eval("C_HOCHIEU")%></td>
                </tr>
                <tr style="background:#E4F2FE">
                    <td height="30">Số báo danh</td>
                    <td><%# Eval("C_SBD")%></td>
                </tr>
                <tr>
                    <td height="30">Tình trạng</td>
                    <td style="line-height:160%"><%# Eval("[C_TINHTRANG]")%></td>
                </tr>
            </table>
             
        </ItemTemplate>
    </asp:DataList>
</div>
</div>



<script type="text/javascript" language="javascript">
    function CheckSubmit() {

        var txthoten = document.getElementById("<%=txthoten.ClientID %>").value;
        var txtsbd = document.getElementById("<%=txtsbd.ClientID %>").value;
        var txtcmnd = document.getElementById("<%=txtcmnd.ClientID %>").value;
        var txthochieu = document.getElementById("<%=txthochieu.ClientID %>").value;

        if (txthoten == "") {
            alert("Hãy nhập Họ và tên");
            return false;
        }
        else if ((txtsbd == "") && (txtcmnd == "") && (txthochieu == "")) {
            alert("Hãy nhập một trong các thông tin Số báo danh - Số CMND - Số hộ chiếu");
            return false;
        }
        else {
            return true;
        }
    }

</script>