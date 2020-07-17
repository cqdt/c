<%@ Control Language="C#" AutoEventWireup="true" CodeFile="tra-cuu-dang-ky-thong-tin-tim-viec.ascx.cs" Inherits="Modules_tra_cuu_dang_ky_thong_tin_tim_viec" %>


<div class="bg_title_cate">
<div class="title_cate">
    <div class="title_cate_ico"></div>
    <a class="a_title_cate">Tra cứu đăng ký thông tin tìm việc</a>
</div>    
<div class="title_cate_right"></div>
</div>

<div class="img_24">
       <ul class="dangkytienghan">
        <li><span class="hoten baohiem">Họ và tên:</span><asp:TextBox ID="txthoten" CssClass="txthoten" Width="300" runat="server"></asp:TextBox>
            
        </li>
        <li><span class="hoten baohiem">Ngày sinh:</span><asp:TextBox ID="txtngaysinh" CssClass="txthoten"  Width="300" runat="server"></asp:TextBox>
           
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
                    <td width="220" height="30">Họ và tên</td>
                    <td><%# Eval("C_HOTEN")%></td>
                </tr>
                <tr>
                    <td height="30">Ngày sinh</td>
                    <td><%# Eval("C_NGAYSINH")%></td>
                </tr>
                 <tr style="background:#E4F2FE">
                    <td height="30">Giới tính</td>
                    <td><%# Eval("C_GIOITINH")%></td>
                </tr>
                <tr>
                    <td height="30">Địa chỉ gửi thư</td>
                    <td><%# Eval("C_DIACHIGUITHU")%></td>
                </tr>
               
                <tr style="background:#E4F2FE">
                    <td height="30">Địa chỉ email</td>
                    <td><%# Eval("C_EMAIL")%></td>
                </tr>                          

                 <tr>
                    <td height="30">Điện thoại liên hệ</td>
                    <td><%# Eval("C_DIENTHOAI")%></td>
                </tr>

                 <tr style="background:#E4F2FE">
                    <td height="30">Ngày xuất cảnh</td>
                    <td><%# Eval("C_NGAYXUATCANH")%></td>
                </tr>

                 <tr>
                    <td height="30">Ngày về nước</td>
                    <td><%# Eval("C_NGAYVENUOC")%></td>
                </tr>

                 <tr style="background:#E4F2FE">
                    <td height="30">Tên chương trình đã tham gia</td>
                    <td><%# Eval("C_TRINHDO")%></td>
                </tr>

                 <tr>
                    <td height="30">Công việc mong muốn</td>
                    <td><%# Eval("C_CONGVIECMONGMUON")%></td>
                </tr>

                 <tr style="background:#E4F2FE">
                    <td height="30">Mức lương mong muốn</td>
                    <td><%# Eval("C_MUCLUONG")%></td>
                </tr>

                 <tr>
                    <td height="30">Địa chỉ làm việc mong muốn</td>
                    <td><%# Eval("C_DIACHILAMVIEC")%></td>
                </tr>

                 <tr style="background:#E4F2FE">
                    <td height="30">Công việc cụ thể được giao khi làm việc tại nước ngoài</td>
                    <td><%# Eval("C_CONGVIECCUTHE")%></td>
                </tr>

                 <tr>
                    <td height="30">Thời gian làm việc</td>
                    <td><%# Eval("C_THOIGIANLAMVIEC")%></td>
                </tr>

                 <tr style="background:#E4F2FE">
                    <td height="30">Ngành nghề được đào tạo</td>
                    <td><%# Eval("C_TENNUOC")%></td>
                </tr>

                 <tr>
                    <td height="30">Bằng cấp (nếu có)</td>
                    <td><%# Eval("C_BANGCAP")%></td>
                </tr>

                 <tr style="background:#E4F2FE">
                    <td height="30">Trình độ ngoại ngữ</td>
                    <td><%# Eval("C_NGOAINGU")%></td>
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