<%@ Control Language="C#" AutoEventWireup="true" CodeFile="dang-ky-thong-tin-tim-viec.ascx.cs" Inherits="Modules_dang_ky_thong_tin_tim_viec" %>
<%@ Register Assembly="SlimeeLibrary" Namespace="SlimeeLibrary" TagPrefix="cc1" %>
<div class="bg_title_cate">
    <div class="title_cate">
        <div class="title_cate_ico">
        </div>
        <a class="a_title_cate">ĐĂNG KÝ THÔNG TIN</a>
    </div>
    <div class="title_cate_right">
    </div>
</div>
<div class="img_24">
    <ul class="nld_dangkytdld">
      <li>
      <span class="dangkytimviec" style="TEXT-ALIGN: center;font-size: 18px;">ĐĂNG KÝ THÔNG TIN TÌM VIỆC </span>
        
     </li>
        <li><span class="thongtindn">I. THÔNG TIN CHUNG</span> </li>
        <li><span class="lblhodem">1- Họ và đệm <b>(*)</b></span>
            <asp:TextBox CssClass="txthodem" ID="txthodem" Width="275px" Height="30" runat="server"></asp:TextBox>
            <span class="lblten_NLD">2- Tên <b>(*)</b></span>
            <asp:TextBox CssClass="txthodem" ID="txtten" Width="275px" Height="30" runat="server"></asp:TextBox>
        </li>
        <li><span class="lblhodem">3- Ngày sinh <b>(*)</b></span>
            <cc1:datepicker id="dpngaysinh" runat="server" autopostback="false" 
                cssclass="txtdiachicongty" onkeypress="return isNumberKey(event)"
                width="275px" height="30" panewidth="275px" culture="vi-VN" 
                >
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
            <span class="cbogioitinh_NLD">4- Giới tính <b>(*)</b></span>
            <select class="danhmucnghe" style="width: 288px; height: 36px;" id="cboGioitinh"
                runat="server">
                <option value="Nam">Nam</option>
                <option value="Nữ">Nữ</option>
            </select>
        </li>
        <li><span class="lblhodem">5- Số hộ chiếu <b>(*)</b></span>
            <asp:TextBox CssClass="txthodem" placeholder="C1021113" ID="txtCMND" Width="690px" Height="30" runat="server"></asp:TextBox>
        </li>
        <li style="height:73px">
        
        <span class="lblCMND_NLD"><br />6- Địa chỉ cư trú <b>(*)</b></span>



            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>Số nhà, thôn, xã</td>
                    <td><span class="lblhuyen">Huyện</span></td>
                    <td><span class="lblhuyen">Tỉnh</span></td>
                </tr>

                 <tr>
                    <td> <asp:TextBox CssClass="txthodem" ID="txtDiachi" Width="240px" Height="30" runat="server"></asp:TextBox></td>
                    <td><asp:TextBox CssClass="txthodem" ID="txtHuyen" Width="200px" runat="server" Height="30"></asp:TextBox></td>
                    <td>
                    
                    <select class="danhmucnghe" style="width: 235px; height: 36px;" id="cboTinh" runat="server">
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
        <li><span class="lblCMND_NLD">7- Tên chương trình<br />
            &nbsp;&nbsp;&nbsp; đã tham gia <b>(*)</b></span>
            <select class="danhmucnghe" style="width: 290px; height: 36px;" id="cboChuongtrinhthamgia"
                runat="server">
                <option value="">--- --- ---</option>
                <option value="EPS">EPS</option>
                <option value="IM Japan">IM Japan</option>
            </select>
            <span class="lblsoid">Số ID tại nước
                <br />
                ngoài</span>
            <asp:TextBox CssClass="txthodem" ID="txtIDnuocngoai" placeholder="890414-5164324" Width="276px" Height="30" runat="server"></asp:TextBox>
        </li>
        <li><span class="lblhodem">8- Ngày xuất cảnh</span>
            <cc1:datepicker id="dpNgayxuatcanh" runat="server" autopostback="false" cssclass="txtdiachicongty" onkeypress="return isNumberKey(event)" 
                width="275px" height="30" panewidth="275px" culture="vi-VN">
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
            <span class="lblngayvenuoc">9- Ngày về<br />
                &nbsp;&nbsp;&nbsp; nước <b>(*)</b></span>
            <cc1:datepicker id="dpNgayvenuoc" runat="server" autopostback="false" cssclass="txtdiachicongty"
                width="275px" height="30" panewidth="275px" culture="vi-VN">
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
        <li><span class="lblCMND_NLD">10- Số điện thoại<br />
            &nbsp;&nbsp;&nbsp;liên hệ <b>(*)</b></span>
            <asp:TextBox CssClass="txthodem" ID="txtDienthoai" Width="275px" Height="30" runat="server" style="float:left" onkeypress="return isNumberKey(event)"></asp:TextBox>
            <span class="lblsoid">11- Địa chỉ<br />
                &nbsp;&nbsp;&nbsp; email <b>(*)</b></span>
            <asp:TextBox CssClass="txthodem" ID="txtEmail" Width="275px" runat="server" Height="30"></asp:TextBox>
        </li>
        <li><span class="thongtindn">II. THÔNG TIN VỀ TRÌNH ĐỘ, CHUYÊN MÔN, KINH NGHIỆM LÀM
            VIỆC</span> </li>
        <li><span class="lblhodem">12- Ngoại ngữ <b>(*)</b></span>
            <select class="danhmucnghe" style="width: 290px; height: 36px;" id="cboNgoaingu"
                runat="server">
                <option value="">--- --- ---</option>
                <option value="Tiếng Hàn">Tiếng Hàn</option>
                <option value="Tiếng Nhật">Tiếng Nhật</option>
            </select>
            <span class="lblsoid">13- Chứng chỉ<br />
                /trình độ</span>
            <select class="danhmucnghe" style="width: 290px; height: 36px;" id="cboChungchi"
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
        <li><span class="lblCMND_NLD">14- Ngành nghề được đào tạo <b>(*)</b></span>
            <asp:DropDownList ID="cboNganhngheduocdaotao1" runat="server" CssClass="txthodem"
                Style="width: 290px; height: 36px;margin-right:87px">
            </asp:DropDownList>
            <span class="lbltuden">Từ</span>
            <cc1:datepicker id="dpDaotaotu1" runat="server" autopostback="false" cssclass="txtdiachicongty" onkeypress="return isNumberKey(event)"
                width="70" height="30" panewidth="150px" culture="vi-VN">
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
            <span class="lbltuden">Đến</span>
            <cc1:datepicker id="dpDaotaoden1" runat="server" autopostback="false" cssclass="txtdiachicongty" onkeypress="return isNumberKey(event)"
                width="70" height="30" panewidth="150px" culture="vi-VN">
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
        <li><span class="lblhodem">15- Bằng cấp <b>(*)</b></span>
            <select class="danhmucnghe" style="width: 290px; height: 36px;margin-right:87px" id="cboBangcap1"
                runat="server">
                <option value="">--- --- ---</option>
                <option value="Đại học">Đại học</option>
                <option value="Cao đẳng">Cao đẳng</option>
                <option value="Trung cấp">Trung cấp</option>
                <option value="Chứng chỉ">Chứng chỉ</option>
                <option value="Khác">Khác</option>
            </select>
            <span class="lbltuden">Khác</span>
            <asp:TextBox CssClass="txthodem" ID="txtBangcapkhac1" Width="275px" Height="30" runat="server"></asp:TextBox>
        </li>
        <li>
            <table width="100%">
                <tr>
                    <td width="170">
                        <span class="nld_nghelamviec">16- Kinh nghiệm làm việc <b>(*)</b></span>
                    </td>
                    <td>
                        <span class="lbltuden">Từ</span>
                    </td>
                    <td>
                        <span class="lbltuden">Đến</span>
                    </td>
                    <td>
                        <span class="nld_cvduocgiao">Công việc được giao <b>(*)</b></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="cboNganhnghelamviectainuocngoai1" runat="server" CssClass="danhmucnghe"
                            Style="width: 290px; height: 36px;">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <cc1:datepicker id="dpCVcuthetu1" runat="server" autopostback="false" cssclass="txtdiachicongty" onkeypress="return isNumberKey(event)"
                            width="70px" height="30" panewidth="150px" culture="vi-VN">
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
                    </td>
                    <td>
                        <cc1:datepicker id="dpCVcutheden1" runat="server" autopostback="false" cssclass="txtdiachicongty" onkeypress="return isNumberKey(event)"
                            width="70px" height="30" panewidth="150px" culture="vi-VN">
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
                    </td>
                    <td>
                        <asp:TextBox CssClass="txthodem" ID="txtCongvieccuthe1" Width="255px" Height="30"
                            runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </li>
        
        <li>
            <table width="100%">
                <tr>
                    <td width="170">
                        <span class="nld_nghelamviec">17- Kinh nghiệm làm việc 2</span>
                    </td>
                    <td>
                        <span class="lbltuden">Từ</span>
                    </td>
                    <td>
                        <span class="lbltuden">Đến</span>
                    </td>
                    <td>
                        <span class="nld_cvduocgiao">Công việc được giao 2</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="cboNganhnghelamviectainuocngoai2" runat="server" CssClass="danhmucnghe"
                            Style="width: 290px; height: 36px;">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <cc1:datepicker id="dpCVcuthetu2" runat="server" autopostback="false" cssclass="txtdiachicongty" onkeypress="return isNumberKey(event)"
                            width="70px" height="30" panewidth="150px" culture="vi-VN">
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
                    </td>
                    <td>
                        <cc1:datepicker id="dpCVcutheden2" runat="server" autopostback="false" cssclass="txtdiachicongty" onkeypress="return isNumberKey(event)"
                            width="70px" height="30" panewidth="150px" culture="vi-VN">
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
                    </td>
                    <td>
                        <asp:TextBox CssClass="txthodem" ID="txtCongvieccuthe2" Width="255px" Height="30" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </li>
        
        <li>
            <table width="100%">
                <tr>
                    <td width="170">
                        <span class="nld_nghelamviec">18- Kinh nghiệm làm việc 3</span>
                    </td>
                    <td>
                        <span class="lbltuden">Từ</span>
                    </td>
                    <td>
                        <span class="lbltuden">Đến</span>
                    </td>
                    <td>
                        <span class="nld_cvduocgiao">Công việc được giao 3</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="cboNganhnghelamviectainuocngoai3" runat="server" CssClass="danhmucnghe"
                            Style="width: 290px; height: 36px;">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <cc1:datepicker id="dpCVcuthetu3" runat="server" autopostback="false" cssclass="txtdiachicongty" onkeypress="return isNumberKey(event)"
                            width="70px" height="30" panewidth="150px" culture="vi-VN">
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
                    </td>
                    <td>
                        <cc1:datepicker id="dpCVcutheden3" runat="server" autopostback="false" cssclass="txtdiachicongty" onkeypress="return isNumberKey(event)"
                            width="70px" height="30" panewidth="150px" culture="vi-VN">
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
                    </td>
                    <td>
                        <asp:TextBox CssClass="txthodem" ID="txtCongvieccuthe3" Width="255px" Height="30" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </li>
        
        <li><span class="nld_yeucautimviec">III. YÊU CẦU TÌM VIỆC </span></li>
        <li><span class="lblCMND_NLD">19- Ngành nghề dự kiến tìm việc <b>(*)</b></span>
            <asp:DropDownList ID="cboNganhnghedukientimviec" runat="server" CssClass="danhmucnghe"
                Style="width: 420px; height: 36px;">
            </asp:DropDownList>
        </li>
        <li><span class="lblCMND_NLD">20- Vị trí việc làm mong muốn <b>(*)</b></span>
            <asp:DropDownList ID="cbovitri" runat="server" class="danhmucnghe" Style="width: 420px;
                height: 36px;">
            </asp:DropDownList>
        </li>
        <li><span class="lblCMND_NLD">21- Mức lương mong muốn <b>(*)</b></span>
            <select id="choMucluongmongmuon" runat="server" class="danhmucnghe" style="width: 420px;
                height: 36px;">
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
        <li><span class="lblCMND_NLD">22- Địa điểm làm việc mong muốn</span>
            <select class="danhmucnghe" style="width: 420px; height: 36px;" id="cboDiadiemlamviecmongmuon"
                runat="server">
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
        </li>
        <li><span class="lblCMND_NLD">23- Mã tìm việc</span>
            <asp:TextBox ID="txtMatimviec" Width="413" Height="30" runat="server" Enabled="false"></asp:TextBox>
        </li>

        <li><span class="lblCMND_NLD"></span>
            <div id="html_element"></div>
        </li>

        <li style="text-align: center;">
            <asp:Button ID="btndangky" CssClass="btndangky_nld" runat="server" Text=" ĐĂNG KÝ " OnClientClick="return CheckSubmit()"
                OnClick="btndangky_Click" style="background-color: #b58d0f;color: #ffffff;" />
        </li>
        <li><i id="luuydk" runat="server">(Lưu ý: Anh/chị ghi nhớ Mã tìm việc: <span style="color:Red;font-weight:bold;"> <%= strTV %> </span> để đăng ký tuyển dụng)</i>
        <br /><br />
        <span id="dadangky" runat="server" visible="false" style="color:Red;font-weight:bold;">Bạn đã đăng ký mã tìm việc, đề nghị bạn click <a href="http://colab.gov.vn/nld-sua-thong-tin.aspx"> tại đây </a>để tra cứu Mã tìm việc</span>
        </li>
        <li><br /><span class="lblcodangkyphien">Anh/chị có đăng ký tuyển dụng tại Phiên GDVL hoặc các công ty tuyển dụng trực tiếp?</span>
            <asp:Button ID="btndangkytiep" CssClass="btnyesno" runat="server" Text=" YES " OnClick="btndangkytiep_Click" />
            <asp:Button ID="btndangkyhuy" CssClass="btnyesno" runat="server" Text=" NO " OnClick="btndangkyhuy_Click" />
        </li>
    </ul>
