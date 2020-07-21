<%@ Control Language="C#" AutoEventWireup="true" CodeFile="khai-bao-thong-tin-nguoi-lao-dong-tai-han-quoc.ascx.cs" Inherits="Modules_khai_bao_thong_tin_nguoi_lao_dong_tai_han_quoc" %>
<div class="bg_title_cate">
    <div class="title_cate">
        <div class="title_cate_ico">
        </div>
        <a class="a_title_cate">Đăng ký khai báo thông tin của người lao động làm việc tại Hàn Quốc</a>
    </div>
    <div class="title_cate_right">
    </div>
</div>
<div class="img_24 dangkyhq">
        <p class="a_taisao">Tại sao phải khai báo?</p>
        <p class="successful taisao">
            <a href="<%= Newwind.VQS.URL %>/tin-tuc/812/tai-sao-phai-khai-bao.aspx" >XEM HƯỚNG DẪN</a> 
        </p>
    

    
        <p class="a_kiemtra">Nếu đã khai báo, bạn có thể kiểm tra thông tin tại đây</p>
        <p class="check">
            <a href="<%= Newwind.VQS.URL %>/tra-cuu-thong-tin-nguoi-lao-dong-tai-han-quoc.aspx" >KIỂM TRA</a> 
        </p>
    
    <p class="a_kiemtra">Nếu chưa khai báo, bạn có thể khai báo tại
            đây</p>
    <style>
        .w100{
            width:50%;
        }
        .dangkytienghan{
            float:left !important;
            width:auto !important;
        }
        .dangkytienghan li{
            width:650px !important;
        }
    </style>
    
    <ul class="dangkytienghan">
        
        <li class="nentrang"><span class="hokhau">Mục đích khai báo (*)</span>
            <select runat="server" id="cbomucdich" class="ngoaingu cbohoihuong w100" onchange="return CheckMucdich()">
                <option value=""></option>
                <option value="Khai báo lần đầu">Khai báo lần đầu</option>
                <option value="Khai báo thay đổi nơi làm việc">Khai báo thay đổi nơi làm việc</option>
                <option value="Khai báo thay đổi số điện thoại">Khai báo thay đổi số điện thoại</option>
                <option value="Khai báo lần cuối để hồi hương">Khai báo lần cuối để hồi hương</option>
                <option value="Khai báo thay đổi tư cách lưu trú">Khai báo thay đổi tư cách lưu trú</option>
            </select>
        </li>
        <li class="kiemtrathongtin khaibaolandau xam">I. KHAI BÁO THÔNG TIN SAU KHI NHẬP CẢNH HÀN QUỐC</li>
        <li class="nentrang"><span class="hokhau">Họ tên (*)</span><asp:TextBox ID="txthotenkhaibaolandau" 
            CssClass="txthoten uppercase w100"  runat="server" onblur="getInfo();"></asp:TextBox>
        </li>
        <li class="xam"><span class="hokhau">Số hộ chiếu (*)</span><asp:TextBox ID="txthochieukhaibaolandau"
            CssClass="txthoten  w100" runat="server" onblur="getInfo();"></asp:TextBox>
        </li>
        <li class="nentrang"><span class="hokhau">Ngày nhập cảnh lần đầu (*)</span>
            <asp:TextBox ID="txtngaynhapcanhlandau" onkeydown="return jsDecimals(event);" onkeyup="NgaynhapcanhForcus();"
                MaxLength="2" CssClass="txtngaythangnam" Width="25" runat="server" onfocus="if(this.value=='dd') this.value='';"
                onblur="if(this.value=='') this.value='dd';" value="dd"></asp:TextBox>
            <span style="float: left; margin: 10px 5px 0 5px">/</span>
            <asp:TextBox ID="txtthangnhapcanhlandau" onkeydown="return jsDecimals(event);" onkeyup="ThangnhapcanhForcus();"
                MaxLength="2" CssClass="txtngaythangnam" Width="25" runat="server" onfocus="if(this.value=='MM') this.value='';"
                onblur="if(this.value=='') this.value='MM';" value="MM"></asp:TextBox>
            <span style="float: left; margin: 10px 5px 0 5px">/</span>
            <asp:TextBox ID="txtnamnhapcanhlandau" onkeydown="return jsDecimals(event);" onkeyup="NamnhapcanhForcus();"
                MaxLength="4" CssClass="txtngaythangnam" Width="40" runat="server" onfocus="if(this.value=='yyyy') this.value='';"
                onblur="if(this.value=='') this.value='yyyy';" value="yyyy"></asp:TextBox>
        </li>
        <li class="xam hidden"><span class="hokhau">Số CMND Việt Nam (*)</span><asp:TextBox ID="txtCMNDVN" onkeydown="return jsDecimals(event);"
            MaxLength="12" CssClass="txthoten w100" runat="server"></asp:TextBox></li>
        <li  class="nentrang hidden"><span class="hokhau">Địa chỉ Email cá nhân</span><asp:TextBox ID="txtemail" CssClass="txthoten"
            Width="150" runat="server"></asp:TextBox>
        </li>
        <li class="xam"><span class="hokhau">Tên công ty nơi làm việc (*)</span><asp:TextBox ID="txtdoanhnghiep"
            CssClass="txthoten w100" runat="server"></asp:TextBox></li>
        <li  class="nentrang hidden"><span class="hokhau">Tên người sử dụng lao động (*)</span><asp:TextBox ID="txtnguoisudunglaodong"
            CssClass="txthoten w100" runat="server"></asp:TextBox></li>
        <li class="nentrang"><span class="hokhau">Số điện thoại của công ty (*)</span>
            <asp:TextBox ID="txtdienthoaidoanhnghiep1" CssClass="txthoten w100" runat="server" ></asp:TextBox>
            <asp:TextBox ID="txtdienthoaidoanhnghiep"
            onkeyup="dienthoaidoanhnghiep1Forcus();" onkeydown="return jsDecimals(event);"
            MaxLength="3" CssClass="txthoten sothecenter hidden" Width="50" runat="server" onfocus="if(this.value=='000') this.value='';"
            onblur="if(this.value=='') this.value='000';" value="000"></asp:TextBox>
        </li>
        <li class="nentrang hidden"><span class="hokhau">Số điện thoại của công ty 2</span>
            <asp:TextBox ID="txtdienthoaidoanhnghiep2" CssClass="txthoten w100" runat="server" ></asp:TextBox>
        </li>
        <li class="nentrang hidden"><span class="hokhau">Số điện thoại của công ty 3</span>
            <asp:TextBox ID="txtdienthoaidoanhnghiep3" CssClass="txthoten w100" runat="server" ></asp:TextBox>
        </li>

        <li  class="xam hidden"><span class="hokhau">Địa chỉ nơi làm việc (*)</span>
            <asp:TextBox ID="txtdiachilamviec1"
             CssClass="txtcongviec w100" runat="server"></asp:TextBox></li>

        <li  class="xam"><span class="hokhau">Tỉnh/Thành phố:</span>
            <select runat="server" id="cboCap1" class="ngoaingu cbohoihuong w100 cbodiadiem" onchange="return changeDiaDiem(1)">
            </select>
        </li>
        <li  class="xam"><span class="hokhau">Quận/huyện:</span>
            <select runat="server" id="cboCap2" class="ngoaingu cbohoihuong w100 cbodiadiem" onchange="return changeDiaDiem(2)">
            </select>
        </li>
        <li  class="xam"><span class="hokhau">Phường/Xã/Thị trấn:</span>
            <select runat="server" id="cboCap3" class="ngoaingu cbohoihuong w100 cbodiadiem" onchange="return changeDiaDiem(3)">
            </select>
        </li>
        <li  class="xam"><span class="hokhau">Phố/Thôn/Xóm:</span>
            <asp:TextBox ID="txtdiachilamviec" CssClass="txtcongviec w100" runat="server"></asp:TextBox>
            <select runat="server" id="cboCap4" class="ngoaingu cbohoihuong w100 cbodiadiem hidden" onchange="return changeDiaDiem(4)">
            </select>
        </li>

        <li class="xam hidden"><span class="hokhau">Ngày bắt đầu làm việc tại công ty (*)</span>
            <asp:TextBox ID="txtngaybatdaulamviec" CssClass="txtngaythangnam  w100 datepicker" runat="server"></asp:TextBox>
            
            <asp:TextBox ID="txtthangbatdaulamviec" CssClass="txtngaythangnam hidden" onkeyup="thangbatdaulamviecForcus();"
                onkeydown="return jsDecimals(event);" MaxLength="2" Width="25" runat="server"
                onfocus="if(this.value=='MM') this.value='';" onblur="if(this.value=='') this.value='MM';"
                value="MM"></asp:TextBox>
            
            <asp:TextBox ID="txtnambatdaulamviec" CssClass="txtngaythangnam hidden" onkeyup="nambatdaulamviecForcus();"
                onkeydown="return jsDecimals(event);" MaxLength="4" Width="40" runat="server"
                onfocus="if(this.value=='yyyy') this.value='';" onblur="if(this.value=='') this.value='yyyy';"
                value="yyyy"></asp:TextBox>
        </li>
        <li  class="nentrang"><span class="hokhau">Số thẻ người nước ngoài (*)</span>
            <asp:TextBox ID="txtsothekhaibaolandau1"
            onkeyup="sothekhaibaolandau1Forcus();" onkeydown="return jsDecimals(event);"
            MaxLength="6" CssClass="txthoten sothecenter" Width="65" runat="server" onfocus="if(this.value=='000000') this.value='';"
            onblur="if(this.value=='') this.value='000000';" value="000000"></asp:TextBox><span
                style="float: left; margin: 7px 0 0 0">-</span>
            <asp:TextBox ID="txtsothekhaibaolandau2" CssClass="txthoten sothecenter" Width="65"
                runat="server" onkeyup="sothekhaibaolandau2Forcus();" onkeydown="return jsDecimals(event);"
                MaxLength="7" onfocus="if(this.value=='0000000') this.value='';" onblur="if(this.value=='') this.value='0000000';"
                value="0000000"></asp:TextBox>
        </li>
        <li class="xam"><span class="hokhau">Số điện thoại của người lao động (*)</span>
            <asp:TextBox
            ID="txtdienthoainguoilaodong1" CssClass="txthoten  w100" runat="server" onkeyup="dienthoainguoilaodong11Forcus();" onkeydown="return jsDecimals(event);" MaxLength="11"></asp:TextBox>
            <asp:TextBox
            ID="txtdienthoainguoilaodong" onkeyup="dienthoainguoilaodong1Forcus();" onkeydown="return jsDecimals(event);"
            MaxLength="3" CssClass="txthoten sothecenter hidden" Width="50" runat="server" onfocus="if(this.value=='000') this.value='';"
            onblur="if(this.value=='') this.value='000';" value="000"></asp:TextBox>
            
            <asp:TextBox ID="txtdienthoainguoilaodong3" CssClass="txthoten hidden" Width="50"
                runat="server" onkeyup="dienthoainguoilaodong3Forcus();" onkeydown="return jsDecimals(event);"
                MaxLength="4" onfocus="if(this.value=='0000') this.value='';" onblur="if(this.value=='') this.value='0000';"
                value="0000"></asp:TextBox>
        </li>
        <li class="nentrang hidden"><span class="hokhau">Số điện thoại của người lao động 2</span>
            <asp:TextBox ID="txtdienthoainguoilaodong2" CssClass="txthoten w100" runat="server"></asp:TextBox>
        </li>

        <li class="kiemtrathongtin khaibaolandau nentrang">II. BỔ SUNG THÔNG TIN(khi có thay đổi về Hộ chiếu, nới làm việc, số điện thoại ...)</li>
        <li class="xam hidden"><span class="hokhau">Đổi hộ chiếu</span><asp:TextBox ID="txtDoihochieu"
            CssClass="txthoten  w100" runat="server"></asp:TextBox></li>
        <li class="xam"><span class="hokhau">Đổi tư cách lưu trú (tên loại visa lưu trú mới)</span><asp:TextBox ID="txtDoiTuCachLuuTru"
            CssClass="txthoten w100" runat="server"></asp:TextBox></li>
        <li class="nentrang"><span class="hokhau">Đổi Số điện thoại</span><asp:TextBox
            ID="txtDoisodienthoai" CssClass="txthoten  w100" runat="server"  onkeydown="return jsDecimals(event);" MaxLength="11"></asp:TextBox>
        </li>
        <li class="xam"><span class="hokhau">Đổi tên công ty làm việc</span><asp:TextBox ID="txtDoicongty"
            CssClass="txthoten w100" runat="server"></asp:TextBox></li>
        <li class="nentrang"><span class="hokhau">Đổi số điện thoại công ty</span>
            <asp:TextBox ID="txtDoisodienthoaicongty" CssClass="txthoten  w100" runat="server"></asp:TextBox>
        </li>
        <li  class="xam hidden"><span class="hokhau">Đổi địa chỉ làm việc</span><asp:TextBox ID="txtDoidiadiem1"
             CssClass="txtcongviec w100" runat="server"></asp:TextBox></li>

        <li  class="xam"><span class="hokhau">Tỉnh/Thành phố:</span>
            <select runat="server" id="cboCap11" class="ngoaingu cbohoihuong w100 cbodiadiem" onchange="return changeDiaDiem1(1)">
            </select>
        </li>
        <li  class="xam"><span class="hokhau">Quận/huyện:</span>
            <select runat="server" id="cboCap12" class="ngoaingu cbohoihuong w100 cbodiadiem" onchange="return changeDiaDiem1(2)">
            </select>
        </li>
        <li  class="xam"><span class="hokhau">Phường/Xã/Thị trấn:</span>
            <select runat="server" id="cboCap13" class="ngoaingu cbohoihuong w100 cbodiadiem" onchange="return changeDiaDiem1(3)">
            </select>
        </li>
        <li  class="xam"><span class="hokhau">Phố/Thôn/Xóm:</span>
            <asp:TextBox ID="txtDoidiadiem" CssClass="txtcongviec w100" runat="server"></asp:TextBox>
            <select runat="server" id="cboCap14" class="ngoaingu cbohoihuong w100 cbodiadiem hidden" onchange="return changeDiaDiem1(4)">
            </select>
        </li>
        

        <li class="kiemtrathongtin khaibaolandau nentrang">III. KHAI BÁO THÔNG TIN HỒI HƯƠNG(về nước hẳn)</li>
        <li class="xam hidden"><span class="hokhau">Họ tên (*)</span><asp:TextBox ID="txthotenhoihuong" CssClass="txthoten uppercase w100" runat="server"></asp:TextBox></li>
        <li  class="nentrang hidden"><span class="hokhau">Số hộ chiếu (*)</span><asp:TextBox ID="txthochieuhoihuong"
            CssClass="txthoten w100" runat="server"></asp:TextBox></li>
        <li class="xam"><span class="hokhau">Thời hạn hợp đồng LĐ cuối cùng (*)</span> 
            <asp:TextBox ID="txtdenngay" CssClass="txtngaythangnam" onkeyup="txtdenngayForcus();"
                onkeydown="return jsDecimals(event);" MaxLength="2" Width="25" runat="server"
                onfocus="if(this.value=='dd') this.value='';" onblur="if(this.value=='') this.value='dd';"
                value="dd"></asp:TextBox>
            <span style="float: left; margin: 10px 5px 0 5px">/</span>
            <asp:TextBox ID="txtdenthang" CssClass="txtngaythangnam" onkeyup="txtdenthangForcus();"
                onkeydown="return jsDecimals(event);" MaxLength="2" Width="25" runat="server"
                onfocus="if(this.value=='MM') this.value='';" onblur="if(this.value=='') this.value='MM';"
                value="MM"></asp:TextBox>
            <span style="float: left; margin: 10px 5px 0 5px">/</span>
            <asp:TextBox ID="txtdennam" CssClass="txtngaythangnam" onkeyup="txtdennamForcus();"
                onkeydown="return jsDecimals(event);" MaxLength="4" Width="40" runat="server"
                onfocus="if(this.value=='yyyy') this.value='';" onblur="if(this.value=='') this.value='yyyy';"
                value="yyyy"></asp:TextBox>
        </li>
        <li  class="nentrang"><span class="hokhau">Lý do về nước:</span>
            <select runat="server" id="cbolydo" class="ngoaingu cbohoihuong w100">
                <option value=""></option>
                <option value="Về nước trước hạn vì lý do cá nhân">Về nước trước hạn vì lý do cá nhân</option>
                <option value="Về nước trước hạn vì không tìm được việc làm">Về nước trước hạn vì không tìm được việc làm</option>
                <option value="Về nước khi hết thời hạn hợp đồng">Về nước khi hết thời hạn hợp đồng</option>
                <option value="Cư trú bất hợp pháp tự nguyện về nước">Cư trú bất hợp pháp tự nguyện về nước</option>
                <option value="Lý do khác">Lý do khác</option>
            </select>
        </li>
        <li class="xam"><span class="hokhau">Ngày hết hạn lưu trú (*)<br />
            <i>(xem trên Thẻ người nước ngoài)</i></span>
            <asp:TextBox ID="txtngayhethan" CssClass="txtngaythangnam" onkeyup="txtngayhethanForcus();"
                onkeydown="return jsDecimals(event);" MaxLength="2" Width="25" runat="server"
                onfocus="if(this.value=='dd') this.value='';" onblur="if(this.value=='') this.value='dd';"
                value="dd"></asp:TextBox>
            <span style="float: left; margin: 10px 5px 0 5px">/</span>
            <asp:TextBox ID="txtthanghethan" CssClass="txtngaythangnam" onkeyup="txtthanghethanForcus();"
                onkeydown="return jsDecimals(event);" MaxLength="2" Width="25" runat="server"
                onfocus="if(this.value=='MM') this.value='';" onblur="if(this.value=='') this.value='MM';"
                value="MM"></asp:TextBox>
            <span style="float: left; margin: 10px 5px 0 5px">/</span>
            <asp:TextBox ID="txtnamhethan" CssClass="txtngaythangnam" onkeyup="txtnamhethanForcus();"
                onkeydown="return jsDecimals(event);" MaxLength="4" Width="40" runat="server"
                onfocus="if(this.value=='yyyy') this.value='';" onblur="if(this.value=='') this.value='yyyy';"
                value="yyyy"></asp:TextBox>
        </li>
        <li  class="nentrang"><span class="hokhau">Ngày đăng ký về nước (ngày xuất cảnh) (*)</span>
            <asp:TextBox ID="txtngayvenuoc" CssClass="txtngaythangnam" onkeyup="txtngayvenuocForcus();"
                onkeydown="return jsDecimals(event);" MaxLength="2" Width="25" runat="server"
                onfocus="if(this.value=='dd') this.value='';" onblur="if(this.value=='') this.value='dd';"
                value="dd"></asp:TextBox>
            <span style="float: left; margin: 10px 5px 0 5px">/</span>
            <asp:TextBox ID="txtthangvenuoc" CssClass="txtngaythangnam" onkeyup="txtthangvenuocForcus();"
                onkeydown="return jsDecimals(event);" MaxLength="2" Width="25" runat="server"
                onfocus="if(this.value=='MM') this.value='';" onblur="if(this.value=='') this.value='MM';"
                value="MM"></asp:TextBox>
            <span style="float: left; margin: 10px 5px 0 5px">/</span>
            <asp:TextBox ID="txtnamvenuoc" CssClass="txtngaythangnam" onkeyup="txtnamvenuocForcus();"
                onkeydown="return jsDecimals(event);" MaxLength="4" Width="40" runat="server"
                onfocus="if(this.value=='yyyy') this.value='';" onblur="if(this.value=='') this.value='yyyy';"
                value="yyyy"></asp:TextBox>
        </li>
        <%-- Recaptcha add html --%>
        <li class="nentrang"><div id="html_element"></div></li>
        <%-- end Recaptcha add html --%>
        <li class="">
            <asp:Button ID="btnRegister" runat="server" Text="ĐĂNG KÝ" OnClientClick="return CheckSubmit()"
                OnClick="btnRegister_Click" CssClass="btngui im" />
            <%--<asp:Button ID="btnExportWord" runat="server" Text="Xuất Word" OnClick="btnExportWord_Click" CssClass="btngui im" />--%>
        </li>
    </ul>
    <div id="progressbar"></div>
