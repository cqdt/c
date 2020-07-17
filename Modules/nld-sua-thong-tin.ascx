<%@ Control Language="C#" AutoEventWireup="true" CodeFile="nld-sua-thong-tin.ascx.cs" Inherits="Modules_nld_sua_thong_tin" %>
<%@ Register Assembly="SlimeeLibrary" Namespace="SlimeeLibrary" TagPrefix="cc1" %>


<div class="bg_title_cate">
<div class="title_cate">
    <div class="title_cate_ico"></div>
    <a class="a_title_cate">TRA CỨU, SỬA THÔNG TIN ĐĂNG KÝ</a>
</div>    
<div class="title_cate_right"></div>
</div>


<div class="img_24">
    <ul class="dangkytdld">
      <li> <center>
          <span class="thongtindn"> TRA CỨU, SỬA THÔNG TIN ĐĂNG KÝ
         </span></center>
      </li>
      <li>
            <span class="tracuunld">1- TRA CỨU THÔNG TIN</span>
             <asp:TextBox ID="txtMaTV" Width="260" Height="30" runat="server" onfocus="if(this.value=='NHẬP MÃ TÌM VIỆC') this.value='';"
                    onblur="if(this.value=='') this.value='NHẬP MÃ TÌM VIỆC';" value="NHẬP MÃ TÌM VIỆC"></asp:TextBox>
             <asp:Button ID="btndangnhap" CssClass="btngo" runat="server" Text=" GO " Height="36" Width="114"
                onclick="btndangnhap_Click" />
        </li>
        <li>
            <span class="tracuunld">
                2- LẤY LẠI MÃ TÌM VIỆC
            </span>
            <asp:TextBox ID="txthochieu" Width="130" Height="30" runat="server" onfocus="if(this.value=='CMND/Hộ chiếu') this.value='';"
                    onblur="if(this.value=='') this.value='CMND/Hộ chiếu';" value="CMND/Hộ chiếu"></asp:TextBox>
            <asp:TextBox ID="txtteldadk" Width="124" Height="30" runat="server" onfocus="if(this.value=='Điện thoại') this.value='';"
                    onblur="if(this.value=='') this.value='Điện thoại';" value="Điện thoại"></asp:TextBox>
             <asp:Button ID="btnTimkiem" CssClass="btngo" runat="server" Text=" TÌM KIẾM " 
                onclick="btnTimkiem_Click" Height="36" Width="114"/>
        </li>

        </ul>
          <ul class="nld_dangkytdld" id="thongtinnld" runat="server">
 <li><span class="thongtindn">I. THÔNG TIN CHUNG</span> </li>
        <li><span class="lblhodem">1- Họ và đệm (*)</span>
            <asp:TextBox CssClass="txthodem" ID="txthodem" Width="150px" runat="server"></asp:TextBox>
            <span class="lblten_NLD">2- Tên (*)</span>
            <asp:TextBox CssClass="txthodem" ID="txtten" Width="133px" Height="30" runat="server"></asp:TextBox>
        </li>
        <li><span class="lblhodem">3- Ngày sinh (*)</span>
           <cc1:datepicker id="dpngaysinh" runat="server" autopostback="false" 
                cssclass="txtdiachicongty" onkeypress="return isNumberKey(event)"
                width="150px" height="30" panewidth="150px" culture="vi-VN">
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
            <span class="cbogioitinh_NLD">4- Giới tính (*)</span>          
           <select class="danhmucnghe" style="width: 138px; height: 36px;" id="cboGioitinh"
                runat="server">
                <option value="Nam">Nam</option>
                <option value="Nữ">Nữ</option>
            </select>
        </li>
        <li><span class="lblCMND_NLD">5- Số CMND<br />
            &nbsp;&nbsp;&nbsp;/Hộ chiếu <b>(*)</b></span>
            <asp:TextBox CssClass="txthodem" ID="txtCMND" Width="414px" Height="30" onkeypress="return isNumberKey(event)" runat="server"></asp:TextBox>
        </li>
        <li><span class="lblCMND_NLD">6- Địa chỉ<br />
            &nbsp;&nbsp;&nbsp; cư trú <b>(*)</b></span>

             <asp:TextBox CssClass="txthodem" ID="txtDiachi" Width="150px" Height="30" runat="server"></asp:TextBox>


            <span class="lblhuyen">Huyện</span>
            <asp:TextBox CssClass="txthodem" ID="txtHuyen" Width="71px" runat="server" Height="30"></asp:TextBox>
            <span class="lblhuyen">Tỉnh</span>
            <select class="danhmucnghe" style="width: 83px; height: 36px;" id="cboTinh" runat="server">
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
        <li><span class="lblCMND_NLD">7- Tên chương trình<br />
            &nbsp;&nbsp;&nbsp; đã tham gia <b>(*)</b></span>
           <select class="danhmucnghe" style="width: 156px; height: 36px;" id="cboChuongtrinhthamgia"
                runat="server">
                <option value="">--- --- ---</option>
                <option value="EPS">EPS</option>
                <option value="IM Japan">IM Japan</option>
            </select>
              <span class="lblsoid">Số ID tại nước
                <br />
                ngoài<b> (*)</b></span>
             <asp:TextBox CssClass="txthodem" ID="txtIDnuocngoai" Width="134px" Height="30" runat="server"></asp:TextBox>
        </li>
        <li><span class="lblhodem">8- Ngày xuất cảnh (*)</span>
            <cc1:datepicker id="dpNgayxuatcanh" runat="server" autopostback="false" cssclass="txtdiachicongty" onkeypress="return isNumberKey(event)" 
                width="150px" height="30" panewidth="150px" culture="vi-VN">
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
                width="114px" height="30" panewidth="150px" culture="vi-VN">
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
            <asp:TextBox CssClass="txthodem" ID="txtDienthoai" Width="150px" Height="30" runat="server" onkeypress="return isNumberKey(event)"></asp:TextBox>
            <span class="lblsoid">11- Địa chỉ<br />
                &nbsp;&nbsp;&nbsp; email <b>(*)</b></span>
            <asp:TextBox CssClass="txthodem" ID="txtEmail" Width="136px" runat="server" Height="30"></asp:TextBox>
        </li>
        <li></li>
         <li>
            
             <asp:Button ID="btnFinish" CssClass="btnhoantat" runat="server" Text=" HOÀN TẤT " OnClientClick="return CheckSubmit()" 
                 onclick="btnFinish_Click" />
                 
             <asp:Button ID="btnEditinfo" CssClass="btndangky" runat="server" Text=" SỬA THÔNG TIN ĐĂNG KÝ " OnClientClick="EditInfo(); return false;"
                 />
        </li>


    </ul>
