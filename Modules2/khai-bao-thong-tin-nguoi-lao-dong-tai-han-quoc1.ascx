<%@ Control Language="C#" AutoEventWireup="true" CodeFile="khai-bao-thong-tin-nguoi-lao-dong-tai-han-quoc.ascx.cs"
    Inherits="Modules_khai_bao_thong_tin_nguoi_lao_dong_tai_han_quoc" %>
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
            <a href="<%= Newwind.VQS.URL %>/tin-tuc/678/tai-sao-phai-khai-bao.aspx" target="_blank">XEM HƯỚNG DẪN</a> 
        </p>
    

    
        <p class="a_kiemtra">Nếu đã khai báo, bạn có thể kiểm tra thông tin tại đây</p>
        <p class="check">
            <a href="<%= Newwind.VQS.URL %>/tra-cuu-thong-tin-nguoi-lao-dong-tai-han-quoc.aspx" target="_blank">KIỂM TRA</a> 
        </p>
    
    <p class="a_kiemtra">Nếu chưa khai báo, bạn có thể khai báo tại
            đây</p>
    
    <ul class="dangkytienghan">
        
        <li class="nentrang"><span class="hokhau">Mục đích khai báo (*)</span>
            <select runat="server" id="cbomucdich" class="ngoaingu cbohoihuong" onchange="return CheckMucdich()">
                <option value=""></option>
                <option value="Khai báo lần đầu">Khai báo lần đầu</option>
                <option value="Khai báo thay đổi nơi làm việc">Khai báo thay đổi nơi làm việc</option>
                <option value="Khai báo thay đổi số điện thoại">Khai báo thay đổi số điện thoại</option>
                <option value="Khai báo lần cuối để hồi hương">Khai báo lần cuối để hồi hương</option>
            </select>
        </li>
        <li class="kiemtrathongtin khaibaolandau xam">Dành cho khai báo lần đầu sau khi nhập cảnh
            và các lần bổ sung thông tin</li>
        <li class="nentrang"><span class="hokhau">Họ tên (*)</span><asp:TextBox ID="txthotenkhaibaolandau" 
            CssClass="txthoten uppercase" Width="150" runat="server"></asp:TextBox></li>
        <li class="xam"><span class="hokhau">Số hộ chiếu (*)</span><asp:TextBox ID="txthochieukhaibaolandau"
            CssClass="txthoten" Width="90" runat="server"></asp:TextBox></li>
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
        <li class="xam"><span class="hokhau">Số CMND Việt Nam (*)</span><asp:TextBox ID="txtCMNDVN" onkeydown="return jsDecimals(event);"
            MaxLength="12" CssClass="txthoten" Width="90" runat="server"></asp:TextBox></li>
        <li  class="nentrang"><span class="hokhau">Địa chỉ Email cá nhân</span><asp:TextBox ID="txtemail" CssClass="txthoten"
            Width="150" runat="server"></asp:TextBox>
        </li>
        <li class="xam"><span class="hokhau">Tên công ty nơi làm việc (*)</span><asp:TextBox ID="txtdoanhnghiep"
            CssClass="txthoten" Width="230" runat="server"></asp:TextBox></li>
        <li  class="nentrang"><span class="hokhau">Tên người sử dụng lao động (*)</span><asp:TextBox ID="txtnguoisudunglaodong"
            CssClass="txthoten" Width="150" runat="server"></asp:TextBox></li>
        <li class="xam"><span class="hokhau">Số điện thoại của công ty (*)</span><asp:TextBox ID="txtdienthoaidoanhnghiep1"
            onkeyup="dienthoaidoanhnghiep1Forcus();" onkeydown="return jsDecimals(event);"
            MaxLength="3" CssClass="txthoten sothecenter" Width="50" runat="server" onfocus="if(this.value=='000') this.value='';"
            onblur="if(this.value=='') this.value='000';" value="000"></asp:TextBox>
            <span style="float: left; margin: 7px 0 0 0">-</span>
            <asp:TextBox ID="txtdienthoaidoanhnghiep2" CssClass="txthoten sothecenter" Width="50"
                runat="server" onkeyup="dienthoaidoanhnghiep2Forcus();" onkeydown="return jsDecimals(event);"
                MaxLength="4" onfocus="if(this.value=='0000') this.value='';" onblur="if(this.value=='') this.value='0000';"
                value="0000"></asp:TextBox>
            <span style="float: left; margin: 7px 0 0 0">-</span>
            <asp:TextBox ID="txtdienthoaidoanhnghiep3" CssClass="txthoten sothecenter" Width="50"
                runat="server" onkeyup="dienthoaidoanhnghiep3Forcus();" onkeydown="return jsDecimals(event);"
                MaxLength="4" onfocus="if(this.value=='0000') this.value='';" onblur="if(this.value=='') this.value='0000';"
                value="0000"></asp:TextBox>
        </li>
        <li  class="nentrang"><span class="hokhau">Địa chỉ nơi làm việc (*)</span><asp:TextBox ID="txtdiachilamviec"
             CssClass="txtcongviec" Width="328" runat="server"></asp:TextBox></li>
        <li class="xam"><span class="hokhau">Ngày bắt đầu làm việc tại công ty (*)</span>
            <asp:TextBox ID="txtngaybatdaulamviec" CssClass="txtngaythangnam" onkeyup="ngaybatdaulamviecForcus();"
                onkeydown="return jsDecimals(event);" MaxLength="2" Width="25" runat="server"
                onfocus="if(this.value=='dd') this.value='';" onblur="if(this.value=='') this.value='dd';"
                value="dd"></asp:TextBox>
            <span style="float: left; margin: 10px 5px 0 5px">/</span>
            <asp:TextBox ID="txtthangbatdaulamviec" CssClass="txtngaythangnam" onkeyup="thangbatdaulamviecForcus();"
                onkeydown="return jsDecimals(event);" MaxLength="2" Width="25" runat="server"
                onfocus="if(this.value=='MM') this.value='';" onblur="if(this.value=='') this.value='MM';"
                value="MM"></asp:TextBox>
            <span style="float: left; margin: 10px 5px 0 5px">/</span>
            <asp:TextBox ID="txtnambatdaulamviec" CssClass="txtngaythangnam" onkeyup="nambatdaulamviecForcus();"
                onkeydown="return jsDecimals(event);" MaxLength="4" Width="40" runat="server"
                onfocus="if(this.value=='yyyy') this.value='';" onblur="if(this.value=='') this.value='yyyy';"
                value="yyyy"></asp:TextBox>
        </li>
        <li  class="nentrang"><span class="hokhau">Số thẻ người nước ngoài (*)</span><asp:TextBox ID="txtsothekhaibaolandau1"
            onkeyup="sothekhaibaolandau1Forcus();" onkeydown="return jsDecimals(event);"
            MaxLength="6" CssClass="txthoten sothecenter" Width="65" runat="server" onfocus="if(this.value=='000000') this.value='';"
            onblur="if(this.value=='') this.value='000000';" value="000000"></asp:TextBox><span
                style="float: left; margin: 7px 0 0 0">-</span>
            <asp:TextBox ID="txtsothekhaibaolandau2" CssClass="txthoten sothecenter" Width="65"
                runat="server" onkeyup="sothekhaibaolandau2Forcus();" onkeydown="return jsDecimals(event);"
                MaxLength="7" onfocus="if(this.value=='0000000') this.value='';" onblur="if(this.value=='') this.value='0000000';"
                value="0000000"></asp:TextBox>
        </li>
        <li class="xam"><span class="hokhau">Số điện thoại của người lao động (*)</span><asp:TextBox
            ID="txtdienthoainguoilaodong1" onkeyup="dienthoainguoilaodong1Forcus();" onkeydown="return jsDecimals(event);"
            MaxLength="3" CssClass="txthoten sothecenter" Width="50" runat="server" onfocus="if(this.value=='000') this.value='';"
            onblur="if(this.value=='') this.value='000';" value="000"></asp:TextBox>
            <span style="float: left; margin: 7px 0 0 0">-</span>
            <asp:TextBox ID="txtdienthoainguoilaodong2" CssClass="txthoten sothecenter" Width="50"
                runat="server" onkeyup="dienthoainguoilaodong2Forcus();" onkeydown="return jsDecimals(event);"
                MaxLength="4" onfocus="if(this.value=='0000') this.value='';" onblur="if(this.value=='') this.value='0000';"
                value="0000"></asp:TextBox>
            <span style="float: left; margin: 7px 0 0 0">-</span>
            <asp:TextBox ID="txtdienthoainguoilaodong3" CssClass="txthoten sothecenter" Width="50"
                runat="server" onkeyup="dienthoainguoilaodong3Forcus();" onkeydown="return jsDecimals(event);"
                MaxLength="4" onfocus="if(this.value=='0000') this.value='';" onblur="if(this.value=='') this.value='0000';"
                value="0000"></asp:TextBox>
        </li>
        <li class="kiemtrathongtin khaibaolandau nentrang">Dành cho khai báo hồi hương (về nước hẳn)</li>
        <li class="xam"><span class="hokhau">Họ tên (*)</span><asp:TextBox ID="txthotenhoihuong" CssClass="txthoten uppercase"
            Width="150" runat="server"></asp:TextBox></li>
        <li  class="nentrang"><span class="hokhau">Số hộ chiếu (*)</span><asp:TextBox ID="txthochieuhoihuong"
            CssClass="txthoten" Width="90" runat="server"></asp:TextBox></li>
        <li class="xam"><span class="hokhau">Thời hạn hợp đồng LĐ cuối cùng (*)</span> <span class="denngay">
            Đến ngày:</span>
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
            <select runat="server" id="cbolydo" class="ngoaingu cbohoihuong">
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
        <li class="xam">
            <asp:Button ID="btnRegister" runat="server" Text="ĐĂNG KÝ" OnClientClick="return CheckSubmit()"
                OnClick="btnRegister_Click" CssClass="btngui im" />
        </li>
    </ul>
