﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="im-japan.ascx.cs" Inherits="Modules_im_japan" %>


<style>
    select{
        width:330px;
        height:25px;
    }
</style>

<div class="bg_title_cate">
<div class="title_cate">
    <div class="title_cate_ico"></div>
    <a class="a_title_cate">Đăng ký dự tuyển chương trình IM Japan</a>
</div>    
<div class="title_cate_right"></div>
</div>

<div class="img_24">
    <span class="luuy_quydinh">
        
    </span>
    <ul class="dangkytienghan">
        <li><b><i>Lưu ý: Ứng viên đăng ký thông tin tại đây với mục đích để cán bộ Trung tâm liên hệ, hộ trợ thông tin và tư vấn về chương trình. Việc ứng viên đăng ký tham gia chương trình chỉ được xác nhận khi ứng viên làm hồ sơ đăng ký dự tuyển gửi về Trung tâm trong thời gian theo quy định.</i></b></li>
        <li><span class="hokhau">Họ và tên:</span><asp:TextBox ID="txthoten" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Ngày sinh:</span>
        
         <asp:TextBox ID="txtngaysinh" CssClass="txtngaythangnam form-control" onkeyup="txtdenngayForcus();"
                onkeydown="return jsDecimals(event);" MaxLength="2" Width="25" runat="server"
                onfocus="if(this.value=='dd') this.value='';" onblur="if(this.value=='') this.value='dd';"
                value="dd"></asp:TextBox>
            <span style="float: left; margin: 10px 5px 0 5px">/</span>
            <asp:TextBox ID="txtthangsinh" CssClass="txtngaythangnam" onkeyup="txtdenthangForcus();"
                onkeydown="return jsDecimals(event);" MaxLength="2" Width="25" runat="server"
                onfocus="if(this.value=='MM') this.value='';" onblur="if(this.value=='') this.value='MM';"
                value="MM"></asp:TextBox>
            <span style="float: left; margin: 10px 5px 0 5px">/</span>
            <asp:TextBox ID="txtnamsinh" CssClass="txtngaythangnam" onkeyup="txtdennamForcus();"
                onkeydown="return jsDecimals(event);" MaxLength="4" Width="40" runat="server"
                onfocus="if(this.value=='yyyy') this.value='';" onblur="if(this.value=='') this.value='yyyy';"
                value="yyyy"></asp:TextBox>
        </li>
        <li><span class="hokhau">Số CMND/căn cước công dân:</span><asp:TextBox ID="txtCMND" CssClass="txthoten" Width="330" runat="server" onkeydown="return jsDecimals(event);" MaxLength="12" ></asp:TextBox></li>
        <li><span class="hokhau">Giới tính :</span>
             <select runat="server" id="slGioiTinh" class="">
                <option value="Nam">Nam</option>
                <option value="Nu">Nữ</option>
            </select>
        </li>
        <li><span class="hokhau">Chiều cao:</span><asp:TextBox ID="txtChieuCao" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau" style="margin-top:5px;">Nơi đăng ký hộ khẩu thường trú (chỉ ghi Tỉnh/Thành phố):</span><asp:TextBox ID="txthokhau" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Số điện thoại liên hệ:</span><asp:TextBox ID="txtdienthoai1" CssClass="txthoten" Width="330" runat="server"  onkeydown="return jsDecimals(event);" MaxLength="11"></asp:TextBox></li>
        <li><span class="hokhau">Số điện thoại liên hệ 2:</span><asp:TextBox ID="txtdienthoai2" CssClass="txthoten" Width="330" runat="server"  onkeydown="return jsDecimals(event);" MaxLength="11"></asp:TextBox></li>
        <li><span class="hokhau">Trình độ học vấn (ĐH, CĐ, THPT,…):</span><asp:TextBox ID="txttrinhdo" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>

        

        <li style="display:none"><span class="hokhau">Số nhà/thôn/xóm:</span><asp:TextBox ID="txtsonha" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li style="display:none"><span class="hokhau">Phường/xã:</span><asp:TextBox ID="txtphuongxa" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li style="display:none"><span class="hokhau">Quân/huyện:</span><asp:TextBox ID="txtquanhuyen" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li style="display:none"><span class="hokhau">Thành phố/tỉnh:</span><asp:TextBox ID="txtthanhpho" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        
        
        
        <li style="display:none"><span class="hokhau">Tình trạng hôn nhân:</span>
             <select runat="server" id="cbohonhan" class="">
                <option value="Độc thân">Độc thân</option>
                <option value="Đã kết hôn">Đã kết hôn</option>
                <option value="Đã ly hôn">Đã ly hôn</option>
            </select>
        </li>
        <li style="display:none"><span class="hokhau">Người liên hệ:</span><asp:TextBox ID="txtnguoilienhe" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li style="display:none"><span class="hokhau">Quan hệ với người đăng ký:</span><asp:TextBox ID="txtquanhe" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li style="display:none"><span class="hokhau">Địa chỉ:</span><asp:TextBox ID="txtdiachi" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li  style="display:none"><span class="hokhau">Điện thoại:</span><asp:TextBox ID="txtdienthoai" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
         <li style="display:none"><span class="hokhau">Nhập mã bảo mật bên cạnh:</span><asp:TextBox ID="TextBox1" CssClass="txthoten" Width="100" runat="server"></asp:TextBox> <asp:TextBox ID="TextBox2" CssClass="txthoten" Width="100" runat="server"></asp:TextBox></li>
        <%-- Recaptcha add html --%>
        <li><span class="hokhau"></span>
            <div id="html_element"></div></li>
        <%-- end Recaptcha add html --%>
        
         <li>
             <asp:Button ID="btngui" OnClientClick="return CheckSubmit()" runat="server" Text="Đăng ký" CssClass="btngui im" 
                onclick="btngui_Click"/></li>
        <li></li>
    </ul>