</div>

<script type="text/javascript" language="javascript">


    function EditInfo() {
        document.getElementById("<%=txthodem.ClientID %>").disabled = false;
        document.getElementById("<%=txtten.ClientID %>").disabled = false;
        document.getElementById("<%=dpngaysinh.ClientID %>").disabled = false;
        document.getElementById("<%=cboGioitinh.ClientID %>").disabled = false;

        document.getElementById("<%=txtCMND.ClientID %>").disabled = false;
        document.getElementById("<%=txtDiachi.ClientID %>").disabled = false;
        document.getElementById("<%=txtHuyen.ClientID %>").disabled = false;
        document.getElementById("<%=cboTinh.ClientID %>").disabled = false;

        document.getElementById("<%=cboChuongtrinhthamgia.ClientID %>").disabled = false;
        document.getElementById("<%=txtIDnuocngoai.ClientID %>").disabled = false;
        document.getElementById("<%=dpNgayxuatcanh.ClientID %>").disabled = false;
        document.getElementById("<%=dpNgayvenuoc.ClientID %>").disabled = false;

        document.getElementById("<%=txtDienthoai.ClientID %>").disabled = false;
        document.getElementById("<%=txtEmail.ClientID %>").disabled = false;
        document.getElementById("<%=btnFinish.ClientID %>").disabled = false;
        document.getElementById("<%=btnEditinfo.ClientID %>").disabled = true;

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
        else if (dpngaysinh == "") {
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
        else {
            return true;
        }
    }



</script>