</div>
<%-- Recaptcha V2 --%>
<style>
    #html_element{
        margin-left:135px;
    }
</style>
<script type="text/javascript">
    var verifyCallback = function (response) {
        //console.log(response);
        $("#<%=btndangkytiep.ClientID %>").removeAttr("disabled");

      };
    var onloadCallback = function () {
          $("#<%=btndangkytiep.ClientID %>").attr("disabled", 'disabled');
        grecaptcha.render('html_element', {
            'sitekey': '6LfGl9sUAAAAAC4541f2FI42iBvMfUxrK6LsvycP',
            'callback' : verifyCallback,
        });
      };
    </script>
<script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
        async defer>
    </script>
<%-- end Recaptcha v2 --%>
<script type="text/javascript" language="javascript">

    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

        return true;
    }


    function validateEmail(email) {
        var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\ ".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA -Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
        return email.match(re);
    }

    function CheckSubmit() {

        var txthodem = document.getElementById("<%=txthodem.ClientID %>").value;
        var txtten = document.getElementById("<%=txtten.ClientID %>").value;
        var dpngaysinh = document.getElementById("<%=dpngaysinh.ClientID %>").value;

       

        var txtCMND = document.getElementById("<%=txtCMND.ClientID %>").value;
        var txtDiachi = document.getElementById("<%=txtDiachi.ClientID %>").value;
        var txtIDnuocngoai = document.getElementById("<%=txtIDnuocngoai.ClientID %>").value;

        var dpNgayxuatcanh = document.getElementById("<%=dpNgayxuatcanh.ClientID %>").value;
        var dpNgayvenuoc = document.getElementById("<%=dpNgayvenuoc.ClientID %>").value;
        var txtDienthoai = document.getElementById("<%=txtDienthoai.ClientID %>").value;
        var txtEmail = document.getElementById("<%=txtEmail.ClientID %>").value;

        var txtCongvieccuthe1 = document.getElementById("<%=txtCongvieccuthe1.ClientID %>").value;
        var txtCongvieccuthe2 = document.getElementById("<%=txtCongvieccuthe2.ClientID %>").value;
        var txtCongvieccuthe3 = document.getElementById("<%=txtCongvieccuthe3.ClientID %>").value;


        if (txthodem == "") {
            alert("Họ và đệm (*)");
            document.getElementById("<%=txthodem.ClientID %>").focus();
            return false;
        }
        else if (txtten == "") {
            alert("2- Tên (*)");
            document.getElementById("<%=txtten.ClientID %>").focus();
            return false;
        }
        else if (dpngaysinh == "1/1/0001 12:00:00 AM") {
            alert("3- Ngày sinh (*)");
            document.getElementById("<%=dpngaysinh.ClientID %>").focus();
            return false;
        }

        else if (txtCMND == "") {
            alert("5- Số CMND/Hộ chiếu (*)");
            document.getElementById("<%=txtCMND.ClientID %>").focus();
            return false;
        }
        else if (txtDiachi == "") {
            alert("6- Địa chỉ cư trú (*)");
            document.getElementById("<%=txtDiachi.ClientID %>").focus();
            return false;
        }
        else if (txtIDnuocngoai == "") {
            alert("Số ID tại nước ngoài (*)");
            document.getElementById("<%=txtIDnuocngoai.ClientID %>").focus();
            return false;
        }
        else if (dpNgayxuatcanh == "") {
            alert("8- Ngày xuất cảnh (*)");
            document.getElementById("<%=dpNgayxuatcanh.ClientID %>").focus();
            return false;
        }

        else if (dpNgayvenuoc == "") {
            alert("9- Ngày về nước (*)");
            document.getElementById("<%=dpNgayvenuoc.ClientID %>").focus();
            return false;
        }
        else if (txtDienthoai == "") {
            alert("10- Số điện thoại liên hệ (*)");
            document.getElementById("<%=txtDienthoai.ClientID %>").focus();
            return false;
        }
        else if (txtEmail == "") {
            alert("11- Địa chỉ Email (*)");
            document.getElementById("<%=txtEmail.ClientID %>").focus();
            return false;
        }
        else if (!validateEmail(txtEmail)) {
            alert("Sai định dạng Email (*)");
            document.getElementById("<%=txtEmail.ClientID %>").focus();
            return false;
        }
        else if (txtCongvieccuthe1 == "") {
            alert("17- Công việc cụ thể được giao (*)");
            document.getElementById("<%=txtCongvieccuthe1.ClientID %>").focus();
            return false;
        }     


        else {
            return true;
        }


    }
</script>