</div>
<%-- Recaptcha V2 --%>
<style>
    #html_element{
        margin-left:220px;
    }
</style>
<script type="text/javascript">
    var verifyCallback = function (response) {
        //console.log(response);
        $("#<%=btnRegister.ClientID %>").removeAttr("disabled");

      };
    var onloadCallback = function () {
          $("#<%=btnRegister.ClientID %>").attr("disabled", 'disabled');
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


<script type="text/javascript">
    $(document).ready(function () {
        $("#<%=txthotenkhaibaolandau.ClientID %>").onblu
        $.ajax({
          url: "/get.aspx",
        }).done(function (data) {

            console.log($(data).find("#result").text());
        });
        loaddiadiem(1, 0, 0);
        loaddiadiem1(1, 0, 0);
    })
    function loaddiadiem(cap,cha,chon) {
        var obj = $("#<%=cboCap1.ClientID %>");
        if (cap == 2)
            obj = $("#<%=cboCap2.ClientID %>");
        if (cap == 3)
            obj = $("#<%=cboCap3.ClientID %>");
        <%--if (cap == 4)
            obj = $("#<%=cboCap4.ClientID %>");--%>
        obj.empty();
        obj.append("<option value='' ></option>")
        $.ajax({
          url: "http://new.colab.gov.vn/get.aspx?cap="+cap+"&cha="+cha,
        }).done(function (data) {
            var ds = $(data).find("#result").text().trim().split(';');
            for (var i = 0; i < ds.length; i++) {
                if (ds[i].indexOf(':')>= 0) {
                    var opt = ds[i].split(':');
                    if (opt.length > 0) {
                        var sl = chon == opt[0] ? " selected=true" : "";
                        obj.append("<option value='" + opt[0] + "' "+sl+">" + opt[1] + "</option>")
                    }
                }
            }
        });
    }
    function loaddiadiem1(cap,cha,chon) {
        var obj = $("#<%=cboCap11.ClientID %>");
        if (cap == 2)
            obj = $("#<%=cboCap12.ClientID %>");
        if (cap == 3)
            obj = $("#<%=cboCap13.ClientID %>");
        <%--if (cap == 4)
            obj = $("#<%=cboCap14.ClientID %>");--%>
        obj.empty();
        obj.append("<option value='' ></option>")
        $.ajax({
          url: "http://new.colab.gov.vn/get.aspx?cap="+cap+"&cha="+cha,
        }).done(function (data) {
            var ds = $(data).find("#result").text().trim().split(';');
            for (var i = 0; i < ds.length; i++) {
                if (ds[i].indexOf(':')>= 0) {
                    var opt = ds[i].split(':');
                    if (opt.length > 0) {
                        var sl = chon == opt[0] ? " selected=true" : "";
                        obj.append("<option value='" + opt[0] + "' "+sl+">" + opt[1] + "</option>")
                    }
                }
            }
        });
    }
    function loadAllDiaDiem(diadiems) {
        console.log(diadiems,"__")
        if (diadiems.indexOf('|') > 0) {
            var dd = diadiems.split('|');
            $.ajax({
                url: "http://new.colab.gov.vn/get.aspx?diadiem=" + dd[0],
            }).done(function (data) {
                console.log($(data).find("#result").text().trim());
                var ds = $(data).find("#result").text().trim().split(';');
                if (ds.length > 0) {
                    for (var i = 0; i < ds.length; i++) {
                        loaddiadiem(i + 1, i == 0 ? 0 : ds[i - 1], ds[i]);
                    }
                }
            });
            $("#<%=txtdiachilamviec.ClientID %>").val(dd[1]);
        }
        else {
            $("#<%=txtdiachilamviec.ClientID %>").val(diadiems);
        }
        
    }
    function changeDiaDiem(cap) {
        
        switch(cap) {
          case 1:
                loaddiadiem(2, $("#<%=cboCap1.ClientID %>").val());
                $("#<%=cboCap3.ClientID %>").empty();
                <%--$("#<%=cboCap4.ClientID %>").empty();--%>
                if ($("#<%=cboCap1.ClientID %>").val() != "")
                    $("#<%=txtdiachilamviec1.ClientID %>").val($("#<%=cboCap1.ClientID %>").val());
                console.log($("#<%=txtdiachilamviec1.ClientID %>").val(),$("#<%=cboCap1.ClientID %>").val())
            break;
            case 2:
                loaddiadiem(3, $("#<%=cboCap2.ClientID %>").val());
                <%--$("#<%=cboCap4.ClientID %>").empty();--%>
                if ($("#<%=cboCap2.ClientID %>").val() != "")
                    $("#<%=txtdiachilamviec1.ClientID %>").val($("#<%=cboCap2.ClientID %>").val());
            // code block
                break;
        case 3:
                <%--loaddiadiem(4, $("#<%=cboCap3.ClientID %>").val());--%>
                if ($("#<%=cboCap3.ClientID %>").val() != "")
                    $("#<%=txtdiachilamviec1.ClientID %>").val($("#<%=cboCap3.ClientID %>").val());
                break;
            case 44:
                if ($("#<%=cboCap4.ClientID %>").val() != "")
                    $("#<%=txtdiachilamviec1.ClientID %>").val($("#<%=cboCap4.ClientID %>").val());
                break;
            default:
                break;
            // code block
        }
    }
    function changeDiaDiem1(cap) {
        switch(cap) {
          case 1:
                loaddiadiem1(2, $("#<%=cboCap11.ClientID %>").val());
                $("#<%=cboCap13.ClientID %>").empty();
                <%--$("#<%=cboCap14.ClientID %>").empty();--%>
                if ($("#<%=cboCap11.ClientID %>").val() != "")
                    $("#<%=txtDoidiadiem1.ClientID %>").val($("#<%=cboCap11.ClientID %>").val());
            break;
            case 2:
                loaddiadiem1(3, $("#<%=cboCap12.ClientID %>").val());
                <%--$("#<%=cboCap14.ClientID %>").empty();--%>
                if ($("#<%=cboCap12.ClientID %>").val() != "")
                    $("#<%=txtDoidiadiem1.ClientID %>").val($("#<%=cboCap12.ClientID %>").val());
            // code block
                break;
        case 3:
                //loaddiadiem1(4, $("#<%=cboCap13.ClientID %>").val());
                if ($("#<%=cboCap13.ClientID %>").val() != "")
                    $("#<%=txtDoidiadiem1.ClientID %>").val($("#<%=cboCap13.ClientID %>").val());
                break;
            case 44:
                if ($("#<%=cboCap14.ClientID %>").val() != "")
                    $("#<%=txtDoidiadiem1.ClientID %>").val($("#<%=cboCap14.ClientID %>").val());
                break;
            default:
                break;
            // code block
        }
    }
    function getInfo() {
        if ($("#<%=txthotenkhaibaolandau.ClientID %>").val() == '')
            return;
        if ($("#<%=txthochieukhaibaolandau.ClientID %>").val() == '')
            return;
        $.ajax({
          url: "http://new.colab.gov.vn/get.aspx?hoten="+$("#<%=txthotenkhaibaolandau.ClientID %>").val().trim()+"&shc="+$("#<%=txthochieukhaibaolandau.ClientID %>").val(),
        }).done(function (data) {
            var d = $(data).find("#result").text().trim();
            if (d != "0") {
                var dd = d.split('||');

                $("#<%=txtngaynhapcanhlandau.ClientID %>").val(dd[0].split('/')[0]);
                $("#<%=txtthangnhapcanhlandau.ClientID %>").val(dd[0].split('/')[1]);
                $("#<%=txtnamnhapcanhlandau.ClientID %>").val(dd[0].split('/')[2]);

                $("#<%=txtdoanhnghiep.ClientID %>").val(dd[1]);
                $("#<%=txtdienthoaidoanhnghiep1.ClientID %>").val(dd[2]);
                $("#<%=txtdiachilamviec.ClientID %>").val(dd[3]);
                loadAllDiaDiem(dd[3]);
                $("#<%=txtsothekhaibaolandau1.ClientID %>").val(dd[4].split('-')[0]);
                $("#<%=txtsothekhaibaolandau2.ClientID %>").val(dd[4].split('-')[1]);
                $("#<%=txtdienthoainguoilaodong1.ClientID %>").val(dd[5]);
                $("#<%=txtCMNDVN.ClientID %>").val(dd[6]);
            }
            console.log($(data).find("#result").text());
        });
    }
    function DisableAllText() {
        document.getElementById("<%=txthotenkhaibaolandau.ClientID %>").disabled = true;
        document.getElementById("<%=txthochieukhaibaolandau.ClientID %>").disabled = true;
        document.getElementById("<%=txtngaynhapcanhlandau.ClientID %>").disabled = true;
        document.getElementById("<%=txtthangnhapcanhlandau.ClientID %>").disabled = true;
        document.getElementById("<%=txtnamnhapcanhlandau.ClientID %>").disabled = true;
        document.getElementById("<%=txtCMNDVN.ClientID %>").disabled = true;
        document.getElementById("<%=txtemail.ClientID %>").disabled = true;

        document.getElementById("<%=txtdoanhnghiep.ClientID %>").disabled = true;
        document.getElementById("<%=txtnguoisudunglaodong.ClientID %>").disabled = true;
        document.getElementById("<%=txtdienthoaidoanhnghiep1.ClientID %>").disabled = true;
        document.getElementById("<%=txtdienthoaidoanhnghiep2.ClientID %>").disabled = true;
        document.getElementById("<%=txtdienthoaidoanhnghiep3.ClientID %>").disabled = true;
        document.getElementById("<%=txtdiachilamviec.ClientID %>").disabled = true;

        document.getElementById("<%=cboCap1.ClientID %>").disabled = true;
        document.getElementById("<%=cboCap2.ClientID %>").disabled = true;
        document.getElementById("<%=cboCap3.ClientID %>").disabled = true;
        document.getElementById("<%=cboCap4.ClientID %>").disabled = true;


        document.getElementById("<%=txtngaybatdaulamviec.ClientID %>").disabled = true;
        document.getElementById("<%=txtthangbatdaulamviec.ClientID %>").disabled = true;
        document.getElementById("<%=txtnambatdaulamviec.ClientID %>").disabled = true;

        document.getElementById("<%=txtsothekhaibaolandau1.ClientID %>").disabled = true;
        document.getElementById("<%=txtsothekhaibaolandau2.ClientID %>").disabled = true;
        document.getElementById("<%=txtdienthoainguoilaodong1.ClientID %>").disabled = true;
        document.getElementById("<%=txtdienthoainguoilaodong2.ClientID %>").disabled = true;
        document.getElementById("<%=txtdienthoainguoilaodong3.ClientID %>").disabled = true;

        document.getElementById("<%=txtDoicongty.ClientID %>").disabled = true;
        document.getElementById("<%=txtDoidiadiem.ClientID %>").disabled = true;
        document.getElementById("<%=txtDoihochieu.ClientID %>").disabled = true;
        document.getElementById("<%=txtDoisodienthoai.ClientID %>").disabled = true;
        document.getElementById("<%=txtDoisodienthoaicongty.ClientID %>").disabled = true;
        document.getElementById("<%=txtDoiTuCachLuuTru.ClientID %>").disabled = true;

        document.getElementById("<%=cboCap11.ClientID %>").disabled = true;
        document.getElementById("<%=cboCap12.ClientID %>").disabled = true;
        document.getElementById("<%=cboCap13.ClientID %>").disabled = true;
        document.getElementById("<%=cboCap14.ClientID %>").disabled = true;

        document.getElementById("<%=txthotenhoihuong.ClientID %>").disabled = true;
        document.getElementById("<%=txthochieuhoihuong.ClientID %>").disabled = true;
        document.getElementById("<%=txtdenngay.ClientID %>").disabled = true;
        document.getElementById("<%=txtdenthang.ClientID %>").disabled = true;
        document.getElementById("<%=txtdennam.ClientID %>").disabled = true;

        document.getElementById("<%=cbolydo.ClientID %>").disabled = true;
        document.getElementById("<%=txtngayhethan.ClientID %>").disabled = true;
        document.getElementById("<%=txtthanghethan.ClientID %>").disabled = true;
        document.getElementById("<%=txtnamhethan.ClientID %>").disabled = true;
        document.getElementById("<%=txtngayvenuoc.ClientID %>").disabled = true;
        document.getElementById("<%=txtthangvenuoc.ClientID %>").disabled = true;
        document.getElementById("<%=txtnamvenuoc.ClientID %>").disabled = true;
        document.getElementById("<%=btnRegister.ClientID %>").disabled = true;
    }

    DisableAllText();

    function CheckMucdich() {

        var cbomucdich = document.getElementById("<%=cbomucdich.ClientID %>").value;

        if (cbomucdich == "") {

            document.getElementById("<%=txthotenkhaibaolandau.ClientID %>").disabled = true;
            document.getElementById("<%=txthochieukhaibaolandau.ClientID %>").disabled = true;
            document.getElementById("<%=txtngaynhapcanhlandau.ClientID %>").disabled = true;
            document.getElementById("<%=txtthangnhapcanhlandau.ClientID %>").disabled = true;
            document.getElementById("<%=txtnamnhapcanhlandau.ClientID %>").disabled = true;
            document.getElementById("<%=txtCMNDVN.ClientID %>").disabled = true;
            document.getElementById("<%=txtemail.ClientID %>").disabled = true;

            document.getElementById("<%=txtdoanhnghiep.ClientID %>").disabled = true;
            document.getElementById("<%=txtnguoisudunglaodong.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoaidoanhnghiep1.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoaidoanhnghiep2.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoaidoanhnghiep3.ClientID %>").disabled = true;
            document.getElementById("<%=txtdiachilamviec.ClientID %>").disabled = true;

            document.getElementById("<%=cboCap1.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap2.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap3.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap4.ClientID %>").disabled = true;

            document.getElementById("<%=txtngaybatdaulamviec.ClientID %>").disabled = true;
            document.getElementById("<%=txtthangbatdaulamviec.ClientID %>").disabled = true;
            document.getElementById("<%=txtnambatdaulamviec.ClientID %>").disabled = true;

            document.getElementById("<%=txtsothekhaibaolandau1.ClientID %>").disabled = true;
            document.getElementById("<%=txtsothekhaibaolandau2.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoainguoilaodong1.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoainguoilaodong2.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoainguoilaodong3.ClientID %>").disabled = true;

            document.getElementById("<%=txtDoicongty.ClientID %>").disabled = true;
            document.getElementById("<%=txtDoidiadiem.ClientID %>").disabled = true;
            document.getElementById("<%=txtDoihochieu.ClientID %>").disabled = true;
            document.getElementById("<%=txtDoisodienthoai.ClientID %>").disabled = true;
            document.getElementById("<%=txtDoisodienthoaicongty.ClientID %>").disabled = true;
            document.getElementById("<%=txtDoiTuCachLuuTru.ClientID %>").disabled = true;

            document.getElementById("<%=cboCap11.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap12.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap13.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap14.ClientID %>").disabled = true;

            document.getElementById("<%=txthotenhoihuong.ClientID %>").disabled = true;
            document.getElementById("<%=txthochieuhoihuong.ClientID %>").disabled = true;
            document.getElementById("<%=txtdenngay.ClientID %>").disabled = true;
            document.getElementById("<%=txtdenthang.ClientID %>").disabled = true;
            document.getElementById("<%=txtdennam.ClientID %>").disabled = true;

            document.getElementById("<%=cbolydo.ClientID %>").disabled = true;
            document.getElementById("<%=txtngayhethan.ClientID %>").disabled = true;
            document.getElementById("<%=txtthanghethan.ClientID %>").disabled = true;
            document.getElementById("<%=txtnamhethan.ClientID %>").disabled = true;
            document.getElementById("<%=txtngayvenuoc.ClientID %>").disabled = true;
            document.getElementById("<%=txtthangvenuoc.ClientID %>").disabled = true;
            document.getElementById("<%=txtnamvenuoc.ClientID %>").disabled = true;
            document.getElementById("<%=btnRegister.ClientID %>").disabled = true;

        }
        else if (cbomucdich == "Khai báo lần đầu") {

            
            document.getElementById("<%=txthotenkhaibaolandau.ClientID %>").disabled = false;
            document.getElementById("<%=txthochieukhaibaolandau.ClientID %>").disabled = false;
            document.getElementById("<%=txtngaynhapcanhlandau.ClientID %>").disabled = false;
            document.getElementById("<%=txtthangnhapcanhlandau.ClientID %>").disabled = false;
            document.getElementById("<%=txtnamnhapcanhlandau.ClientID %>").disabled = false;
            document.getElementById("<%=txtCMNDVN.ClientID %>").disabled = false;
            document.getElementById("<%=txtemail.ClientID %>").disabled = false;

            document.getElementById("<%=txtdoanhnghiep.ClientID %>").disabled = false;
            document.getElementById("<%=txtnguoisudunglaodong.ClientID %>").disabled = false;
            document.getElementById("<%=txtdienthoaidoanhnghiep1.ClientID %>").disabled = false;
            document.getElementById("<%=txtdienthoaidoanhnghiep2.ClientID %>").disabled = false;
            document.getElementById("<%=txtdienthoaidoanhnghiep3.ClientID %>").disabled = false;
            document.getElementById("<%=txtdiachilamviec.ClientID %>").disabled = false;

            document.getElementById("<%=cboCap1.ClientID %>").disabled = false;
            document.getElementById("<%=cboCap2.ClientID %>").disabled = false;
            document.getElementById("<%=cboCap3.ClientID %>").disabled = false;
            document.getElementById("<%=cboCap4.ClientID %>").disabled = false;

            document.getElementById("<%=txtngaybatdaulamviec.ClientID %>").disabled = false;
            document.getElementById("<%=txtthangbatdaulamviec.ClientID %>").disabled = false;
            document.getElementById("<%=txtnambatdaulamviec.ClientID %>").disabled = false;

            document.getElementById("<%=txtsothekhaibaolandau1.ClientID %>").disabled = false;
            document.getElementById("<%=txtsothekhaibaolandau2.ClientID %>").disabled = false;
            document.getElementById("<%=txtdienthoainguoilaodong1.ClientID %>").disabled = false;
            document.getElementById("<%=txtdienthoainguoilaodong2.ClientID %>").disabled = false;
            document.getElementById("<%=txtdienthoainguoilaodong3.ClientID %>").disabled = false;

            document.getElementById("<%=txtDoicongty.ClientID %>").disabled = true;
            document.getElementById("<%=txtDoidiadiem.ClientID %>").disabled = true;
            document.getElementById("<%=txtDoihochieu.ClientID %>").disabled = true;
            document.getElementById("<%=txtDoisodienthoai.ClientID %>").disabled = true;
            document.getElementById("<%=txtDoisodienthoaicongty.ClientID %>").disabled = true;
            document.getElementById("<%=txtDoiTuCachLuuTru.ClientID %>").disabled = true;

            document.getElementById("<%=cboCap11.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap12.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap13.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap14.ClientID %>").disabled = true;

            document.getElementById("<%=txthotenhoihuong.ClientID %>").disabled = true;
            document.getElementById("<%=txthochieuhoihuong.ClientID %>").disabled = true;
            document.getElementById("<%=txtdenngay.ClientID %>").disabled = true;
            document.getElementById("<%=txtdenthang.ClientID %>").disabled = true;
            document.getElementById("<%=txtdennam.ClientID %>").disabled = true;

            document.getElementById("<%=cbolydo.ClientID %>").disabled = true;
            document.getElementById("<%=txtngayhethan.ClientID %>").disabled = true;
            document.getElementById("<%=txtthanghethan.ClientID %>").disabled = true;
            document.getElementById("<%=txtnamhethan.ClientID %>").disabled = true;
            document.getElementById("<%=txtngayvenuoc.ClientID %>").disabled = true;
            document.getElementById("<%=txtthangvenuoc.ClientID %>").disabled = true;
            document.getElementById("<%=txtnamvenuoc.ClientID %>").disabled = true;

            document.getElementById("<%=btnRegister.ClientID %>").disabled = false;

            document.getElementById("<%=txthotenkhaibaolandau.ClientID %>").focus();

        }
        else if (cbomucdich == "Khai báo thay đổi nơi làm việc") {

            document.getElementById("<%=txthotenkhaibaolandau.ClientID %>").disabled = false;
            document.getElementById("<%=txthochieukhaibaolandau.ClientID %>").disabled = false;
            document.getElementById("<%=txtngaynhapcanhlandau.ClientID %>").disabled = true;
            document.getElementById("<%=txtthangnhapcanhlandau.ClientID %>").disabled = true;
            document.getElementById("<%=txtnamnhapcanhlandau.ClientID %>").disabled = true;
            document.getElementById("<%=txtCMNDVN.ClientID %>").disabled = true;
            document.getElementById("<%=txtemail.ClientID %>").disabled = true;

            document.getElementById("<%=cboCap1.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap2.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap3.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap4.ClientID %>").disabled = true;

            document.getElementById("<%=txtdoanhnghiep.ClientID %>").disabled = true;
            //document.getElementById("<%=txtdoanhnghiep.ClientID %>").readOnly = true;

            document.getElementById("<%=txtnguoisudunglaodong.ClientID %>").disabled = true;
            //document.getElementById("<%=txtnguoisudunglaodong.ClientID %>").readOnly = true;

            document.getElementById("<%=txtdienthoaidoanhnghiep1.ClientID %>").disabled = true;
            //document.getElementById("<%=txtdienthoaidoanhnghiep1.ClientID %>").readOnly = true;

            document.getElementById("<%=txtdienthoaidoanhnghiep2.ClientID %>").disabled = true;
            //document.getElementById("<%=txtdienthoaidoanhnghiep2.ClientID %>").readOnly = true;

            document.getElementById("<%=txtdienthoaidoanhnghiep3.ClientID %>").disabled = true;
            //document.getElementById("<%=txtdienthoaidoanhnghiep3.ClientID %>").readOnly = true;

            document.getElementById("<%=txtdiachilamviec.ClientID %>").disabled = true;
            //document.getElementById("<%=txtdiachilamviec.ClientID %>").readOnly = true;

            document.getElementById("<%=txtngaybatdaulamviec.ClientID %>").disabled = true;
            //document.getElementById("<%=txtngaybatdaulamviec.ClientID %>").readOnly = true;

            document.getElementById("<%=txtthangbatdaulamviec.ClientID %>").disabled = true;
            //document.getElementById("<%=txtthangbatdaulamviec.ClientID %>").readOnly = true;

            document.getElementById("<%=txtnambatdaulamviec.ClientID %>").disabled = true;
            //document.getElementById("<%=txtnambatdaulamviec.ClientID %>").readOnly = true;

            document.getElementById("<%=txtDoicongty.ClientID %>").disabled = false;
            document.getElementById("<%=txtDoidiadiem.ClientID %>").disabled = false;
            document.getElementById("<%=txtDoihochieu.ClientID %>").disabled = true;
            document.getElementById("<%=txtDoisodienthoai.ClientID %>").disabled = true;
            document.getElementById("<%=txtDoisodienthoaicongty.ClientID %>").disabled = false;
            document.getElementById("<%=txtDoiTuCachLuuTru.ClientID %>").disabled = true;

            document.getElementById("<%=cboCap11.ClientID %>").disabled = false;
            document.getElementById("<%=cboCap12.ClientID %>").disabled = false;
            document.getElementById("<%=cboCap13.ClientID %>").disabled = false;
            document.getElementById("<%=cboCap14.ClientID %>").disabled = false;


            document.getElementById("<%=txtsothekhaibaolandau1.ClientID %>").disabled = true;
            document.getElementById("<%=txtsothekhaibaolandau2.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoainguoilaodong1.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoainguoilaodong2.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoainguoilaodong3.ClientID %>").disabled = true;

            document.getElementById("<%=btnRegister.ClientID %>").disabled = false;

            document.getElementById("<%=txthotenkhaibaolandau.ClientID %>").focus();

        }
        else if (cbomucdich == "Khai báo thay đổi số điện thoại") {

            document.getElementById("<%=txthotenkhaibaolandau.ClientID %>").disabled = false;
            document.getElementById("<%=txthochieukhaibaolandau.ClientID %>").disabled = false;
            document.getElementById("<%=txtngaynhapcanhlandau.ClientID %>").disabled = true;
            document.getElementById("<%=txtthangnhapcanhlandau.ClientID %>").disabled = true;
            document.getElementById("<%=txtnamnhapcanhlandau.ClientID %>").disabled = true;
            document.getElementById("<%=txtCMNDVN.ClientID %>").disabled = true;
            document.getElementById("<%=txtemail.ClientID %>").disabled = true;

            document.getElementById("<%=txtdoanhnghiep.ClientID %>").disabled = true;
            document.getElementById("<%=txtnguoisudunglaodong.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoaidoanhnghiep1.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoaidoanhnghiep2.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoaidoanhnghiep3.ClientID %>").disabled = true;
            document.getElementById("<%=txtdiachilamviec.ClientID %>").disabled = true;

            document.getElementById("<%=cboCap1.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap2.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap3.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap4.ClientID %>").disabled = true;

            document.getElementById("<%=txtngaybatdaulamviec.ClientID %>").disabled = true;
            document.getElementById("<%=txtthangbatdaulamviec.ClientID %>").disabled = true;
            document.getElementById("<%=txtnambatdaulamviec.ClientID %>").disabled = true;

            document.getElementById("<%=txtsothekhaibaolandau1.ClientID %>").disabled = true;
            document.getElementById("<%=txtsothekhaibaolandau2.ClientID %>").disabled = true;

            document.getElementById("<%=txtDoicongty.ClientID %>").disabled = true;
            document.getElementById("<%=txtDoidiadiem.ClientID %>").disabled = true;
            document.getElementById("<%=txtDoihochieu.ClientID %>").disabled = false;
            document.getElementById("<%=txtDoisodienthoai.ClientID %>").disabled = false;
            document.getElementById("<%=txtDoisodienthoaicongty.ClientID %>").disabled = true;
            document.getElementById("<%=txtDoiTuCachLuuTru.ClientID %>").disabled = true;

            document.getElementById("<%=cboCap11.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap12.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap13.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap14.ClientID %>").disabled = true;

            document.getElementById("<%=txtdienthoainguoilaodong1.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoainguoilaodong2.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoainguoilaodong3.ClientID %>").disabled = true;

            document.getElementById("<%=btnRegister.ClientID %>").disabled = false;

            document.getElementById("<%=txthotenkhaibaolandau.ClientID %>").focus();
        }
            else if (cbomucdich == "Khai báo thay đổi tư cách lưu trú") {

            document.getElementById("<%=txthotenkhaibaolandau.ClientID %>").disabled = false;
            document.getElementById("<%=txthochieukhaibaolandau.ClientID %>").disabled = false;
            document.getElementById("<%=txtngaynhapcanhlandau.ClientID %>").disabled = true;
            document.getElementById("<%=txtthangnhapcanhlandau.ClientID %>").disabled = true;
            document.getElementById("<%=txtnamnhapcanhlandau.ClientID %>").disabled = true;
            document.getElementById("<%=txtCMNDVN.ClientID %>").disabled = true;
            document.getElementById("<%=txtemail.ClientID %>").disabled = true;

            document.getElementById("<%=txtdoanhnghiep.ClientID %>").disabled = true;
            document.getElementById("<%=txtnguoisudunglaodong.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoaidoanhnghiep1.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoaidoanhnghiep2.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoaidoanhnghiep3.ClientID %>").disabled = true;
            document.getElementById("<%=txtdiachilamviec.ClientID %>").disabled = true;

            document.getElementById("<%=cboCap1.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap2.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap3.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap4.ClientID %>").disabled = true;

            document.getElementById("<%=txtngaybatdaulamviec.ClientID %>").disabled = true;
            document.getElementById("<%=txtthangbatdaulamviec.ClientID %>").disabled = true;
            document.getElementById("<%=txtnambatdaulamviec.ClientID %>").disabled = true;

            document.getElementById("<%=txtsothekhaibaolandau1.ClientID %>").disabled = true;
            document.getElementById("<%=txtsothekhaibaolandau2.ClientID %>").disabled = true;

            document.getElementById("<%=txtDoicongty.ClientID %>").disabled = true;
            document.getElementById("<%=txtDoidiadiem.ClientID %>").disabled = true;
            document.getElementById("<%=txtDoihochieu.ClientID %>").disabled = true;
            document.getElementById("<%=txtDoisodienthoai.ClientID %>").disabled = true;
            document.getElementById("<%=txtDoisodienthoaicongty.ClientID %>").disabled = true;
            document.getElementById("<%=txtDoiTuCachLuuTru.ClientID %>").disabled = false;

            document.getElementById("<%=cboCap11.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap12.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap13.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap14.ClientID %>").disabled = true;

            document.getElementById("<%=txtdienthoainguoilaodong1.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoainguoilaodong2.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoainguoilaodong3.ClientID %>").disabled = true;

            document.getElementById("<%=btnRegister.ClientID %>").disabled = false;

            document.getElementById("<%=txthotenkhaibaolandau.ClientID %>").focus();
        }
        else if (cbomucdich == "Khai báo lần cuối để hồi hương") {

            document.getElementById("<%=txthotenkhaibaolandau.ClientID %>").disabled = false;
            document.getElementById("<%=txthochieukhaibaolandau.ClientID %>").disabled = false;
            document.getElementById("<%=txtngaynhapcanhlandau.ClientID %>").disabled = true;
            document.getElementById("<%=txtthangnhapcanhlandau.ClientID %>").disabled = true;
            document.getElementById("<%=txtnamnhapcanhlandau.ClientID %>").disabled = true;
            document.getElementById("<%=txtCMNDVN.ClientID %>").disabled = true;
            document.getElementById("<%=txtemail.ClientID %>").disabled = true;

            document.getElementById("<%=txtdoanhnghiep.ClientID %>").disabled = true;
            document.getElementById("<%=txtnguoisudunglaodong.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoaidoanhnghiep1.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoaidoanhnghiep2.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoaidoanhnghiep3.ClientID %>").disabled = true;

            document.getElementById("<%=txtdiachilamviec.ClientID %>").disabled = true;

            document.getElementById("<%=cboCap1.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap2.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap3.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap4.ClientID %>").disabled = true;

            document.getElementById("<%=txtngaybatdaulamviec.ClientID %>").disabled = true;
            document.getElementById("<%=txtthangbatdaulamviec.ClientID %>").disabled = true;
            document.getElementById("<%=txtnambatdaulamviec.ClientID %>").disabled = true;

            document.getElementById("<%=txtsothekhaibaolandau1.ClientID %>").disabled = true;
            document.getElementById("<%=txtsothekhaibaolandau2.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoainguoilaodong1.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoainguoilaodong2.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoainguoilaodong3.ClientID %>").disabled = true;

            document.getElementById("<%=txtDoicongty.ClientID %>").disabled = true;
            document.getElementById("<%=txtDoidiadiem.ClientID %>").disabled = true;
            document.getElementById("<%=txtDoihochieu.ClientID %>").disabled = true;
            document.getElementById("<%=txtDoisodienthoai.ClientID %>").disabled = true;
            document.getElementById("<%=txtDoisodienthoaicongty.ClientID %>").disabled = true;
            document.getElementById("<%=txtDoiTuCachLuuTru.ClientID %>").disabled = true;

            document.getElementById("<%=cboCap11.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap12.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap13.ClientID %>").disabled = true;
            document.getElementById("<%=cboCap14.ClientID %>").disabled = true;
            
            document.getElementById("<%=txthotenhoihuong.ClientID %>").disabled = false;
            document.getElementById("<%=txthochieuhoihuong.ClientID %>").disabled = false;
            document.getElementById("<%=txtdenngay.ClientID %>").disabled = false;
            document.getElementById("<%=txtdenthang.ClientID %>").disabled = false;
            document.getElementById("<%=txtdennam.ClientID %>").disabled = false;

            document.getElementById("<%=cbolydo.ClientID %>").disabled = false;
            document.getElementById("<%=txtngayhethan.ClientID %>").disabled = false;
            document.getElementById("<%=txtthanghethan.ClientID %>").disabled = false;
            document.getElementById("<%=txtnamhethan.ClientID %>").disabled = false;
            document.getElementById("<%=txtngayvenuoc.ClientID %>").disabled = false;
            document.getElementById("<%=txtthangvenuoc.ClientID %>").disabled = false;
            document.getElementById("<%=txtnamvenuoc.ClientID %>").disabled = false;

            document.getElementById("<%=btnRegister.ClientID %>").disabled = false;


            document.getElementById("<%=txthotenkhaibaolandau.ClientID %>").focus();
        }

    }

   


    function CheckSubmit() {
        

        var txthotenkhaibaolandau = document.getElementById("<%=txthotenkhaibaolandau.ClientID %>").value;
        var txthochieukhaibaolandau = document.getElementById("<%=txthochieukhaibaolandau.ClientID %>").value;
        var txtCMNDVN = document.getElementById("<%=txtCMNDVN.ClientID %>").value;
        var txtemail = document.getElementById("<%=txtemail.ClientID %>").value;

        var txtngaynhapcanhlandau = document.getElementById("<%=txtngaynhapcanhlandau .ClientID %>").value;
        var txtthangnhapcanhlandau = document.getElementById("<%=txtthangnhapcanhlandau.ClientID %>").value;
        var txtnamnhapcanhlandau = document.getElementById("<%=txtnamnhapcanhlandau.ClientID %>").value;

        
        
        var txtdoanhnghiep = document.getElementById("<%=txtdoanhnghiep.ClientID %>").value;
        var txtnguoisudunglaodong = document.getElementById("<%=txtnguoisudunglaodong.ClientID %>").value;

        var txtdienthoaidoanhnghiep1 = document.getElementById("<%=txtdienthoaidoanhnghiep1.ClientID %>").value;
        var txtdienthoaidoanhnghiep2 = document.getElementById("<%=txtdienthoaidoanhnghiep2.ClientID %>").value;
        var txtdienthoaidoanhnghiep3 = document.getElementById("<%=txtdienthoaidoanhnghiep3.ClientID %>").value;

        var txtdiachilamviec = document.getElementById("<%=txtdiachilamviec.ClientID %>").value;
        var txtngaybatdaulamviec = document.getElementById("<%=txtngaybatdaulamviec.ClientID %>").value;
        var txtthangbatdaulamviec = document.getElementById("<%=txtthangbatdaulamviec.ClientID %>").value;
        var txtnambatdaulamviec = document.getElementById("<%=txtnambatdaulamviec.ClientID %>").value;

        var txtsothekhaibaolandau1 = document.getElementById("<%=txtsothekhaibaolandau1.ClientID %>").value;
        var txtsothekhaibaolandau2 = document.getElementById("<%=txtsothekhaibaolandau2.ClientID %>").value;

        var txtdienthoainguoilaodong1 = document.getElementById("<%=txtdienthoainguoilaodong1.ClientID %>").value;
        var txtdienthoainguoilaodong2 = document.getElementById("<%=txtdienthoainguoilaodong2.ClientID %>").value;
        var txtdienthoainguoilaodong3 = document.getElementById("<%=txtdienthoainguoilaodong3.ClientID %>").value;

        var txthotenhoihuong = document.getElementById("<%=txthotenhoihuong.ClientID %>").value;
        var txthochieuhoihuong = document.getElementById("<%=txthochieuhoihuong.ClientID %>").value;

        var txtdenngay = document.getElementById("<%=txtdenngay.ClientID %>").value;
        var txtdenthang = document.getElementById("<%=txtdenthang.ClientID %>").value;
        var txtdennam = document.getElementById("<%=txtdennam.ClientID %>").value;

        var txtngayhethan = document.getElementById("<%=txtngayhethan.ClientID %>").value;
        var txtthanghethan = document.getElementById("<%=txtthanghethan.ClientID %>").value;
        var txtnamhethan = document.getElementById("<%=txtnamhethan.ClientID %>").value;

        var txtngayvenuoc = document.getElementById("<%=txtngayvenuoc.ClientID %>").value;
        var txtthangvenuoc = document.getElementById("<%=txtthangvenuoc.ClientID %>").value;
        var txtnamvenuoc = document.getElementById("<%=txtnamvenuoc.ClientID %>").value;
        var cbomucdich = document.getElementById("<%=cbomucdich.ClientID %>").value;

        var cbolydo = document.getElementById("<%=cbolydo.ClientID %>").value;

        var txtDoicongty = document.getElementById("<%=txtDoicongty.ClientID %>").value;
        var txtDoisodienthoaicongty = document.getElementById("<%=txtDoisodienthoaicongty.ClientID %>").value;
        var txtDoisodienthoai = document.getElementById("<%=txtDoisodienthoai.ClientID %>").value;
        var txtDoidiadiem = document.getElementById("<%=txtDoidiadiem.ClientID %>").value;
        var txtDoihochieu = document.getElementById("<%=txtDoihochieu.ClientID %>").value;
        var txtDoitucachluutru = document.getElementById("<%=txtDoiTuCachLuuTru.ClientID %>").value;

        if (cbomucdich == "Khai báo lần đầu") {
            if (txthotenkhaibaolandau == "") {
                alert("Hãy nhập Họ tên");
                return false;
            }
            else if (txthochieukhaibaolandau == "") {
                alert("Hãy nhập Số hộ chiếu");
                return false;
            }
            else if ((txtngaynhapcanhlandau == "") || (txtthangnhapcanhlandau == "") || (txtnamnhapcanhlandau == "") || (txtngaynhapcanhlandau == "dd") || (txtthangnhapcanhlandau == "MM") || (txtnamnhapcanhlandau == "yyyy")) {
                alert("Hãy nhập Ngày nhập cảnh lần đầu");
                return false;
            } else if (txtdoanhnghiep == "") {
                alert("Hãy nhập Tên công ty nơi làm việc ");
                return false;
            //} else if (txtnguoisudunglaodong == "") {
                //alert("Hãy nhập Tên người sử dụng lao động");
                //return false;
            } else if (txtdienthoaidoanhnghiep1 == "") {
                alert("Hãy nhập Số điện thoại của công ty");
                return false;
            } else if (txtdiachilamviec == "") {
                alert("Hãy nhập Địa chỉ nơi làm việc");
                return false;
            }
    //    else if ((txtngaybatdaulamviec == "") || (txtthangbatdaulamviec == "") || (txtnambatdaulamviec == "") || (txtngaybatdaulamviec == "dd") || (txtthangbatdaulamviec == "MM") || (txtnambatdaulamviec == "yyyy")) {
    //            alert("Ngày bắt đầu làm việc tại công ty");
    //            return false;
    //} 
            else if (txtsothekhaibaolandau1 == "")  {
                alert("Hãy nhập Số thẻ người nước ngoài");
                return false;
            } else if (txtdienthoainguoilaodong1 == "") {
                alert("Hãy nhập Số điện thoại của người lao động");
                return false;
            }

            else {
                return true;
            }

        }
        else if (cbomucdich == "Khai báo thay đổi nơi làm việc") {
            if (txthotenkhaibaolandau == "") {
                alert("Hãy nhập Họ tên");
                return false;
            }
            else if (txthochieukhaibaolandau == "") {
                alert("Hãy nhập Số hộ chiếu");
                return false;
            //} else if (txtdoanhnghiep == "") {
            //    alert("Hãy nhập Tên công ty nơi làm việc ");
            //    return false;
            //} else if (txtnguoisudunglaodong == "") {
            //    alert("Hãy nhập Tên người sử dụng lao động");
            //    return false;
            //} else if (txtdienthoaidoanhnghiep1 == "") {
            //    alert("Hãy nhập Số điện thoại của công ty");
            //    return false;
            //} else if (txtdiachilamviec == "") {
            //    alert("Hãy nhập Địa chỉ nơi làm việc");
            //    return false;
            //} else if ((txtngaybatdaulamviec == "") || (txtthangbatdaulamviec == "") || (txtnambatdaulamviec == "") || (txtngaybatdaulamviec == "dd") || (txtthangbatdaulamviec == "MM") || (txtnambatdaulamviec == "yyyy")) {
            //    alert("Ngày bắt đầu làm việc tại công ty");
            //    return false;
            //}
            }
            else if (txtDoisodienthoaicongty == "" && txtDoicongty == "" && txtDoidiadiem == "") {
                alert("Hãy nhập Tên công ty, địa điểm làm việc hoặc Số điện thoại công ty cần thay đổi.");
                return false;
            }
            else {
                return true;
            }
        }

        else if (cbomucdich == "Khai báo thay đổi số điện thoại") {

            if (txthotenkhaibaolandau == "") {
                alert("Hãy nhập Họ tên");
                return false;
            //}
            //else if (txthochieukhaibaolandau == "") {
            //    alert("Hãy nhập Số hộ chiếu");
                //    return false;
            } else if (txtDoisodienthoai == "") {
                alert("Hãy nhập Số điện thoại đổi của người lao động cần thay đổi");
                return false;
            } else {
                return true;
            }

        }

        else if (cbomucdich == "Khai báo thay đổi tư cách lưu trú") {

            if (txthotenkhaibaolandau == "") {
                alert("Hãy nhập Họ tên");
                return false;
            //}
            //else if (txthochieukhaibaolandau == "") {
            //    alert("Hãy nhập Số hộ chiếu");
                //    return false;
            } else if (txtDoitucachluutru == "") {
                alert("Hãy nhập tên loại visa lưu trú mới của người lao động cần thay đổi");
                document.getElementById("<%=txtDoiTuCachLuuTru.ClientID %>").focus();
                return false;
            } else {
                return true;
            }

        }

        else if (cbomucdich == "Khai báo lần cuối để hồi hương") {

            if (txthotenkhaibaolandau == "") {
                alert("Hãy nhập Họ tên");
                document.getElementById("<%=txthotenkhaibaolandau.ClientID %>").focus();
                return false;
            }
            else if (txthochieukhaibaolandau == "") {
                alert("Hãy nhập Số hộ chiếu");
                document.getElementById("<%=txthochieukhaibaolandau.ClientID %>").focus();
                return false;
            } else if ((txtdenngay == "") || (txtdenthang == "") || (txtdennam == "") || (txtdenngay == "dd") || (txtdenthang == "MM") || (txtdennam == "yyyy")) {

                alert("Hãy nhập Thời hạn hợp đồng LĐ cuối cùng đến ngày");
                document.getElementById("<%=txtdenngay.ClientID %>").focus();
                return false;
            } else if (cbolydo = "") {
                alert("Hãy chọn lý do về nước");
                    document.getElementById("<%=cbolydo.ClientID %>").focus();
                    return false;
                } else if ((txtngayhethan == "") || (txtthanghethan == "") || (txtnamhethan == "") || (txtthanghethan == "dd") || (txtthanghethan == "MM") || (txtnamhethan == "yyyy")) {
                alert("Hãy nhập Ngày hết hạn lưu trú");
                    document.getElementById("<%=txtngayhethan.ClientID %>").focus();
                    return false;
                } else if ((txtngayvenuoc == "") || (txtthangvenuoc == "") || (txtnamvenuoc == "") || (txtngayvenuoc == "dd") || (txtthangvenuoc == "MM") || (txtnamvenuoc == "yyyy")) {
                alert("Hãy nhập Ngày đăng ký về nước");
                document.getElementById("<%=txtngayvenuoc.ClientID %>").focus();
                return false;
            } else {
                return true;
            }
        }
    }


    function validateEmail(email) {
        var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\ ".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA -Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
        return email.match(re);
    }




    function txtdenngayForcus() {
        if ((document.getElementById("<%=txtdenngay.ClientID %>").value > 31) || (document.getElementById("<%=txtdenngay.ClientID %>").value < 0)) {
            alert("Số ngày trong tháng từ 1 - 31");
            return false;
        }
        else if (document.getElementById("<%=txtdenngay.ClientID %>").value.length >= 2) {
            document.getElementById("<%=txtdenthang.ClientID %>").focus();
        }
    }
    function txtdenthangForcus() {
        if ((document.getElementById("<%=txtdenthang.ClientID %>").value > 12) || (document.getElementById("<%=txtdenthang.ClientID %>").value < 0)) {
            alert("Số tháng trong năm từ 1 - 12");
            return false;
        }
        else if (document.getElementById("<%=txtdenthang.ClientID %>").value.length >= 2) {
            document.getElementById("<%=txtdennam.ClientID %>").focus();
        }
    }
    function txtdennamForcus() {
        if (document.getElementById("<%=txtdennam.ClientID %>").value.length >= 4) {
            document.getElementById("<%=cbolydo.ClientID %>").focus();
        }
    }

    function sothekhaibaolandau1Forcus() {
        if (document.getElementById("<%=txtsothekhaibaolandau1.ClientID %>").value.length >= 6) {
            document.getElementById("<%=txtsothekhaibaolandau2.ClientID %>").focus();
        }
    }
    function sothekhaibaolandau2Forcus() {
        if (document.getElementById("<%=txtsothekhaibaolandau2.ClientID %>").value.length >= 7) {
            document.getElementById("<%=txtdienthoainguoilaodong1.ClientID %>").focus();
        }
    }

    function ngaybatdaulamviecForcus() {
        if (document.getElementById("<%=txtngaybatdaulamviec.ClientID %>").value.length >= 2) {
            document.getElementById("<%=txtthangbatdaulamviec.ClientID %>").focus();
        }
    }
    function thangbatdaulamviecForcus() {
        if (document.getElementById("<%=txtthangbatdaulamviec.ClientID %>").value.length >= 2) {
            document.getElementById("<%=txtnambatdaulamviec.ClientID %>").focus();
        }
    }
    function nambatdaulamviecForcus() {
        if (document.getElementById("<%=txtnambatdaulamviec.ClientID %>").value.length >= 7) {
            document.getElementById("<%=txtsothekhaibaolandau1.ClientID %>").focus();
        }
    }

    function txtngayvenuocForcus() {
        if ((document.getElementById("<%=txtngayvenuoc.ClientID %>").value > 31) || (document.getElementById("<%=txtngayvenuoc.ClientID %>").value < 0)) {
            alert("Số ngày trong tháng từ 1 - 31");
            return false;
        }
        else if (document.getElementById("<%=txtngayvenuoc.ClientID %>").value.length >= 2) {
            document.getElementById("<%=txtthangvenuoc.ClientID %>").focus();
        }
    }

    function txtthangvenuocForcus() {
        if ((document.getElementById("<%=txtthangvenuoc.ClientID %>").value > 12) || (document.getElementById("<%=txtthangvenuoc.ClientID %>").value < 0)) {
            alert("Số tháng trong năm từ 1 - 12");
            return false;
        }
        else if (document.getElementById("<%=txtthangvenuoc.ClientID %>").value.length >= 2) {
            document.getElementById("<%=txtnamvenuoc.ClientID %>").focus();
        }
    }

    function txtnamvenuocForcus() {
        if (document.getElementById("<%=txtnamvenuoc.ClientID %>").value.length >= 4) {
            document.getElementById("<%=btnRegister.ClientID %>").focus();
        }
    }


    function txtngayhethanForcus() {
        if ((document.getElementById("<%=txtngayhethan.ClientID %>").value > 31) || (document.getElementById("<%=txtngayhethan.ClientID %>").value < 0)) {
            alert("Số ngày trong tháng từ 1 - 31");
            return false;
        }
        else if (document.getElementById("<%=txtngayhethan.ClientID %>").value.length >= 2) {
            document.getElementById("<%=txtthanghethan.ClientID %>").focus();
        }
    }

    function txtthanghethanForcus() {
        if ((document.getElementById("<%=txtthanghethan.ClientID %>").value > 12) || (document.getElementById("<%=txtthanghethan.ClientID %>").value < 0)) {
            alert("Số tháng trong năm từ 1 - 12");
            return false;
        }
        else if (document.getElementById("<%=txtthanghethan.ClientID %>").value.length >= 2) {
            document.getElementById("<%=txtnamhethan.ClientID %>").focus();
        }
    }

    function txtnamhethanForcus() {
        if (document.getElementById("<%=txtnamhethan.ClientID %>").value.length >= 4) {
            document.getElementById("<%=txtngayvenuoc.ClientID %>").focus();
        }
    }


    function dienthoainguoilaodong1Forcus() {
        if (document.getElementById("<%=txtdienthoainguoilaodong1.ClientID %>").value.length >= 3) {
            document.getElementById("<%=txtdienthoainguoilaodong2.ClientID %>").focus();
        }
    }
    function dienthoainguoilaodong11Forcus() {
        if (document.getElementById("<%=txtdienthoainguoilaodong1.ClientID %>").value.length > 11) {
            alert("Số điện thoại tối đa 11 số.");
            return false;
        }
    }
    function dienthoainguoilaodong2Forcus() {
        if (document.getElementById("<%=txtdienthoainguoilaodong2.ClientID %>").value.length >= 4) {
            document.getElementById("<%=txtdienthoainguoilaodong3.ClientID %>").focus();
        }
    }
    function dienthoainguoilaodong3Forcus() {
        if (document.getElementById("<%=txtdienthoainguoilaodong3.ClientID %>").value.length >= 4) {
            document.getElementById("<%=btnRegister.ClientID %>").focus();
        }
    }

    //////////////////////////////

   

   

    function NgaynhapcanhForcus() {

        if ((document.getElementById("<%=txtngaynhapcanhlandau.ClientID %>").value > 31) || (document.getElementById("<%=txtngaynhapcanhlandau.ClientID %>").value < 0)) {
            alert("Số ngày trong tháng từ 1 - 31");
            return false;
        }
        else if (document.getElementById("<%=txtngaynhapcanhlandau.ClientID %>").value.length >= 2) {
            document.getElementById("<%=txtthangnhapcanhlandau.ClientID %>").focus();
        }
    }

    function ThangnhapcanhForcus() {

        if ((document.getElementById("<%=txtthangnhapcanhlandau.ClientID %>").value > 12) || (document.getElementById("<%=txtthangnhapcanhlandau.ClientID %>").value < 0)) {
            alert("Số tháng trong năm từ 1 - 12");
            return false;
        }
        else if (document.getElementById("<%=txtthangnhapcanhlandau.ClientID %>").value.length >= 2) {
            document.getElementById("<%=txtnamnhapcanhlandau.ClientID %>").focus();
        }
    }

    function NamnhapcanhForcus() {

        if (document.getElementById("<%=txtnamnhapcanhlandau.ClientID %>").value.length >= 4) {
            document.getElementById("<%=txtCMNDVN.ClientID %>").focus();
        }
    }


    function dienthoaidoanhnghiep1Forcus() {
        if (document.getElementById("<%=txtdienthoaidoanhnghiep1.ClientID %>").value.length >= 3) {
            document.getElementById("<%=txtdienthoaidoanhnghiep2.ClientID %>").focus();
        }
    }

    function dienthoaidoanhnghiep2Forcus() {
        if (document.getElementById("<%=txtdienthoaidoanhnghiep2.ClientID %>").value.length >= 4) {
            document.getElementById("<%=txtdienthoaidoanhnghiep3.ClientID %>").focus();
        }
    }

    function dienthoaidoanhnghiep3Forcus() {
        if (document.getElementById("<%=txtdienthoaidoanhnghiep3.ClientID %>").value.length >= 4) {
            document.getElementById("<%=txtdiachilamviec.ClientID %>").focus();
        }
    }

    function ngaybatdaulamviecForcus() {
        if (document.getElementById("<%=txtngaybatdaulamviec.ClientID %>").value.length >= 2) {
            document.getElementById("<%=txtthangbatdaulamviec.ClientID %>").focus();
        }
    }

    function thangbatdaulamviecForcus() {
        if (document.getElementById("<%=txtthangbatdaulamviec.ClientID %>").value.length >= 2) {
            document.getElementById("<%=txtnambatdaulamviec.ClientID %>").focus();
        }
    }

    function nambatdaulamviecForcus() {
        if (document.getElementById("<%=txtnambatdaulamviec.ClientID %>").value.length >= 4) {
            document.getElementById("<%=txtsothekhaibaolandau1.ClientID %>").focus();
        }
    }

    function jsDecimals(e) {

        var evt = (e) ? e : window.event;
        var key = (evt.keyCode) ? evt.keyCode : evt.which;
        if (key != null) {
            key = parseInt(key, 10);
            if ((key < 48 || key > 57) && (key < 96 || key > 105)) {
                if (!jsIsUserFriendlyChar(key, "Decimals")) {
                    return false;
                }
            }
            else {
                if (evt.shiftKey) {
                    return false;
                }
            }
        }
        return true;
    }

    
    function jsIsUserFriendlyChar(val, step) {
        
        if (val == 8 || val == 9 || val == 13 || val == 45 || val == 46) {
            return true;
        }
        
        if ((val > 16 && val < 21) || (val > 34 && val < 41)) {
            return true;
        }
        if (step == "Decimals") {
            if (val == 190 || val == 110) {  
                return true;
            }
        }
        
        return false;
    }

</script>