</div>


<br />  
<button id="btnsubmit" type="button" style="display:none;" >Submit</button>  

 <%--<script src="https://www.google.com/recaptcha/api.js" async defer></script>--%>   

<script  src="https://code.jquery.com/jquery-3.2.1.min.js"></script>  
<%-- Recaptcha V2 --%>
<style>
    #html_element{
        margin-left:220px;
    }
</style>
<script type="text/javascript">
    var verifyCallback = function (response) {
        $("#<%=btngui.ClientID %>").removeAttr("disabled");

      };
    var onloadCallback = function () {
          $("#<%=btngui.ClientID %>").attr("disabled", 'disabled');
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
    function CheckSubmit() {
        try {
            var txthoten = document.getElementById("<%=txthoten.ClientID %>").value;

            var txtngaysinh = document.getElementById("<%=txtngaysinh.ClientID %>").value;
            var txtthangsinh = document.getElementById("<%=txtthangsinh.ClientID %>").value;
            var txtnamsinh = document.getElementById("<%=txtnamsinh.ClientID %>").value;


            var txtCMND = document.getElementById("<%=txtCMND.ClientID %>").value;
            var txttrinhdo = document.getElementById("<%=txttrinhdo.ClientID %>").value;
            var txthokhau = document.getElementById("<%=txthokhau.ClientID %>").value;
            var txtsonha = document.getElementById("<%=txtsonha.ClientID %>").value;
            var txtphuongxa = document.getElementById("<%=txtphuongxa.ClientID %>").value;
            var txtquanhuyen = document.getElementById("<%=txtquanhuyen.ClientID %>").value;
            var txtthanhpho = document.getElementById("<%=txtthanhpho.ClientID %>").value;
            var txtdienthoai1 = document.getElementById("<%=txtdienthoai1.ClientID %>").value;
            var txtdienthoai2 = document.getElementById("<%=txtdienthoai2.ClientID %>").value;
            var txtnguoilienhe = document.getElementById("<%=txtnguoilienhe.ClientID %>").value;
            var txtquanhe = document.getElementById("<%=txtquanhe.ClientID %>").value;
            var txtdiachi = document.getElementById("<%=txtdiachi.ClientID %>").value;
            var txtdienthoai = document.getElementById("<%=txtdienthoai.ClientID %>").value;

  <%--var ma1 = document.getElementById("<%=TextBox1.ClientID %>").value;
        var ma2 = document.getElementById("<%=TextBox2.ClientID %>").value;


       if (ma1 != ma2 ) {
            alert("Mã bảo mật không khớp");
            return false;
        }--%>


            if (txthoten == "") {
                alert("Hãy nhập Họ và tên");
                return false;
            }
            else if ((txtngaysinh == "") || (txtthangsinh == "") || (txtnamsinh == "") || (txtngaysinh == "dd") || (txtthangsinh == "MM") || (txtnamsinh == "yyyy")) {
                alert("Hãy nhập Ngày sinh tháng năm sinh");
                return false;
            } 

            //else if (txtCMND == "") {
            //    alert("Hãy nhập CMND");
            //    return false;
            //}

            else if (txthokhau == "") {
                alert("Hãy nhập Nơi đăng ký hộ khẩu thường trú");
                return false;
            }
            else if (txttrinhdo == "") {
                alert("Hãy nhập Hệ đào tạo");
                return false;
            }
            //else if (txtsonha == "") {
            //    alert("Hãy nhập Số nhà/thôn/xóm");
            //    return false;
            //}
            //else if (txtphuongxa == "") {
            //    alert("Hãy nhập Phường/xã");
            //    return false;
            //}
            //else if (txtquanhuyen == "") {
            //    alert("Hãy nhập Quân/huyện");
            //    return false;
            //}
            //else if (txtthanhpho == "") {
            //    alert("Hãy nhập Thành phố/tỉnh");
            //    return false;
            //}
            else if (txtdienthoai1 == "") {
                alert("Hãy nhập Số điện thoại liên hệ");
                return false;
            }
            else if (txtdienthoai2 == "") {
                alert("Hãy nhập Số điện thoại liên hệ 2");
                return false;
            }
            //else if (txtnguoilienhe == "") {
            //    alert("Hãy nhập Người liên hệ");
            //    return false;
            //}
            //else if (txtquanhe == "") {
            //    alert("Hãy nhập Quan hệ với người đăng ký");
            //    return false;
            //}
            //else if (txtdiachi == "") {
            //    alert("Hãy nhập Địa chỉ");
            //    return false;
            //}
            //else if (txtdienthoai == "") {
            //    alert("Hãy nhập Điện thoại");
            //    return false;
            //}
            else {
                return true;
            }
        } catch (ee) {
            alert(ee.Message);
            return
        }
    }
    function txtdenngayForcus() {
        if ((document.getElementById("<%=txtngaysinh.ClientID %>").value > 31) || (document.getElementById("<%=txtngaysinh.ClientID %>").value < 0)) {
            alert("Số ngày trong tháng từ 1 - 31");
            return false;
        }
        else if (document.getElementById("<%=txtngaysinh.ClientID %>").value.length >= 2) {
            document.getElementById("<%=txtthangsinh.ClientID %>").focus();
        }
    }
    function txtdenthangForcus() {
        if ((document.getElementById("<%=txtthangsinh.ClientID %>").value > 12) || (document.getElementById("<%=txtthangsinh.ClientID %>").value < 0)) {
            alert("Số tháng trong năm từ 1 - 12");
            return false;
        }
        else if (document.getElementById("<%=txtthangsinh.ClientID %>").value.length >= 2) {
            document.getElementById("<%=txtnamsinh.ClientID %>").focus();
        }
    }
    function txtdennamForcus() {
        if (document.getElementById("<%=txtnamsinh.ClientID %>").value.length >= 4) {
            document.getElementById("<%=slGioiTinh.ClientID %>").focus();
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