<%@ Control Language="C#" AutoEventWireup="true" CodeFile="edit-business-info.ascx.cs" Inherits="Modules_edit_business_info" %>


<div class="bg_title_cate">
<div class="title_cate">
    <div class="title_cate_ico"></div>
    <a class="a_title_cate">신청 내용 검색, 수정</a>
</div>    
<div class="title_cate_right"></div>
</div>


<div class="img_24">
    <ul class="thongtintdld">

     <li> <center>
          <span class="thongtindn"> TRA CỨU, SỬA THÔNG TIN ĐĂNG KÝ <br />
            신청 내용 검색, 수정
         </span></center>
        </li>


       <li>
            <span class="tencongtydk">1- TRA CỨU THÔNG TIN/ 내용검색</span>
             <asp:TextBox ID="txtMaTD" Width="366" style="float:left;" Height="30" runat="server" onfocus="if(this.value=='NHẬP MÃ TUYỂN DỤNG/채용번호 입력') this.value='';"
                    onblur="if(this.value=='') this.value='NHẬP MÃ TUYỂN DỤNG/채용번호 입력';" value="NHẬP MÃ TUYỂN DỤNG/채용번호 입력"></asp:TextBox>
             <asp:Button ID="btndangnhap" CssClass="btngo" runat="server" Text=" GO " Height="36" Width="114"
                onclick="btndangnhap_Click" style="background-color: #025dab;color: #ffffff;"/>
        </li>
        <li>
            <span class="tencongtydk">
                2- LẤY LẠI MÃ TUYỂN DỤNG/ 채용번호 되찾음
            </span>
            <asp:TextBox ID="txtlaydienthoai" style="float:left;" Width="160" Height="30" runat="server" onfocus="if(this.value=='Điện thoại/전화번호') this.value='';"
                    onblur="if(this.value=='') this.value='Điện thoại/전화번호';" value="Điện thoại/전화번호"></asp:TextBox>
            <asp:TextBox ID="txtlayemail" Width="200" Height="30" style="float:left;" runat="server" onfocus="if(this.value=='Email/이메일') this.value='';"
                    onblur="if(this.value=='') this.value='Email/이메일';" value="Email/이메일"></asp:TextBox>
             <asp:Button ID="btnTimkiem" CssClass="btngo" runat="server" Text=" TÌM KIẾM/검색 " 
                onclick="btnTimkiem_Click" Height="36" Width="114" style="background-color: #025dab;color: #ffffff;"/>
        </li>
        </ul>
        <ul class="thongtintdld" id="thongtindoanhnghiep" runat="server">
        <li> <center>
          <span class="thongtindn"> THÔNG TIN CHUNG VỀ DOANH NGHIỆP  <br />
            기업의정보
         </span></center>
        </li>


        
         
        <li>
            <span class="tencongtydk">1- Tên công ty<br />&nbsp;&nbsp;&nbsp; 회사명 <b>(*)</b> </span>
            <asp:TextBox ID="txtTencongty" Width="700" Height="30" runat="server"></asp:TextBox>
        </li>
        <li>
            <span class="tencongtydk">2- Ngành nghề <br />&nbsp;&nbsp;&nbsp;업종 <b>(*)</b></span>

             <asp:DropDownList ID="cbonganhnghe" runat="server" Height="36" Width="270" style="float:left" CssClass="txthodem">
            </asp:DropDownList>

            <span class="chucdanh">Mô tả<br /> 서술</span>
            <asp:TextBox ID="txtmota" runat="server" Width="350" style="float:left;" Height="30"></asp:TextBox>
        </li>
        <li><span class="tencongtydk">3- Địa chỉ công ty<br />&nbsp;&nbsp;&nbsp; 회사 주소 <b>(*)</b></span>
            <asp:TextBox ID="txtdiachicongty" Width="270" runat="server" Height="30" CssClass="txtdiachicongty"></asp:TextBox>
            
            <asp:TextBox ID="txthuyen" runat="server" Width="230" Height="30" CssClass="txtdiachicongty"></asp:TextBox>
            <select class="danhmucnghe" style="width:195px;height:36px;" id="cboTinh" runat="server">
            <option value="">---</option>
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

        </li>
        <li>
            <span class="tencongtydk">4- Website<br />&nbsp;&nbsp;&nbsp; 회사 홈페이지</span>
            <asp:TextBox ID="txtwebsite" Width="700" Height="30" runat="server"></asp:TextBox>
        </li>
        <li>
            <span class="tencongtydk">5- Tên người liên hệ<br />&nbsp;&nbsp;&nbsp;연락자명 <b>(*)</b></span>
            <select style="height:36px;float:left;" id="Mr" runat="server">
            <option value="">---</option>
                <option value="Mr">Mr</option>
                <option value="Ms">Ms</option>
                <option value="Mrs">Mrs</option>
            </select>
            <asp:TextBox ID="txtnguoilienhe" Width="653" Height="30" runat="server"></asp:TextBox>
        </li>
        <li>
        <span class="tencongtydk">6- Chức danh <br />&nbsp;&nbsp;&nbsp;직명</span>
            <asp:TextBox ID="txtchucdanh" Width="700" Height="30" runat="server"></asp:TextBox>
        </li>
        <li>
        <span class="tencongtydk">7- Điện thoại<br />&nbsp;&nbsp;&nbsp; 전화번호 <b>(*)</b></span>
            <asp:TextBox ID="txtdienthoailienhe" Width="700" Height="30" runat="server" onkeypress="return isNumberKey(event)"></asp:TextBox>
        </li>
        <li>
            <span class="tencongtydk">8- Email <br />&nbsp;&nbsp;&nbsp;이메일 <b>(*)</b></span>
            <asp:TextBox ID="txtemail" Width="700" Height="30" runat="server"></asp:TextBox>
        </li>

         <li>
            <span class="tencongtydk">9- Mã tuyển dụng <br />&nbsp;&nbsp;&nbsp;채용번호</span>
            <asp:TextBox ReadOnly="true" ID="txtmaTuyendung" Width="700" Height="30" runat="server" CssClass="txtlaylaimatuyendung"></asp:TextBox>
        </li>

        <li>&nbsp;</li>

        <li>
            <asp:Button ID="btnFinish" CssClass="btnedit" style="margin-right:65px;" runat="server" Text=" 완료 " 
                onclick="btnFinish_Click" />
            <asp:Button ID="btnEdit" CssClass="btnedit"  runat="server" Text=" 내용수정 " OnClientClick="EditInfo(); return false;" />            
        </li>
    </ul>
</div>

<script type="text/javascript" language="javascript">

    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

        return true;
    }


    function EditInfo() {        
        document.getElementById("<%=txtTencongty.ClientID %>").disabled = false;
        document.getElementById("<%=cbonganhnghe.ClientID %>").disabled = false;
        document.getElementById("<%=txtmota.ClientID %>").disabled = false;
        document.getElementById("<%=txtdiachicongty.ClientID %>").disabled = false;

        document.getElementById("<%=txthuyen.ClientID %>").disabled = false;
        document.getElementById("<%=cboTinh.ClientID %>").disabled = false;
        document.getElementById("<%=txtwebsite.ClientID %>").disabled = false;
        document.getElementById("<%=txtnguoilienhe.ClientID %>").disabled = false;

        document.getElementById("<%=txtchucdanh.ClientID %>").disabled = false;
        document.getElementById("<%=txtdienthoailienhe.ClientID %>").disabled = false;
        document.getElementById("<%=txtemail.ClientID %>").disabled = false;
        document.getElementById("<%=Mr.ClientID %>").disabled = false;
    }
</script>