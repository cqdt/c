<%@ Control Language="C#" AutoEventWireup="true" CodeFile="register-business-info.ascx.cs" Inherits="Modules_register_business_info" %>


<div class="bg_title_cate">
<div class="title_cate">
    <div class="title_cate_ico"></div>
    <a class="a_title_cate">ĐĂNG KÝ TUYỂN DỤNG LAO ĐỘNG</a>
</div>    
<div class="title_cate_right"></div>
</div>


<div class="img_24">
    <ul class="dangkytdld">

    <li> <center>
          <span class="thongtindn"> THÔNG TIN CHUNG VỀ DOANH NGHIỆP <br />
            기업의 정보
         </span></center>
        </li>

        <li>
            <span class="tencongtydk">1- Tên công ty <br />&nbsp;&nbsp;&nbsp; 회사명 <b>(*)</b> </span>
            <asp:TextBox ID="txtTencongty" Width="387" Height="30" runat="server"></asp:TextBox>
        </li>
        <li>
            <span class="tencongtydk">2- Ngành nghề <br />&nbsp;&nbsp;&nbsp; 업종 <b>(*)</b></span>
           
            <asp:DropDownList ID="cbonganhnghe" runat="server" Height="36" Width="158" CssClass="txthodem selectNganhnghe">
            </asp:DropDownList>

            <span class="mota">Mô tả <br /> 서술</span>
            <asp:TextBox ID="txtmota" runat="server" Height="30" Width="163" style="width:30% !important"></asp:TextBox>
        </li>
        <li style="height:73px"><span class="tencongtydk">3- Địa chỉ công ty<br />&nbsp;&nbsp;&nbsp; 회사 주소 <b>(*)</b></span>
            
            <table cellpadding="0" cellspacing="0"> 
                <tr>
                    <td> Chi tiết</td>
                    <td>Huyện/군/현</td>
                    <td>Tỉnh/Thành phố</td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="txtdiachicongty" Width="154" Height="30" runat="server" CssClass="txtdiachicongty"></asp:TextBox></td>
                    <td> <asp:TextBox ID="txthuyen" runat="server" Width="86" Height="30" CssClass="txtdiachicongty"></asp:TextBox></td>
                    <td>
                    
                    <select class="danhmucnghe" style="width:139px;margin-left:2px;height:36px;" id="cboTinh" runat="server" >
            <option value="">--- --- ---</option>
                <option value="Hà Nội">Hà Nội</option>
                <option value="TP HCM">TP HCM</option>
                <option value="An Giang">An Giang</option>
                <option value="Bà Rịa - Vũng Tàu">Bà Rịa - Vũng Tàu</option>
                <option value="Bắc Giang">Bắc Giang</option>
                <option value="Bắc Kạn">Bắc Kạn</option>
                <option value="Bạc Liêu">Bạc Liêu</option>
                <option value="Bắc Ninh">Bắc Ninh</option>
                <option value="Bến Tre">Bến Tre</option>
                <option value="Bình Định">Bình Định</option>
                <option value="Bình Dương">Bình Dương</option>
                <option value="Bình Phước">Bình Phước</option>
                <option value="Bình Thuận">Bình Thuận</option>
                <option value="Cà Mau">Cà Mau</option>
                <option value="Cần Thơ">Cần Thơ</option>
                <option value="Cao Bằng">Cao Bằng</option>
                <option value="Đà Nẵng">Đà Nẵng</option>
                <option value="Đắk Lắk">Đắk Lắk</option>
                <option value="Đắk Nông">Đắk Nông</option>
                <option value="Điện Biên">Điện Biên</option>
                <option value="Đồng Nai">Đồng Nai</option>
                <option value="Đồng Tháp">Đồng Tháp</option>
                <option value="Gia Lai">Gia Lai</option>
                <option value="Hà Giang">Hà Giang</option>
                <option value="Hà Nam">Hà Nam</option>
                <option value="Hà Tĩnh">Hà Tĩnh</option>
                <option value="Hải Phòng">Hải Phòng</option>
                <option value="Hải Dương">Hải Dương</option>
                <option value="Hậu Giang">Hậu Giang</option>
                <option value="Hòa Bình">Hòa Bình</option>
                <option value="Hưng Yên">Hưng Yên</option>
                <option value="Khánh Hòa">Khánh Hòa</option>
                <option value="Kiên Giang">Kiên Giang</option>
                <option value="Kon Tum">Kon Tum</option>
                <option value="Lai Châu">Lai Châu</option>
                <option value="Lâm Đồng">Lâm Đồng</option>
                <option value="Lạng Sơn">Lạng Sơn</option>
                <option value="Lào Cai">Lào Cai</option>
                <option value="Long An">Long An</option>
                <option value="Nam Định">Nam Định</option>
                <option value="Nghệ An">Nghệ An</option>
                <option value="Ninh Bình">Ninh Bình</option>
                <option value="Ninh Thuận">Ninh Thuận</option>
                <option value="Phú Thọ">Phú Thọ</option>
                <option value="Quảng Bình">Quảng Bình</option>
                <option value="Quảng Nam">Quảng Nam</option>
                <option value="Quảng Ngãi">Quảng Ngãi</option>
                <option value="Quảng Ninh">Quảng Ninh</option>
                <option value="Quảng Trị">Quảng Trị</option>
                <option value="Sóc Trăng">Sóc Trăng</option>
                <option value="Sơn La">Sơn La</option>
                <option value="Tây Ninh">Tây Ninh</option>
                <option value="Thái Bình">Thái Bình</option>
                <option value="Thái Nguyên">Thái Nguyên</option>
                <option value="Thanh Hóa">Thanh Hóa</option>
                <option value="Thừa Thiên Huế">Thừa Thiên Huế</option>
                <option value="Tiền Giang">Tiền Giang</option>
                <option value="Trà Vinh">Trà Vinh</option>
                <option value="Tuyên Quang">Tuyên Quang</option>
                <option value="Vĩnh Long">Vĩnh Long</option>
                <option value="Vĩnh Phúc">Vĩnh Phúc</option>
                <option value="Yên Bái">Yên Bái</option>
                <option value="Phú Yên">Phú Yên</option>             
            </select>
                    
                    </td>
                </tr>
            </table>
            
            
            
            
           
            

        </li>
        <li>
            <span class="tencongtydk">4- Website <br />&nbsp;&nbsp;&nbsp; 회사 홈페이지</span>
            <asp:TextBox ID="txtwebsite" Width="387" Height="30" runat="server"></asp:TextBox>
        </li>
        <li>
            <span class="tencongtydk">5- Tên người liên hệ<br />&nbsp;&nbsp;&nbsp; 연락자명<b>(*)</b></span>
            <select style="height:36px;float:left" id="Mr" runat="server">
                <option value="">---</option>
                <option value="Mr">Mr</option>
                <option value="Ms">Ms</option>
                <option value="Mrs">Mrs</option>
            </select>
            <asp:TextBox ID="txtnguoilienhe" Width="338" Height="30" runat="server" style="width:65% !important"></asp:TextBox>
        </li>
        <li>
        <span class="tencongtydk">6- Chức danh<br />&nbsp;&nbsp;&nbsp;직명</span>
            <asp:TextBox ID="txtchucdanh" Width="387" Height="30" runat="server"></asp:TextBox>
        </li>
        <li>
        <span class="tencongtydk">7- Số điện thoại liên hệ<br />&nbsp;&nbsp;&nbsp; 전화번호 <b>(*)</b></span>
            <asp:TextBox ID="txtdienthoailienhe" Width="387" Height="30" runat="server"></asp:TextBox>
        </li>
        <li>
            <span class="tencongtydk">8- Địa chỉ email <br />&nbsp;&nbsp;&nbsp; 이메일 <b>(*)</b></span>
            <asp:TextBox ID="txtemail" Width="387" Height="30" runat="server"></asp:TextBox>
        </li>
        <li>
        <span class="tencongtydk">9- Mã tuyển dụng <br />&nbsp;&nbsp;&nbsp; 채용번호</span>
            <asp:TextBox ID="txtMaTD" Width="387" Height="30" runat="server" Enabled="false"></asp:TextBox>
        </li>
        <li>
             <asp:Button ID="btndangky" CssClass="btndangky" runat="server" Text=" 신청 " OnClientClick="return CheckSubmit()" 
                 onclick="btndangky_Click" />
        </li>
        <li><i id="luuy" runat="server"> (Lưu ý: Doanh nghiệp đăng ký ghi nhớ Mã tuyển dụng:<span style="color:Red;font-weight:bold;"> <%= strTV %> </span> để sử dụng khi đăng tin tuyển dụng) <br />
            (주의: 기업이 신청번호를 기억하시며 채용정보 공고할 때 활용한다)</i>
            <i id="thongbao" runat="server" visible="false" style="color:Red;font-weight:bold;">Quý công ty đã đăng ký thông tin, đề nghị chuyển sang mục 1 - Đăng ký tuyển dụng hoặc mục 3 – Tìm lao động</i>
        </li>
        <li>
           <span class="luuykorea"><b>Quý công ty có đăng ký thông tin tuyển dụng? </b><br /> 귀사가 채용정보 신청하시겠습니까? </span>

            <asp:Button ID="btndangkytiep" CssClass="btnyesno" runat="server" Text=" YES " 
                onclick="btndangkytiep_Click" />
            <asp:Button ID="btndangkyhuy" runat="server" Text=" NO "  CssClass="btnyesno"
                onclick="btndangkyhuy_Click" />

        </li>
    </ul>
