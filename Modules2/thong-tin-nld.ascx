<%@ Control Language="C#" AutoEventWireup="true" CodeFile="thong-tin-nld.ascx.cs" Inherits="Modules_thong_tin_nld" %>

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
    <ul class="dangkytdld2">
        <li><span class="thongtindn">I. THÔNG TIN CHUNG</span> </li>
        <li><span class="lblhodem">1- Họ và đệm (*)</span>
            <asp:TextBox CssClass="txthodem" ID="txthodem" Width="150px" runat="server"></asp:TextBox>
            <span class="lblten">2- Tên (*)</span>
            <asp:TextBox CssClass="txthodem" ID="txtten" Width="167px" runat="server"></asp:TextBox>
        </li>
        <li><span class="lblhodem">3- Ngày sinh (*)</span>
            <cc1:DatePicker ID="dpngaysinh" runat="server" AutoPostBack="false" CssClass="txtdiachicongty"
                Width="128px" PaneWidth="150px" Culture="vi-VN">
                <PaneTableStyle BorderColor="#707070" BorderWidth="1px" BorderStyle="Solid" />
                <PaneHeaderStyle BackColor="#0099FF" />
                <TitleStyle ForeColor="White" Font-Bold="true" />
                <NextPrevMonthStyle ForeColor="White" Font-Bold="true" />
                <NextPrevYearStyle ForeColor="#E0E0E0" Font-Bold="true" />
                <DayHeaderStyle BackColor="#E8E8E8" />
                <TodayStyle BackColor="#FFFFCC" ForeColor="#000000" Font-Underline="false" BorderColor="#FFCC99" />
                <AlternateMonthStyle BackColor="#F0F0F0" ForeColor="#707070" Font-Underline="false" />
                <MonthStyle BackColor="" ForeColor="#000000" Font-Underline="false" />
            </cc1:DatePicker>
            <span class="lblten">4- Giới tính (*)</span>          
            <select class="danhmucnghe" style="width: 55px; height: 21px;" id="cboGioitinh" runat="server">
                <option value="1">Nam</option>
                <option value="0">Nữ</option>
            </select>
        </li>
        <li><span class="lblCMND">5- Số CMND/Hộ chiếu (*)</span>
            <asp:TextBox CssClass="txthodem" ID="txtCMND" Width="397px" runat="server"></asp:TextBox>
        </li>
        <li><span class="lblhodem">6- Địa chỉ cư trú (*)</span>
            <asp:TextBox CssClass="txthodem" ID="txtDiachi" Width="150px" runat="server"></asp:TextBox>
            <span class="lblhuyen">Huyện</span>
            <asp:TextBox CssClass="txthodem" ID="txtHuyen" Width="83px" runat="server"></asp:TextBox>
            <span class="lblhuyen">Tỉnh</span>
            <select class="danhmucnghe" style="width: 68px; height: 21px;" id="cboTinh" runat="server">
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
        <li><span class="lblchuongtrinhthamgia">7- Tên chương trình đã tham gia (*)</span>
            <select class="danhmucnghe" style="width: 75px; height: 21px;" id="cboChuongtrinhthamgia"
                runat="server">
                <option value="EPS">EPS</option>
                <option value="IM Japan">IM Japan</option>
            </select>
            <span class="lblsoid">Số ID tại nước ngoài (*)</span>
            <asp:TextBox CssClass="txthodem" ID="txtIDnuocngoai" Width="113px" runat="server"></asp:TextBox>
        </li>
        <li><span class="lblhodem">8- Ngày xuất cảnh (*)</span>
            <cc1:DatePicker ID="dpNgayxuatcanh" runat="server" AutoPostBack="false" CssClass="txtdiachicongty"
                Width="126px" PaneWidth="150px" Culture="vi-VN">
                <PaneTableStyle BorderColor="#707070" BorderWidth="1px" BorderStyle="Solid" />
                <PaneHeaderStyle BackColor="#0099FF" />
                <TitleStyle ForeColor="White" Font-Bold="true" />
                <NextPrevMonthStyle ForeColor="White" Font-Bold="true" />
                <NextPrevYearStyle ForeColor="#E0E0E0" Font-Bold="true" />
                <DayHeaderStyle BackColor="#E8E8E8" />
                <TodayStyle BackColor="#FFFFCC" ForeColor="#000000" Font-Underline="false" BorderColor="#FFCC99" />
                <AlternateMonthStyle BackColor="#F0F0F0" ForeColor="#707070" Font-Underline="false" />
                <MonthStyle BackColor="" ForeColor="#000000" Font-Underline="false" />
            </cc1:DatePicker>

            <span class="lblngayvenuoc">9- Ngày về nước (*)</span>
            <cc1:DatePicker ID="dpNgayvenuoc" runat="server" AutoPostBack="false" CssClass="txtdiachicongty"
                Width="114px" PaneWidth="150px" Culture="vi-VN">
                <PaneTableStyle BorderColor="#707070" BorderWidth="1px" BorderStyle="Solid" />
                <PaneHeaderStyle BackColor="#0099FF" />
                <TitleStyle ForeColor="White" Font-Bold="true" />
                <NextPrevMonthStyle ForeColor="White" Font-Bold="true" />
                <NextPrevYearStyle ForeColor="#E0E0E0" Font-Bold="true" />
                <DayHeaderStyle BackColor="#E8E8E8" />
                <TodayStyle BackColor="#FFFFCC" ForeColor="#000000" Font-Underline="false" BorderColor="#FFCC99" />
                <AlternateMonthStyle BackColor="#F0F0F0" ForeColor="#707070" Font-Underline="false" />
                <MonthStyle BackColor="" ForeColor="#000000" Font-Underline="false" />
            </cc1:DatePicker>


        </li>
        
        <li><span class="lbldienthoailienhe">10- Số điện thoại liên hệ (*)</span>
            <asp:TextBox CssClass="txthodem" ID="txtDienthoai" Width="112px" runat="server"></asp:TextBox>
            <span class="lblngayvenuoc">11- Địa chỉ email (*)</span>
            <asp:TextBox CssClass="txthodem" ID="txtEmail" Width="133px" runat="server"></asp:TextBox>
        </li>
        
        <li><span class="thongtindn">II. THÔNG TIN VỀ TRÌNH ĐỘ, CHUYÊN MÔN, KINH NGHIỆM LÀM
            VIỆC</span> </li>
        <li><span class="lblhodem">12- Ngoại ngữ (*)</span>
            <select class="danhmucnghe" style="width: 120px; height: 21px;" id="cboNgoaingu" runat="server">
                <option value="Tiếng Hàn">Tiếng Hàn</option>
                <option value="Tiếng Nhật">Tiếng Nhật</option>
            </select>
            <span class="lblsoid">13- Chứng chỉ/trình độ</span>
            <select class="danhmucnghe" style="width: 152px; height: 21px;" id="cboChungchi" runat="server">
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

        <li></li>

        <li><span class="lblnganhnghedaotao">14- Ngành nghề được đào tạo (*)</span>
         <asp:DropDownList ID="cboNganhngheduocdaotao1" runat="server" CssClass="txthodem" style="width: 108px; height: 21px;">
            </asp:DropDownList>

           <%-- <select class="danhmucnghe"  id=""
                runat="server">
                <option value="01 - Cơ khí, gia công kim loại">Cơ khí, gia công kim loại</option>
                <option value="02 - Nhựa công nghiệp, sản phẩm nhựa công nghiệp">Nhựa công nghiệp, sản
                    phẩm nhựa công nghiệp</option>
                <option value="03 - Điện tử, sản xuất linh kiện điện tử">Điện tử, sản xuất linh kiện
                    điện tử</option>
                <option value="04 - Sản xuất ôtô, xe máy">Sản xuất ôtô, xe máy</option>
                <option value="05 - Cơ khí đóng tàu">Cơ khí đóng tàu</option>
                <option value="06 - Mộc nội thất">Mộc nội thất</option>
                <option value="07 - Điện lạnh">Điện lạnh</option>
                <option value="08 - Dệt công nghiệp">Dệt công nghiệp</option>
                <option value="09 - May công nghiệp">May công nghiệp</option>
                <option value="10 - Nhuộm công nghiệp">Nhuộm công nghiệp</option>
                <option value="11 - Hóa chất">Hóa chất</option>
                <option value="12 - Mạ công nghiệp">Mạ công nghiệp</option>
                <option value="13 - Đúc công nghiệp ">Đúc công nghiệp </option>
                <option value="14 - Sản xuất, chế biến thực phẩm">Sản xuất, chế biến thực phẩm</option>
                <option value="15 - Nông nghiệp">Nông nghiệp</option>
                <option value="16 - Xây dựng">Xây dựng</option>
                <option value="17 - Dịch vụ nhà hàng, khách sạn">Dịch vụ nhà hàng, khách sạn</option>
                <option value="18 - Thương mại">Thương mại</option>
                <option value="19 - Dịch vụ khác">Dịch vụ khác</option>
                <option value="20 - Khác">Khác</option>
            </select>--%>
             <span class="lbltuden">Từ</span>
            <cc1:DatePicker ID="dpDaotaotu1" runat="server" AutoPostBack="false" CssClass="txtdiachicongty"
                Width="70px" PaneWidth="150px" Culture="vi-VN">
                <PaneTableStyle BorderColor="#707070" BorderWidth="1px" BorderStyle="Solid" />
                <PaneHeaderStyle BackColor="#0099FF" />
                <TitleStyle ForeColor="White" Font-Bold="true" />
                <NextPrevMonthStyle ForeColor="White" Font-Bold="true" />
                <NextPrevYearStyle ForeColor="#E0E0E0" Font-Bold="true" />
                <DayHeaderStyle BackColor="#E8E8E8" />
                <TodayStyle BackColor="#FFFFCC" ForeColor="#000000" Font-Underline="false" BorderColor="#FFCC99" />
                <AlternateMonthStyle BackColor="#F0F0F0" ForeColor="#707070" Font-Underline="false" />
                <MonthStyle BackColor="" ForeColor="#000000" Font-Underline="false" />
            </cc1:DatePicker>
            <span class="lblden">Đến</span>
            <cc1:DatePicker ID="dpDaotaoden1" runat="server" AutoPostBack="false" CssClass="txtdiachicongty"
                Width="73px" PaneWidth="150px" Culture="vi-VN">
                <PaneTableStyle BorderColor="#707070" BorderWidth="1px" BorderStyle="Solid" />
                <PaneHeaderStyle BackColor="#0099FF" />
                <TitleStyle ForeColor="White" Font-Bold="true" />
                <NextPrevMonthStyle ForeColor="White" Font-Bold="true" />
                <NextPrevYearStyle ForeColor="#E0E0E0" Font-Bold="true" />
                <DayHeaderStyle BackColor="#E8E8E8" />
                <TodayStyle BackColor="#FFFFCC" ForeColor="#000000" Font-Underline="false" BorderColor="#FFCC99" />
                <AlternateMonthStyle BackColor="#F0F0F0" ForeColor="#707070" Font-Underline="false" />
                <MonthStyle BackColor="" ForeColor="#000000" Font-Underline="false" />
            </cc1:DatePicker>
        </li>        
        <li><span class="lblhodem">15- Bằng cấp (*)</span>
            <select class="danhmucnghe" style="width: 115px; height: 21px;" id="cboBangcap1" runat="server">
                <option value="Đại học">Đại học</option>
                <option value="Cao đẳng">Cao đẳng</option>
                <option value="Trung cấp">Trung cấp</option>
                <option value="Chứng chỉ">Chứng chỉ</option>
                <option value="Khác">Khác</option>
            </select>
            <span class="lblhuyen">Khác</span>
            <asp:TextBox CssClass="txthodem" ID="txtBangcapkhac1" Width="248px" runat="server"></asp:TextBox>
        </li>
        <li><span class="lblnganhnghe">16- Ngành nghề làm việc tại nước ngoài (*)</span>
             <asp:DropDownList ID="cboNganhnghelamviectainuocngoai1" runat="server" CssClass="danhmucnghe" style="width: 300px; height: 21px;">
            </asp:DropDownList>
           <%-- <select class="danhmucnghe" style="width: 300px; height: 21px;" id=""
                runat="server">
                <option value="01 - Cơ khí, gia công kim loại">Cơ khí, gia công kim loại</option>
                <option value="02 - Nhựa công nghiệp, sản phẩm nhựa công nghiệp">Nhựa công nghiệp, sản
                    phẩm nhựa công nghiệp</option>
                <option value="03 - Điện tử, sản xuất linh kiện điện tử">Điện tử, sản xuất linh kiện
                    điện tử</option>
                <option value="04 - Sản xuất ôtô, xe máy">Sản xuất ôtô, xe máy</option>
                <option value="05 - Cơ khí đóng tàu">Cơ khí đóng tàu</option>
                <option value="06 - Mộc nội thất">Mộc nội thất</option>
                <option value="07 - Điện lạnh">Điện lạnh</option>
                <option value="08 - Dệt công nghiệp">Dệt công nghiệp</option>
                <option value="09 - May công nghiệp">May công nghiệp</option>
                <option value="10 - Nhuộm công nghiệp">Nhuộm công nghiệp</option>
                <option value="11 - Hóa chất">Hóa chất</option>
                <option value="12 - Mạ công nghiệp">Mạ công nghiệp</option>
                <option value="13 - Đúc công nghiệp ">Đúc công nghiệp </option>
                <option value="14 - Sản xuất, chế biến thực phẩm">Sản xuất, chế biến thực phẩm</option>
                <option value="15 - Nông nghiệp">Nông nghiệp</option>
                <option value="16 - Xây dựng">Xây dựng</option>
                <option value="17 - Dịch vụ nhà hàng, khách sạn">Dịch vụ nhà hàng, khách sạn</option>
                <option value="18 - Thương mại">Thương mại</option>
                <option value="19 - Dịch vụ khác">Dịch vụ khác</option>
                <option value="20 - Khác">Khác</option>
            </select>         --%>   
        </li>
        <li>
            <span class="lblcongvieccuthe">17- Công việc cụ thể được giao (*)</span>
            <asp:TextBox CssClass="txthodem" ID="txtCongvieccuthe1" Width="92px" runat="server"></asp:TextBox>
            <span class="lbltuden">Từ</span>
            <cc1:DatePicker ID="dpCVcuthetu1" runat="server" AutoPostBack="false" CssClass="txtdiachicongty"
                Width="70px" PaneWidth="150px" Culture="vi-VN">
                <PaneTableStyle BorderColor="#707070" BorderWidth="1px" BorderStyle="Solid" />
                <PaneHeaderStyle BackColor="#0099FF" />
                <TitleStyle ForeColor="White" Font-Bold="true" />
                <NextPrevMonthStyle ForeColor="White" Font-Bold="true" />
                <NextPrevYearStyle ForeColor="#E0E0E0" Font-Bold="true" />
                <DayHeaderStyle BackColor="#E8E8E8" />
                <TodayStyle BackColor="#FFFFCC" ForeColor="#000000" Font-Underline="false" BorderColor="#FFCC99" />
                <AlternateMonthStyle BackColor="#F0F0F0" ForeColor="#707070" Font-Underline="false" />
                <MonthStyle BackColor="" ForeColor="#000000" Font-Underline="false" />
            </cc1:DatePicker>
            <span class="lblden">Đến</span>
            <cc1:DatePicker ID="dpCVcutheden1" runat="server" AutoPostBack="false" CssClass="txtdiachicongty"
                Width="75px" PaneWidth="150px" Culture="vi-VN">
                <PaneTableStyle BorderColor="#707070" BorderWidth="1px" BorderStyle="Solid" />
                <PaneHeaderStyle BackColor="#0099FF" />
                <TitleStyle ForeColor="White" Font-Bold="true" />
                <NextPrevMonthStyle ForeColor="White" Font-Bold="true" />
                <NextPrevYearStyle ForeColor="#E0E0E0" Font-Bold="true" />
                <DayHeaderStyle BackColor="#E8E8E8" />
                <TodayStyle BackColor="#FFFFCC" ForeColor="#000000" Font-Underline="false" BorderColor="#FFCC99" />
                <AlternateMonthStyle BackColor="#F0F0F0" ForeColor="#707070" Font-Underline="false" />
                <MonthStyle BackColor="" ForeColor="#000000" Font-Underline="false" />
            </cc1:DatePicker>
        </li>

        <li></li>

        <li><span class="lblnganhnghedaotao">18- Ngành nghề được đào tạo 2(*)</span>
         <asp:DropDownList ID="cboNganhngheduocdaotao2" runat="server" CssClass="danhmucnghe" style="width: 108px; height: 21px;">
            </asp:DropDownList>

         <%--   <select class="danhmucnghe" style="width: 108px; height: 21px;" id=""
                runat="server">
                <option value="01 - Cơ khí, gia công kim loại">Cơ khí, gia công kim loại</option>
                <option value="02 - Nhựa công nghiệp, sản phẩm nhựa công nghiệp">Nhựa công nghiệp, sản
                    phẩm nhựa công nghiệp</option>
                <option value="03 - Điện tử, sản xuất linh kiện điện tử">Điện tử, sản xuất linh kiện
                    điện tử</option>
                <option value="04 - Sản xuất ôtô, xe máy">Sản xuất ôtô, xe máy</option>
                <option value="05 - Cơ khí đóng tàu">Cơ khí đóng tàu</option>
                <option value="06 - Mộc nội thất">Mộc nội thất</option>
                <option value="07 - Điện lạnh">Điện lạnh</option>
                <option value="08 - Dệt công nghiệp">Dệt công nghiệp</option>
                <option value="09 - May công nghiệp">May công nghiệp</option>
                <option value="10 - Nhuộm công nghiệp">Nhuộm công nghiệp</option>
                <option value="11 - Hóa chất">Hóa chất</option>
                <option value="12 - Mạ công nghiệp">Mạ công nghiệp</option>
                <option value="13 - Đúc công nghiệp ">Đúc công nghiệp </option>
                <option value="14 - Sản xuất, chế biến thực phẩm">Sản xuất, chế biến thực phẩm</option>
                <option value="15 - Nông nghiệp">Nông nghiệp</option>
                <option value="16 - Xây dựng">Xây dựng</option>
                <option value="17 - Dịch vụ nhà hàng, khách sạn">Dịch vụ nhà hàng, khách sạn</option>
                <option value="18 - Thương mại">Thương mại</option>
                <option value="19 - Dịch vụ khác">Dịch vụ khác</option>
                <option value="20 - Khác">Khác</option>
            </select>--%>
             <span class="lbltuden">Từ</span>
            <cc1:DatePicker ID="dpDaotaotu2" runat="server" AutoPostBack="false" CssClass="txtdiachicongty"
                Width="70px" PaneWidth="150px" Culture="vi-VN">
                <PaneTableStyle BorderColor="#707070" BorderWidth="1px" BorderStyle="Solid" />
                <PaneHeaderStyle BackColor="#0099FF" />
                <TitleStyle ForeColor="White" Font-Bold="true" />
                <NextPrevMonthStyle ForeColor="White" Font-Bold="true" />
                <NextPrevYearStyle ForeColor="#E0E0E0" Font-Bold="true" />
                <DayHeaderStyle BackColor="#E8E8E8" />
                <TodayStyle BackColor="#FFFFCC" ForeColor="#000000" Font-Underline="false" BorderColor="#FFCC99" />
                <AlternateMonthStyle BackColor="#F0F0F0" ForeColor="#707070" Font-Underline="false" />
                <MonthStyle BackColor="" ForeColor="#000000" Font-Underline="false" />
            </cc1:DatePicker>
            <span class="lblden">Đến</span>
            <cc1:DatePicker ID="dpDaotaoden2" runat="server" AutoPostBack="false" CssClass="txtdiachicongty"
                Width="73px" PaneWidth="150px" Culture="vi-VN">
                <PaneTableStyle BorderColor="#707070" BorderWidth="1px" BorderStyle="Solid" />
                <PaneHeaderStyle BackColor="#0099FF" />
                <TitleStyle ForeColor="White" Font-Bold="true" />
                <NextPrevMonthStyle ForeColor="White" Font-Bold="true" />
                <NextPrevYearStyle ForeColor="#E0E0E0" Font-Bold="true" />
                <DayHeaderStyle BackColor="#E8E8E8" />
                <TodayStyle BackColor="#FFFFCC" ForeColor="#000000" Font-Underline="false" BorderColor="#FFCC99" />
                <AlternateMonthStyle BackColor="#F0F0F0" ForeColor="#707070" Font-Underline="false" />
                <MonthStyle BackColor="" ForeColor="#000000" Font-Underline="false" />
            </cc1:DatePicker>
        </li>        
        <li><span class="lblhodem">19- Bằng cấp 2(*)</span>
            <select class="danhmucnghe" style="width: 115px; height: 21px;" id="cboBangcap2" runat="server">
                <option value="Đại học">Đại học</option>
                <option value="Cao đẳng">Cao đẳng</option>
                <option value="Trung cấp">Trung cấp</option>
                <option value="Chứng chỉ">Chứng chỉ</option>
                <option value="Khác">Khác</option>
            </select>
            <span class="lblhuyen">Khác</span>
            <asp:TextBox CssClass="txthodem" ID="txtBangcapkhac2" Width="248px" runat="server"></asp:TextBox>
        </li>
        <li><span class="lblnganhnghe">20- Ngành nghề làm việc tại nước ngoài 2(*)</span>
         <asp:DropDownList ID="cboNganhnghelamviectainuocngoai2" runat="server" CssClass="danhmucnghe" style="width: 300px; height: 21px;">
            </asp:DropDownList>
           <%-- <select class="danhmucnghe" style="width: 300px; height: 21px;" id=""
                runat="server">
                <option value="01 - Cơ khí, gia công kim loại">Cơ khí, gia công kim loại</option>
                <option value="02 - Nhựa công nghiệp, sản phẩm nhựa công nghiệp">Nhựa công nghiệp, sản
                    phẩm nhựa công nghiệp</option>
                <option value="03 - Điện tử, sản xuất linh kiện điện tử">Điện tử, sản xuất linh kiện
                    điện tử</option>
                <option value="04 - Sản xuất ôtô, xe máy">Sản xuất ôtô, xe máy</option>
                <option value="05 - Cơ khí đóng tàu">Cơ khí đóng tàu</option>
                <option value="06 - Mộc nội thất">Mộc nội thất</option>
                <option value="07 - Điện lạnh">Điện lạnh</option>
                <option value="08 - Dệt công nghiệp">Dệt công nghiệp</option>
                <option value="09 - May công nghiệp">May công nghiệp</option>
                <option value="10 - Nhuộm công nghiệp">Nhuộm công nghiệp</option>
                <option value="11 - Hóa chất">Hóa chất</option>
                <option value="12 - Mạ công nghiệp">Mạ công nghiệp</option>
                <option value="13 - Đúc công nghiệp ">Đúc công nghiệp </option>
                <option value="14 - Sản xuất, chế biến thực phẩm">Sản xuất, chế biến thực phẩm</option>
                <option value="15 - Nông nghiệp">Nông nghiệp</option>
                <option value="16 - Xây dựng">Xây dựng</option>
                <option value="17 - Dịch vụ nhà hàng, khách sạn">Dịch vụ nhà hàng, khách sạn</option>
                <option value="18 - Thương mại">Thương mại</option>
                <option value="19 - Dịch vụ khác">Dịch vụ khác</option>
                <option value="20 - Khác">20 - Khác</option>
            </select>   --%>         
        </li>
        <li>
            <span class="lblcongvieccuthe">21- Công việc cụ thể được giao 2(*)</span>
            <asp:TextBox CssClass="txthodem" ID="txtCongvieccuthe2" Width="92px" runat="server"></asp:TextBox>
            <span class="lbltuden">Từ</span>
            <cc1:DatePicker ID="dpCVcuthetu2" runat="server" AutoPostBack="false" CssClass="txtdiachicongty"
                Width="70px" PaneWidth="150px" Culture="vi-VN">
                <PaneTableStyle BorderColor="#707070" BorderWidth="1px" BorderStyle="Solid" />
                <PaneHeaderStyle BackColor="#0099FF" />
                <TitleStyle ForeColor="White" Font-Bold="true" />
                <NextPrevMonthStyle ForeColor="White" Font-Bold="true" />
                <NextPrevYearStyle ForeColor="#E0E0E0" Font-Bold="true" />
                <DayHeaderStyle BackColor="#E8E8E8" />
                <TodayStyle BackColor="#FFFFCC" ForeColor="#000000" Font-Underline="false" BorderColor="#FFCC99" />
                <AlternateMonthStyle BackColor="#F0F0F0" ForeColor="#707070" Font-Underline="false" />
                <MonthStyle BackColor="" ForeColor="#000000" Font-Underline="false" />
            </cc1:DatePicker>
            <span class="lblden">Đến</span>
            <cc1:DatePicker ID="dpCVcutheden2" runat="server" AutoPostBack="false" CssClass="txtdiachicongty"
                Width="75px" PaneWidth="150px" Culture="vi-VN">
                <PaneTableStyle BorderColor="#707070" BorderWidth="1px" BorderStyle="Solid" />
                <PaneHeaderStyle BackColor="#0099FF" />
                <TitleStyle ForeColor="White" Font-Bold="true" />
                <NextPrevMonthStyle ForeColor="White" Font-Bold="true" />
                <NextPrevYearStyle ForeColor="#E0E0E0" Font-Bold="true" />
                <DayHeaderStyle BackColor="#E8E8E8" />
                <TodayStyle BackColor="#FFFFCC" ForeColor="#000000" Font-Underline="false" BorderColor="#FFCC99" />
                <AlternateMonthStyle BackColor="#F0F0F0" ForeColor="#707070" Font-Underline="false" />
                <MonthStyle BackColor="" ForeColor="#000000" Font-Underline="false" />
            </cc1:DatePicker>
        </li>
       
       <li></li>

        <li><span class="lblnganhnghedaotao">22- Ngành nghề được đào tạo 3(*)</span>
         <asp:DropDownList ID="cboNganhngheduocdaotao3" runat="server" CssClass="danhmucnghe" style="width: 108px; height: 21px;">
            </asp:DropDownList>
        <%--    <select class="danhmucnghe" style="width: 108px; height: 21px;" id="cboNganhngheduocdaotao3" runat="server">
                <option value="01 - Cơ khí, gia công kim loại">Cơ khí, gia công kim loại</option>
                <option value="02 - Nhựa công nghiệp, sản phẩm nhựa công nghiệp">Nhựa công nghiệp, sản phẩm nhựa công nghiệp</option>
                <option value="03 - Điện tử, sản xuất linh kiện điện tử">Điện tử, sản xuất linh kiện điện tử</option>
                <option value="04 - Sản xuất ôtô, xe máy">Sản xuất ôtô, xe máy</option>
                <option value="05 - Cơ khí đóng tàu">Cơ khí đóng tàu</option>
                <option value="06 - Mộc nội thất">Mộc nội thất</option>
                <option value="07 - Điện lạnh">Điện lạnh</option>
                <option value="08 - Dệt công nghiệp">Dệt công nghiệp</option>
                <option value="09 - May công nghiệp">May công nghiệp</option>
                <option value="10 - Nhuộm công nghiệp">Nhuộm công nghiệp</option>
                <option value="11 - Hóa chất">Hóa chất</option>
                <option value="12 - Mạ công nghiệp">Mạ công nghiệp</option>
                <option value="13 - Đúc công nghiệp ">Đúc công nghiệp </option>
                <option value="14 - Sản xuất, chế biến thực phẩm">Sản xuất, chế biến thực phẩm</option>
                <option value="15 - Nông nghiệp">Nông nghiệp</option>
                <option value="16 - Xây dựng">Xây dựng</option>
                <option value="17 - Dịch vụ nhà hàng, khách sạn">Dịch vụ nhà hàng, khách sạn</option>
                <option value="18 - Thương mại">Thương mại</option>
                <option value="19 - Dịch vụ khác">Dịch vụ khác</option>
                <option value="20 - Khác">20 - Khác</option>
            </select>--%>
             <span class="lbltuden">Từ</span>
            <cc1:DatePicker ID="dpDaotaotu3" runat="server" AutoPostBack="false" CssClass="txtdiachicongty"
                Width="70px" PaneWidth="150px" Culture="vi-VN">
                <PaneTableStyle BorderColor="#707070" BorderWidth="1px" BorderStyle="Solid" />
                <PaneHeaderStyle BackColor="#0099FF" />
                <TitleStyle ForeColor="White" Font-Bold="true" />
                <NextPrevMonthStyle ForeColor="White" Font-Bold="true" />
                <NextPrevYearStyle ForeColor="#E0E0E0" Font-Bold="true" />
                <DayHeaderStyle BackColor="#E8E8E8" />
                <TodayStyle BackColor="#FFFFCC" ForeColor="#000000" Font-Underline="false" BorderColor="#FFCC99" />
                <AlternateMonthStyle BackColor="#F0F0F0" ForeColor="#707070" Font-Underline="false" />
                <MonthStyle BackColor="" ForeColor="#000000" Font-Underline="false" />
            </cc1:DatePicker>
            <span class="lblden">Đến</span>
            <cc1:DatePicker ID="dpDaotaoden3" runat="server" AutoPostBack="false" CssClass="txtdiachicongty"
                Width="73px" PaneWidth="150px" Culture="vi-VN">
                <PaneTableStyle BorderColor="#707070" BorderWidth="1px" BorderStyle="Solid" />
                <PaneHeaderStyle BackColor="#0099FF" />
                <TitleStyle ForeColor="White" Font-Bold="true" />
                <NextPrevMonthStyle ForeColor="White" Font-Bold="true" />
                <NextPrevYearStyle ForeColor="#E0E0E0" Font-Bold="true" />
                <DayHeaderStyle BackColor="#E8E8E8" />
                <TodayStyle BackColor="#FFFFCC" ForeColor="#000000" Font-Underline="false" BorderColor="#FFCC99" />
                <AlternateMonthStyle BackColor="#F0F0F0" ForeColor="#707070" Font-Underline="false" />
                <MonthStyle BackColor="" ForeColor="#000000" Font-Underline="false" />
            </cc1:DatePicker>
        </li>        
        <li><span class="lblhodem">23- Bằng cấp 3(*)</span>
            <select class="danhmucnghe" style="width: 115px; height: 21px;" id="cboBangcap3" runat="server">
                <option value="Đại học">Đại học</option>
                <option value="Cao đẳng">Cao đẳng</option>
                <option value="Trung cấp">Trung cấp</option>
                <option value="Chứng chỉ">Chứng chỉ</option>
                <option value="Khác">Khác</option>
            </select>
            <span class="lblhuyen">Khác</span>
            <asp:TextBox CssClass="txthodem" ID="txtBangcapkhac3" Width="248px" runat="server"></asp:TextBox>
        </li>
        <li><span class="lblnganhnghe">24- Ngành nghề làm việc tại nước ngoài 3(*)</span>
           
           <asp:DropDownList ID="cboNganhnghelamviectainuocngoai3" runat="server" CssClass="danhmucnghe" style="width: 300px; height: 21px;">
            </asp:DropDownList>
       <%--     <select class="danhmucnghe" style="width: 300px; height: 21px;" id=""
                runat="server">
                <option value="01 - Cơ khí, gia công kim loại">Cơ khí, gia công kim loại</option>
                <option value="02 - Nhựa công nghiệp, sản phẩm nhựa công nghiệp">Nhựa công nghiệp, sản
                    phẩm nhựa công nghiệp</option>
                <option value="03 - Điện tử, sản xuất linh kiện điện tử">Điện tử, sản xuất linh kiện
                    điện tử</option>
                <option value="04 - Sản xuất ôtô, xe máy">Sản xuất ôtô, xe máy</option>
                <option value="05 - Cơ khí đóng tàu">Cơ khí đóng tàu</option>
                <option value="06 - Mộc nội thất">Mộc nội thất</option>
                <option value="07 - Điện lạnh">Điện lạnh</option>
                <option value="08 - Dệt công nghiệp">Dệt công nghiệp</option>
                <option value="09 - May công nghiệp">May công nghiệp</option>
                <option value="10 - Nhuộm công nghiệp">Nhuộm công nghiệp</option>
                <option value="11 - Hóa chất">Hóa chất</option>
                <option value="12 - Mạ công nghiệp">Mạ công nghiệp</option>
                <option value="13 - Đúc công nghiệp ">Đúc công nghiệp </option>
                <option value="14 - Sản xuất, chế biến thực phẩm">Sản xuất, chế biến thực phẩm</option>
                <option value="15 - Nông nghiệp">Nông nghiệp</option>
                <option value="16 - Xây dựng">Xây dựng</option>
                <option value="17 - Dịch vụ nhà hàng, khách sạn">Dịch vụ nhà hàng, khách sạn</option>
                <option value="18 - Thương mại">Thương mại</option>
                <option value="19 - Dịch vụ khác">Dịch vụ khác</option>
                <option value="20 - Khác">Khác</option>
            </select>     --%>       
        </li>
        <li>
            <span class="lblcongvieccuthe">25- Công việc cụ thể được giao 3(*)</span>
            <asp:TextBox CssClass="txthodem" ID="txtCongvieccuthe3" Width="92px" runat="server"></asp:TextBox>
            <span class="lbltuden">Từ</span>
            <cc1:DatePicker ID="dpCVcuthetu3" runat="server" AutoPostBack="false" CssClass="txtdiachicongty"
                Width="70px" PaneWidth="150px" Culture="vi-VN">
                <PaneTableStyle BorderColor="#707070" BorderWidth="1px" BorderStyle="Solid" />
                <PaneHeaderStyle BackColor="#0099FF" />
                <TitleStyle ForeColor="White" Font-Bold="true" />
                <NextPrevMonthStyle ForeColor="White" Font-Bold="true" />
                <NextPrevYearStyle ForeColor="#E0E0E0" Font-Bold="true" />
                <DayHeaderStyle BackColor="#E8E8E8" />
                <TodayStyle BackColor="#FFFFCC" ForeColor="#000000" Font-Underline="false" BorderColor="#FFCC99" />
                <AlternateMonthStyle BackColor="#F0F0F0" ForeColor="#707070" Font-Underline="false" />
                <MonthStyle BackColor="" ForeColor="#000000" Font-Underline="false" />
            </cc1:DatePicker>
            <span class="lblden">Đến</span>
            <cc1:DatePicker ID="dpCVcutheden3" runat="server" AutoPostBack="false" CssClass="txtdiachicongty"
                Width="75px" PaneWidth="150px" Culture="vi-VN">
                <PaneTableStyle BorderColor="#707070" BorderWidth="1px" BorderStyle="Solid" />
                <PaneHeaderStyle BackColor="#0099FF" />
                <TitleStyle ForeColor="White" Font-Bold="true" />
                <NextPrevMonthStyle ForeColor="White" Font-Bold="true" />
                <NextPrevYearStyle ForeColor="#E0E0E0" Font-Bold="true" />
                <DayHeaderStyle BackColor="#E8E8E8" />
                <TodayStyle BackColor="#FFFFCC" ForeColor="#000000" Font-Underline="false" BorderColor="#FFCC99" />
                <AlternateMonthStyle BackColor="#F0F0F0" ForeColor="#707070" Font-Underline="false" />
                <MonthStyle BackColor="" ForeColor="#000000" Font-Underline="false" />
            </cc1:DatePicker>
        </li>
       







        <li><span class="thongtindn">III. YÊU CẦU TÌM VIỆC </span></li>
        <li><span class="lblcongvieccuthe">26- Ngành nghề dự kiến tìm việc (*)</span>
         <asp:DropDownList ID="cboNganhnghedukientimviec" runat="server" CssClass="danhmucnghe" style="width: 343px; height: 21px;">
            </asp:DropDownList>
           <%-- <select class="danhmucnghe" style="width: 343px; height: 21px;" id=""
                runat="server">
                <option value="01 - Cơ khí, gia công kim loại">Cơ khí, gia công kim loại</option>
                <option value="02 - Nhựa công nghiệp, sản phẩm nhựa công nghiệp">Nhựa công nghiệp, sản phẩm nhựa công nghiệp</option>
                <option value="03 - Điện tử, sản xuất linh kiện điện tử">Điện tử, sản xuất linh kiện điện tử</option>
                <option value="04 - Sản xuất ôtô, xe máy">Sản xuất ôtô, xe máy</option>
                <option value="05 - Cơ khí đóng tàu">Cơ khí đóng tàu</option>
                <option value="06 - Mộc nội thất">Mộc nội thất</option>
                <option value="07 - Điện lạnh">Điện lạnh</option>
                <option value="08 - Dệt công nghiệp">Dệt công nghiệp</option>
                <option value="09 - May công nghiệp">May công nghiệp</option>
                <option value="10 - Nhuộm công nghiệp">Nhuộm công nghiệp</option>
                <option value="11 - Hóa chất">Hóa chất</option>
                <option value="12 - Mạ công nghiệp">Mạ công nghiệp</option>
                <option value="13 - Đúc công nghiệp ">Đúc công nghiệp </option>
                <option value="14 - Sản xuất, chế biến thực phẩm">Sản xuất, chế biến thực phẩm</option>
                <option value="15 - Nông nghiệp">Nông nghiệp</option>
                <option value="16 - Xây dựng">Xây dựng</option>
                <option value="17 - Dịch vụ nhà hàng, khách sạn">Dịch vụ nhà hàng, khách sạn</option>
                <option value="18 - Thương mại">Thương mại</option>
                <option value="19 - Dịch vụ khác">Dịch vụ khác</option>
                <option value="20 - Khác">Khác</option>
            </select>--%>
        </li>
        <li><span class="lblcongvieccuthe">27- Vị trí việc làm mong muốn (*)</span>

          <asp:DropDownList ID="cbovitri" runat="server" class="danhmucnghe" style="width: 184px">
             </asp:DropDownList>       


           <%-- <select id="" runat="server" class="danhmucnghe" style="width: 184px">
                <option value="VL01 - Phiên dịch">Phiên dịch</option>
                <option value="VL02 - Quản lý sản xuất">Quản lý sản xuất</option>
                <option value="VL03 - Kỹ sư">Kỹ sư</option>
                <option value="VL04 - Cử nhân">Cử nhân</option>
                <option value="VL05 - Thợ hàn">Thợ hàn</option>
                <option value="VL06 - Thợ cơ khí, gia công kim loại">Thợ cơ khí, gia công kim loại</option>
                <option value="VL07 - Công nhân đóng tàu">Công nhân đóng tàu</option>
                <option value="VL08 - Công nhân điện tử">Công nhân điện tử</option>
                <option value="VL09 - Công nhân nhựa công nghiệp">Công nhân nhựa công nghiệp</option>
                <option value="VL10 - Nhân viên văn phòng">Nhân viên văn phòng</option>
                <option value="VL11 - Kế toán viên">Kế toán viên</option>
                <option value="VL12 - Kế toán trưởng">Kế toán trưởng</option>
                <option value="VL13 - Nhân viên kinh doanh">Nhân viên kinh doanh</option>
                <option value="VL14 - Công nhân">Công nhân</option>
                <option value="VL15 - Khác">Khác</option>
            </select>--%>
        </li>
        <li><span class="lblcongvieccuthe">28- Mức lương mong muốn (*)</span>
            <select id="choMucluongmongmuon" runat="server" class="danhmucnghe" style="width: 184px">
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
        <li><span class="lblcongvieccuthe">29- Địa điểm làm việc mong muốn</span>
            <select class="danhmucnghe" style="width: 184px; height: 21px;" id="cboDiadiemlamviecmongmuon"
                runat="server">
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

    </ul>
</div>