</div>
<script type="text/javascript">

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
        document.getElementById("<%=txtngaybatdaulamviec.ClientID %>").disabled = true;
        document.getElementById("<%=txtthangbatdaulamviec.ClientID %>").disabled = true;
        document.getElementById("<%=txtnambatdaulamviec.ClientID %>").disabled = true;

        document.getElementById("<%=txtsothekhaibaolandau1.ClientID %>").disabled = true;
        document.getElementById("<%=txtsothekhaibaolandau2.ClientID %>").disabled = true;
        document.getElementById("<%=txtdienthoainguoilaodong1.ClientID %>").disabled = true;
        document.getElementById("<%=txtdienthoainguoilaodong2.ClientID %>").disabled = true;
        document.getElementById("<%=txtdienthoainguoilaodong3.ClientID %>").disabled = true;

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
            document.getElementById("<%=txtngaybatdaulamviec.ClientID %>").disabled = true;
            document.getElementById("<%=txtthangbatdaulamviec.ClientID %>").disabled = true;
            document.getElementById("<%=txtnambatdaulamviec.ClientID %>").disabled = true;

            document.getElementById("<%=txtsothekhaibaolandau1.ClientID %>").disabled = true;
            document.getElementById("<%=txtsothekhaibaolandau2.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoainguoilaodong1.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoainguoilaodong2.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoainguoilaodong3.ClientID %>").disabled = true;

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
            document.getElementById("<%=txtngaybatdaulamviec.ClientID %>").disabled = false;
            document.getElementById("<%=txtthangbatdaulamviec.ClientID %>").disabled = false;
            document.getElementById("<%=txtnambatdaulamviec.ClientID %>").disabled = false;

            document.getElementById("<%=txtsothekhaibaolandau1.ClientID %>").disabled = false;
            document.getElementById("<%=txtsothekhaibaolandau2.ClientID %>").disabled = false;
            document.getElementById("<%=txtdienthoainguoilaodong1.ClientID %>").disabled = false;
            document.getElementById("<%=txtdienthoainguoilaodong2.ClientID %>").disabled = false;
            document.getElementById("<%=txtdienthoainguoilaodong3.ClientID %>").disabled = false;

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

            document.getElementById("<%=txtdoanhnghiep.ClientID %>").disabled = false;
            //document.getElementById("<%=txtdoanhnghiep.ClientID %>").readOnly = true;

            document.getElementById("<%=txtnguoisudunglaodong.ClientID %>").disabled = false;
            //document.getElementById("<%=txtnguoisudunglaodong.ClientID %>").readOnly = true;

            document.getElementById("<%=txtdienthoaidoanhnghiep1.ClientID %>").disabled = false;
            //document.getElementById("<%=txtdienthoaidoanhnghiep1.ClientID %>").readOnly = true;

            document.getElementById("<%=txtdienthoaidoanhnghiep2.ClientID %>").disabled = false;
            //document.getElementById("<%=txtdienthoaidoanhnghiep2.ClientID %>").readOnly = true;

            document.getElementById("<%=txtdienthoaidoanhnghiep3.ClientID %>").disabled = false;
            //document.getElementById("<%=txtdienthoaidoanhnghiep3.ClientID %>").readOnly = true;

            document.getElementById("<%=txtdiachilamviec.ClientID %>").disabled = false;
            //document.getElementById("<%=txtdiachilamviec.ClientID %>").readOnly = true;

            document.getElementById("<%=txtngaybatdaulamviec.ClientID %>").disabled = false;
            //document.getElementById("<%=txtngaybatdaulamviec.ClientID %>").readOnly = true;

            document.getElementById("<%=txtthangbatdaulamviec.ClientID %>").disabled = false;
            //document.getElementById("<%=txtthangbatdaulamviec.ClientID %>").readOnly = true;

            document.getElementById("<%=txtnambatdaulamviec.ClientID %>").disabled = false;
            //document.getElementById("<%=txtnambatdaulamviec.ClientID %>").readOnly = true;


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
            document.getElementById("<%=txtngaybatdaulamviec.ClientID %>").disabled = true;
            document.getElementById("<%=txtthangbatdaulamviec.ClientID %>").disabled = true;
            document.getElementById("<%=txtnambatdaulamviec.ClientID %>").disabled = true;

            document.getElementById("<%=txtsothekhaibaolandau1.ClientID %>").disabled = true;
            document.getElementById("<%=txtsothekhaibaolandau2.ClientID %>").disabled = true;

            document.getElementById("<%=txtdienthoainguoilaodong1.ClientID %>").disabled = false;
            document.getElementById("<%=txtdienthoainguoilaodong2.ClientID %>").disabled = false;
            document.getElementById("<%=txtdienthoainguoilaodong3.ClientID %>").disabled = false;

            document.getElementById("<%=btnRegister.ClientID %>").disabled = false;

            document.getElementById("<%=txthotenkhaibaolandau.ClientID %>").focus();
        }
        else if (cbomucdich == "Khai báo lần cuối để hồi hương") {

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
            document.getElementById("<%=txtngaybatdaulamviec.ClientID %>").disabled = true;
            document.getElementById("<%=txtthangbatdaulamviec.ClientID %>").disabled = true;
            document.getElementById("<%=txtnambatdaulamviec.ClientID %>").disabled = true;

            document.getElementById("<%=txtsothekhaibaolandau1.ClientID %>").disabled = true;
            document.getElementById("<%=txtsothekhaibaolandau2.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoainguoilaodong1.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoainguoilaodong2.ClientID %>").disabled = true;
            document.getElementById("<%=txtdienthoainguoilaodong3.ClientID %>").disabled = true;
            
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


            document.getElementById("<%=txthotenhoihuong.ClientID %>").focus();
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

        if (cbomucdich == "Khai báo lần đầu") {

            if (txthotenkhaibaolandau == "") {
                alert("Hãy nhập Họ tên");
                return false;
            }
            else if (txthochieukhaibaolandau == "") {
                alert("Hãy nhập Số hộ chiếu");
                return false;
            }
            else if ((txtngaynhapcanhlandau == "") || (txtngaynhapcanhlandau == "dd")) {
                alert("Hãy nhập Ngày nhập cảnh lần đầu");
                return false;
            }
            else if ((txtthangnhapcanhlandau == "") || (txtthangnhapcanhlandau == "MM")) {
                alert("Hãy nhập Tháng nhập cảnh lần đầu");
                return false;
            } else if ((txtnamnhapcanhlandau == "") || (txtnamnhapcanhlandau == "yyyy")) {
                alert("Hãy nhập Năm nhập cảnh lần đầu");
                return false;
            } else if (txtCMNDVN == "") {
                alert("Hãy nhập số CMND Việt Nam");
                return false;
            } else if (txtemail != "") {
            if (!validateEmail(txtemail)) {
                alert("Địa chỉ email không đúng định dạng");
                return false;
            }
            } else if (txtdoanhnghiep == "") {
                alert("Hãy nhập Tên công ty nơi làm việc ");
                return false;
            } else if (txtnguoisudunglaodong == "") {
                alert("Hãy nhập Tên người sử dụng lao động");
                return false;
            } else if ((txtdienthoaidoanhnghiep1 == "") || (txtdienthoaidoanhnghiep2 == "") || (txtdienthoaidoanhnghiep3 == "") || (txtdienthoaidoanhnghiep1 == "000") || (txtdienthoaidoanhnghiep2 == "0000") || (txtdienthoaidoanhnghiep3 == "0000")) {
                alert("Hãy nhập Số điện thoại của công ty");
                return false;
            } else if (txtdiachilamviec == "") {
                alert("Hãy nhập Địa chỉ nơi làm việc");
                return false;
            } else if ((txtngaybatdaulamviec == "") || (txtthangbatdaulamviec == "") || (txtnambatdaulamviec == "") || (txtngaybatdaulamviec == "dd") || (txtthangbatdaulamviec == "MM") || (txtnambatdaulamviec == "yyyy")) {
                alert("Ngày bắt đầu làm việc tại công ty");
                return false;
            } else if ((txtsothekhaibaolandau1 == "") || (txtsothekhaibaolandau2 == "") || (txtsothekhaibaolandau1 == "000000") || (txtsothekhaibaolandau2 == "0000000")) {
                alert("Hãy nhập Số thẻ người nước ngoài");
                return false;
            } else if ((txtdienthoainguoilaodong1 == "") || (txtdienthoainguoilaodong2 == "") || (txtdienthoainguoilaodong3 == "") || (txtdienthoainguoilaodong1 == "000") || (txtdienthoainguoilaodong2 == "0000") || (txtdienthoainguoilaodong3 == "0000")) {
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
            } else if (txtdoanhnghiep == "") {
                alert("Hãy nhập Tên công ty nơi làm việc ");
                return false;
            } else if (txtnguoisudunglaodong == "") {
                alert("Hãy nhập Tên người sử dụng lao động");
                return false;
            } else if ((txtdienthoaidoanhnghiep1 == "") || (txtdienthoaidoanhnghiep2 == "") || (txtdienthoaidoanhnghiep3 == "") || (txtdienthoaidoanhnghiep1 == "000") || (txtdienthoaidoanhnghiep2 == "0000") || (txtdienthoaidoanhnghiep3 == "0000")) {
                alert("Hãy nhập Số điện thoại của công ty");
                return false;
            } else if (txtdiachilamviec == "") {
                alert("Hãy nhập Địa chỉ nơi làm việc");
                return false;
            } else if ((txtngaybatdaulamviec == "") || (txtthangbatdaulamviec == "") || (txtnambatdaulamviec == "") || (txtngaybatdaulamviec == "dd") || (txtthangbatdaulamviec == "MM") || (txtnambatdaulamviec == "yyyy")) {
                alert("Ngày bắt đầu làm việc tại công ty");
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
            }
            else if (txthochieukhaibaolandau == "") {
                alert("Hãy nhập Số hộ chiếu");
                return false;
            } else if ((txtdienthoainguoilaodong1 == "") || (txtdienthoainguoilaodong2 == "") || (txtdienthoainguoilaodong3 == "") || (txtdienthoainguoilaodong1 == "000") || (txtdienthoainguoilaodong2 == "0000") || (txtdienthoainguoilaodong3 == "0000")) {
                alert("Hãy nhập Số điện thoại của người lao động");
                return false;
            } else {
                return true;
            }

        }

        else if (cbomucdich == "Khai báo lần cuối để hồi hương") {

            if (txthotenhoihuong == "") {
                alert("Hãy nhập Họ tên");
                return false;
            }
            else if (txthochieuhoihuong == "") {
                alert("Hãy nhập Số hộ chiếu");
                return false;
            } else if ((txtdenngay == "") || (txtdenthang == "") || (txtdennam == "") || (txtdenngay == "dd") || (txtdenthang == "MM") || (txtdennam == "yyyy")) {
                alert("Hãy nhập Thời hạn hợp đồng LĐ cuối cùng đến ngày");
                return false;
            } else if (cbolydo = "") {
                alert("Hãy chọn lý do về nước");
                return false;
            } else if ((txtngayhethan == "") || (txtthanghethan == "") || (txtnamhethan == "") || (txtngayhethan == "dd") || (txtthanghethan == "MM") || (txtnamhethan == "yyyy")) {
                alert("Hãy nhập Thời hạn hợp đồng LĐ cuối cùng đến ngày");
                return false;
            } else if ((txtngayvenuoc == "") || (txtthangvenuoc == "") || (txtnamvenuoc == "")(txtngayvenuoc == "dd") || (txtthangvenuoc == "MM") || (txtnamvenuoc == "yyyy")) {
                alert("Hãy nhập Thời hạn hợp đồng LĐ cuối cùng đến ngày");
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
