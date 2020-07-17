<%@ Control Language="C#" AutoEventWireup="true" CodeFile="business-info.ascx.cs"
    Inherits="Modules_business_info" %>
<%@ Register Assembly="SlimeeLibrary" Namespace="SlimeeLibrary" TagPrefix="cc1" %>
<div class="bg_title_cate1">
    <div class="title_cate">
        <div class="title_cate_ico">
        </div>
        <a class="a_title_cate">Đăng ký tuyển dụng lao động</a>
    </div>
    <div class="title_cate_right">
    </div>
</div>
<div class="img_240">
    <ul class="thongtintdld">
        <li>
            <center>
                <span class="thongtindn">ĐĂNG KÝ TUYỂN DỤNG LAO ĐỘNG
                    <br />
                </span>
            </center>
        </li>
        <li><span class="thongtindn">A. THÔNG TIN DOANH NGHIỆP/ 기업의정보</span> </li>
        <li><span class="tencongty">1- Tên công ty
            <br />
            &nbsp;&nbsp;&nbsp;회 사명</span>
            <asp:TextBox Enabled="false" ID="txttencongty" Width="368" Height="30" runat="server"></asp:TextBox>
        </li>
        <li><span class="tencongty">2- Địa chỉ công ty<br />
            &nbsp;&nbsp;&nbsp; 회사 주소</span>
            <asp:TextBox Enabled="false" ID="txtdiachicongty" Width="368" Height="30" runat="server"></asp:TextBox>
        </li>
        <li><span class="tencongty">3- Tên người liên hệ<br />
            &nbsp;&nbsp;&nbsp;연락자명</span>
            <asp:TextBox Enabled="false" ID="txtnguoilienhe" Width="137px" Height="30" runat="server"></asp:TextBox>
            <span class="chucdanh">Chức danh
                <br />
                직명</span>
            <asp:TextBox Enabled="false" ID="txtchucdanh" Width="146px" Height="30" runat="server"></asp:TextBox>
        </li>
        <li><span class="tencongty">4- Số điện thoại liên hệ<br />
            &nbsp;&nbsp;&nbsp;전화번호</span>
            <asp:TextBox Enabled="false" ID="txtdienthoailienhe" Width="137px" Height="30" runat="server"></asp:TextBox>
            <span class="chucdanh">Email
                <br />
                이메일</span>
            <asp:TextBox Enabled="false" ID="txtemail" Width="146px" Height="30" runat="server"></asp:TextBox>
        </li>
        <li><span class="tencongty">5- Mã tuyển dụng<br />
            &nbsp;&nbsp;&nbsp;채용번호</span>
            <asp:TextBox ID="txtMaTD" Width="368" Enabled="false" Height="30" runat="server"></asp:TextBox>
        </li>
        <li>&nbsp;</li>
        <li><span class="thongtindn">B. THÔNG TIN TUYỂN DỤNG/ 채용정보</span> </li>
        <li><span class="tencongty">6- Vị trí tuyển dụng<br />
            &nbsp;&nbsp;&nbsp; 채용 부서 <b>(*)</b></span>
            <asp:DropDownList ID="cbovitri" runat="server" CssClass="txthodem" Height="36" Width="152px">
            </asp:DropDownList>
            <span class="chucdanh">Mô tả
                <br />
                서술 </span>
            <asp:TextBox ID="txtmota" Width="137px" Height="30" runat="server"></asp:TextBox>
        </li>
        <li><span class="tencongty">7- Số lượng cần tuyển<br />
            &nbsp;&nbsp;&nbsp; 채용 인원수<b> (*)</b></span>
            <asp:TextBox ID="txtsoluongtuyen" Width="148px" Height="30" runat="server" onkeypress="return isNumberKey(event)"></asp:TextBox>&nbsp;
            Người
            <br />
            &nbsp;&nbsp;&nbsp; 명 </li>
        <li><span class="tencongty">8- Kỹ năng giao tiếp tiếng Hàn / 한국어능력</span>
            <select class="danhmucnghe" style="width: 152px; height: 36px;" id="txtkynanggiaotieptienghan"
                runat="server">
                <option value="">--- --- ---</option>
                <option value="TOPIK1">TOPIK 1</option>
                <option value="TOPIK2">TOPIK 2</option>
                <option value="TOPIK3">TOPIK 3</option>
                <option value="TOPIK4">TOPIK 4</option>
                <option value="TOPIK5">TOPIK 5</option>
                <option value="N1">N1</option>
                <option value="N2">N2</option>
                <option value="N3">N3</option>
                <option value="N4">N4</option>
                <option value="N5">N5</option>
                <option value="Khác">Khác</option>
            </select>
        </li>
        <span class="kinhnghiemtoithieu">9- Kinh nghiệm làm việc / 최소한경력</span>
        <li><span class="tencongty">Nghề làm việc
            <br />
            &nbsp;&nbsp;&nbsp; 직업/업종</span>
            <asp:DropDownList ID="cboNganhngheduocdaotao" runat="server" CssClass="danhmucnghe"
                Style="width: 152px; height: 36px;">
            </asp:DropDownList>
            <span class="chucdanh">Năm làm việc/년</span>
            <select class="danhmucnghe" style="width: 143px; height: 36px;" id="cboNamlamviec"
                runat="server">
                <option value="">--- --- ---</option>
                <option value="1 năm">1 năm</option>
                <option value="2 năm">2 năm</option>
                <option value="3 năm">3 năm</option>
                <option value="4 năm">4 năm</option>
                <option value="5 năm">5 năm</option>
                <option value="6 năm">6 năm</option>
                <option value="7 năm">7 năm</option>
                <option value="8 năm">8 năm</option>
                <option value="9 năm">9 năm</option>
                <option value="10 năm">10 năm</option>
            </select>
        </li>
        <li><span class="tencongty">10- Bằng cấp/Chứng chỉ
            <br />
            &nbsp;&nbsp;&nbsp; 학벌/자격증</span>
            <select class="danhmucnghe" style="width: 152px; height: 36px;" id="cboBangcap" runat="server">
                 <option value="">--- --- ---</option>
                <option value="Đại học">Đại học</option>
                <option value="Cao đẳng nghề">Cao đẳng nghề</option>
                <option value="Trung cấp nghề">Trung cấp nghề</option>
                <option value="Chứng chỉ nghề">Chứng chỉ nghề</option>
                <option value="Không">Không</option>
                <option value="Khác">Khác</option>
            </select>
            <span class="chucdanh">Chi tiết<br />
                상세</span>
            <asp:TextBox ID="txtbangcapchitiet" Width="137px" Height="30" runat="server"></asp:TextBox>
        </li>
        <li><span class="tencongty">11- Độ tuổi từ<br />
            &nbsp;&nbsp;&nbsp; 연령</span>
            <asp:TextBox ID="txtdotuoitu" Width="146px" Height="30" runat="server" onkeypress="return isNumberKey(event)"></asp:TextBox>
            <span class="chucdanh">Đến<br />
                까지</span>
            <asp:TextBox ID="txtdotuoiden" Height="30" Width="137px" runat="server" onkeypress="return isNumberKey(event)"></asp:TextBox>
        </li>
        <li><span class="tencongty">12- Giới tính<br />
            &nbsp;&nbsp;&nbsp; 성별</span>
            <asp:RadioButtonList ID="rblGioitinh" RepeatColumns="2" runat="server">
                <asp:ListItem Text="Nam/남" Value="Nam/남" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Nữ/여" Value="Nữ/여"></asp:ListItem>
            </asp:RadioButtonList>
        </li>
        <li><span class="tencongty">13- Địa phương cư trú
            <br />
            &nbsp;&nbsp;&nbsp;거주지</span>
            <select class="danhmucnghe" style="width: 374px; height: 36px;" id="txtnoicutru"
                runat="server">
                <option value="Không yêu cầu">Không yêu cầu</option>
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
        <li><span class="tencongty">14- Mức lương tối thiểu<br />
            &nbsp;&nbsp;&nbsp;최소임금 <b>(*)</b></span>
            <select id="txtmucluongtoithieu" runat="server" class="danhmucnghe" style="width: 152px;
                height: 36px">
                <option value="">--- --- ---</option>
                <option value="< 5000000">< 5,000,000 VNĐ</option>
                <option value="6000000">6,000,000 VNĐ</option>
                <option value="7000000">7,000,000 VNĐ</option>
                <option value="8000000">8,000,000 VNĐ</option>
                <option value="9000000">9,000,000 VNĐ</option>
                <option value="10000000">10,000,000 VNĐ</option>
                <option value="11000000">11,000,000 VNĐ</option>
                <option value="12000000">12,000,000 VNĐ</option>
                <option value="13000000">13,000,000 VNĐ</option>
                <option value="14000000">14,000,000 VNĐ</option>
                <option value="15000000">15,000,000 VNĐ</option>
                <option value="Thỏa thuận">Thỏa thuận</option>
            </select>
        </li>
        <li><span class="tencongty">15- Thưởng
            <br />
            &nbsp;&nbsp;&nbsp; 상여금</span>
            <asp:TextBox ID="txtthuong" Width="148px" Height="30" runat="server" onkeypress="return isNumberKey(event)"></asp:TextBox>
            <span class="chucdanh">Theo
                <br />
                상세</span>

                 <select id="rblThuong" runat="server" class="danhmucnghe" style="width: 141px;
                height: 36px">
                <option value="">--- --- ---</option>
                <option value="Tháng/년">Tháng/년</option>
                <option value="Quý/분기">Quý/분기</option>
                <option value="Năm/월">Năm/월</option>
                 </select>

           
        </li>
        <li><span class="tencongty">16- Các chế độ đãi ngộ khác<br />
            &nbsp;&nbsp;&nbsp; 다른 대우 제도</span>
            <asp:TextBox ID="txtchedodaingokhac" Width="368px" Height="30" runat="server"></asp:TextBox>
        </li>
        <li><span class="tencongty">17- Hồ sơ dự tuyển
            <br />
            &nbsp;&nbsp;&nbsp;응시서류 <b>(*)</b></span>
            <asp:TextBox ID="txthosodutuyen" Width="368px" Height="30" runat="server"></asp:TextBox>
        </li>
        <li><span class="tencongty">18- Thời gian tiếp nhận hồ sơ từ / 접수기간 <b>(*)</b></span>
            <cc1:datepicker id="txtnhanhosotu" runat="server" autopostback="false" cssclass="txtdiachicongty"
                width="120px" height="30" panewidth="150px" culture="vi-VN">
                <panetablestyle bordercolor="#707070" borderwidth="1px" borderstyle="Solid" />
                <paneheaderstyle backcolor="#0099FF" />
                <titlestyle forecolor="White" font-bold="true" />
                <nextprevmonthstyle forecolor="White" font-bold="true" />
                <nextprevyearstyle forecolor="#E0E0E0" font-bold="true" />
                <dayheaderstyle backcolor="#E8E8E8" />
                <todaystyle backcolor="#FFFFCC" forecolor="#000000" font-underline="false" bordercolor="#FFCC99" />
                <alternatemonthstyle backcolor="#F0F0F0" forecolor="#707070" font-underline="false" />
                <monthstyle backcolor="" forecolor="#000000" font-underline="false" />
            </cc1:datepicker>
            <span class="chucdanh">Đến<br />
                까지</span>
            <cc1:datepicker id="txtnhanhosoden" runat="server" autopostback="false" width="125px"
                height="30" panewidth="150px" culture="vi-VN">
                <panetablestyle bordercolor="#707070" borderwidth="1px" borderstyle="Solid" />
                <paneheaderstyle backcolor="#0099FF" />
                <titlestyle forecolor="White" font-bold="true" />
                <nextprevmonthstyle forecolor="White" font-bold="true" />
                <nextprevyearstyle forecolor="#E0E0E0" font-bold="true" />
                <dayheaderstyle backcolor="#E8E8E8" />
                <todaystyle backcolor="#FFFFCC" forecolor="#000000" font-underline="false" bordercolor="#FFCC99" />
                <alternatemonthstyle backcolor="#F0F0F0" forecolor="#707070" font-underline="false" />
                <monthstyle backcolor="" forecolor="#000000" font-underline="false" />
            </cc1:datepicker>
        </li>
        <li><span class="tencongty">19- Thời gian tuyển<br />
            &nbsp;&nbsp;&nbsp; 선발시험 (면접등) 기간 <b>(*)</b></span>
            <cc1:datepicker id="txtthoigiantuyen" runat="server" autopostback="false" width="120px"
                height="30" panewidth="150px" enabletheming="true" culture="vi-VN">
                <panetablestyle bordercolor="#707070" borderwidth="1px" borderstyle="Solid" />
                <paneheaderstyle backcolor="#0099FF" />
                <titlestyle forecolor="White" font-bold="true" />
                <nextprevmonthstyle forecolor="White" font-bold="true" />
                <nextprevyearstyle forecolor="#E0E0E0" font-bold="true" />
                <dayheaderstyle backcolor="#E8E8E8" />
                <todaystyle backcolor="#FFFFCC" forecolor="#000000" font-underline="false" bordercolor="#FFCC99" />
                <alternatemonthstyle backcolor="#F0F0F0" forecolor="#707070" font-underline="false" />
                <monthstyle backcolor="" forecolor="#000000" font-underline="false" />
            </cc1:datepicker>
        </li>
        <li>
            <asp:Button ID="btndangky" CssClass="btndangky" runat="server" Text="ĐĂNG KÝ/ 신청 "
                OnClientClick="return CheckSubmit()" OnClick="btndangky_Click" />
        </li>

        <li>
            <asp:Label ID="lblDangtuyenSuscess" runat="server" Text=""></asp:Label>
        </li>

        <li id="dkboxung" runat="server"><span class="tencongty">Quý công ty có đăng ký bổ sung vị trí tuyển dụng?
            <br />
            채용부서 추가신청 </span>
            <asp:Button ID="btndangkytiep" CssClass="btnyesno" runat="server" Text=" YES " OnClick="btndangkytiep_Click" />
            <asp:Button ID="btndangkyhuy" CssClass="btnyesno" runat="server" Text=" NO " OnClick="btndangkyhuy_Click" />
        </li>
    </ul>