</div>

<script type="text/javascript" language="javascript">


 function validateEmail(email) {
        var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\ ".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA -Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
        return email.match(re);
    }


    function CheckSubmit() {
        var txtTencongty = document.getElementById("<%=txtTencongty.ClientID %>").value;
        var txtdiachicongty = document.getElementById("<%=txtdiachicongty.ClientID %>").value;
        var txtnguoilienhe = document.getElementById("<%=txtnguoilienhe.ClientID %>").value;
        var txtdienthoailienhe = document.getElementById("<%=txtdienthoailienhe.ClientID %>").value;
        var txtemail = document.getElementById("<%=txtemail.ClientID %>").value;


        if (txtTencongty == "") {
            alert("1- 회사명 (*)");
            document.getElementById("<%=txtTencongty.ClientID %>").focus();
            return false;
        }
        else if (txtdiachicongty == "") {
            alert("3- 회사주소 (*)");
            document.getElementById("<%=txtdiachicongty.ClientID %>").focus();
            return false;
        }
        else if (txtnguoilienhe == "") {
            alert("5- 연락자명 (*)");
            document.getElementById("<%=txtnguoilienhe.ClientID %>").focus();
            return false;
        }
        else if (txtnguoilienhe == "" {
            alert("7- 전화번호 (*)");
            document.getElementById("<%=txtdienthoailienhe.ClientID %>").focus();
            return false;
        }
        else if (txtemail == "" {
            alert("8- 이메일 (*)");
            document.getElementById("<%=txtemail.ClientID %>").focus();
            return false;
        }
        else if (!validateEmail(txtemail)) {
                alert("8- 이메일 (*)");
                return false;
            }
        else {
            return true;
        }




    }
</script>
<style>
.tencongtydk{
    width:20%;
    float:left;
}
.dangkytdld li input[type="text"]{
    width:70% !important;
    float:left;
}
.selectNganhnghe{
    float:left;
    width:30% !important;
}
.mota{
    width:10% !important;
}
</style>