</div>
<script type="text/javascript" language="javascript">
    function Comma(Num) { //function to add commas to textboxes
        Num += '';
        Num = Num.replace(',', ''); Num = Num.replace(',', ''); Num = Num.replace(',', '');
        Num = Num.replace(',', ''); Num = Num.replace(',', ''); Num = Num.replace(',', '');
        x = Num.split('.');
        x1 = x[0];
        x2 = x.length > 1 ? '.' + x[1] : '';
        var rgx = /(\d+)(\d{3})/;
        while (rgx.test(x1))
            x1 = x1.replace(rgx, '$1' + ',' + '$2');
        return x1 + x2;
    }
</script>
<script type="text/javascript" language="javascript">

    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

        return true;
    }

    function CheckSubmit() {
        var txtsoluongtuyen = document.getElementById("<%=txtsoluongtuyen.ClientID %>").value;
        var txtmucluongtoithieu = document.getElementById("<%=txtmucluongtoithieu.ClientID %>").value;
        var txthosodutuyen = document.getElementById("<%=txthosodutuyen.ClientID %>").value;



        if (txtsoluongtuyen == "") {
            alert("7- 채용인원수 (*)");
            document.getElementById("<%=txtsoluongtuyen.ClientID %>").focus();
            return false;
        }
        else if (txtmucluongtoithieu == "") {
            alert("14- 최소임금 (*)");
            document.getElementById("<%=txtmucluongtoithieu.ClientID %>").focus();
            return false;
        }
        else if (txthosodutuyen == "") {
            alert("17- 응시서류 (*)");
            document.getElementById("<%=txthosodutuyen.ClientID %>").focus();
            return false;
        }
        else {
            return true;
        }
    }
</script>
