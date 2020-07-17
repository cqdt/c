<%@ Control Language="C#" AutoEventWireup="true" CodeFile="dang-ky-du-tuyen-chuong-trinh-chlb-duc.ascx.cs" Inherits="Modules_dang_ky_du_tuyen_chuong_trinh_chlb_duc" %>




<div class="bg_title_cate">
<div class="title_cate">
    <div class="title_cate_ico"></div>
    <a class="a_title_cate">Đăng ký dự tuyển chương trình điều dưỡng viên đi học tập và làm việc tại CHLB Đức</a>
</div>    
<div class="title_cate_right"></div>
</div>

<div class="img_24">
    <ul class="dangkytienghan">
        <li><span class="hokhau">Họ và tên:</span><asp:TextBox ID="txthoten" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Ngày tháng năm sinh:</span>
        
         <asp:TextBox ID="txtngaysinh" CssClass="txtngaythangnam"  Width="25" runat="server" onfocus="if(this.value=='dd') this.value='';" onblur="if(this.value=='') this.value='dd';" value="dd"></asp:TextBox>
      <span style="float:left;margin:10px 5px 0 5px">/</span>
        <asp:TextBox ID="txtthangsinh" CssClass="txtngaythangnam"  Width="25" runat="server" onfocus="if(this.value=='MM') this.value='';" onblur="if(this.value=='') this.value='MM';" value="MM"></asp:TextBox>
      <span style="float:left;margin:10px 5px 0 5px">/</span>
        <asp:TextBox ID="txtnamsinh" CssClass="txtngaythangnam"  Width="40" runat="server" onfocus="if(this.value=='yyyy') this.value='';" onblur="if(this.value=='') this.value='yyyy';" value="yyyy"></asp:TextBox>       
        
        </li>


        <li><span class="hokhau">CMND:</span><asp:TextBox ID="txtCMND" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Giới tính</span>
             <select runat="server" id="cbogioitinh" class="honnhan">
                <option value="Nam">Nam</option>
                <option value="Nữ">Nữ</option>                
            </select>
        </li>
        <li><span class="hokhau">Tình trạng hôn nhân:</span>
             <select runat="server" id="cbohonhan" class="honnhan">
                <option value="Độc thân">Độc thân</option>
                <option value="Đã kết hôn">Đã kết hôn</option>
                <option value="Đã ly hôn">Đã ly hôn</option>
            </select>
        </li>
        <li><span class="hokhau">Nơi đăng ký hộ khẩu thường trú:</span><asp:TextBox ID="txthokhau" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Số nhà/thôn/xóm:</span><asp:TextBox ID="txtsonha" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Phường/xã:</span><asp:TextBox ID="txtphuongxa" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Quân/huyện:</span><asp:TextBox ID="txtquanhuyen" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Thành phố/tỉnh:</span><asp:TextBox ID="txtthanhpho" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Số điện thoại liên hệ:</span><asp:TextBox ID="txtdienthoailienhe" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>


        <li><b><i style="width:100%;float:left;margin:15px 0 5px 0;text-align:center">Thông tin về trình độ học vấn, chuyên môn của người đăng ký</i></b></li>
        
         <li><span class="hokhau">Tình trạng học tập hiện nay</span>
             <select runat="server" id="cbotinhtranghoc" class="honnhan">
                <option value="Đang học">Đang học</option>
                <option value="Đã tốt nghiệp">Đã tốt nghiệp</option>                
            </select>
        </li>
        
        <li><span class="hokhau">Năm thứ</span><asp:TextBox ID="txtnamhoc" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>        
        
        <li><span class="hokhau">Xếp loại tốt nghiệp</span><asp:TextBox ID="txtxeploaiTN" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>        
        <li><span class="hokhau">Công việc hiện nay đang làm</span><asp:TextBox ID="txtcongviec" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>        
        <li><span class="hokhau">Nơi làm việc hiện nay</span><asp:TextBox ID="txtNoilamviec" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>        
        <li><span class="hokhau">Tên trường đang học hoặc đã tốt nghiệp</span><asp:TextBox ID="txtTruonghoc" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>        
       
       
        <li><span class="hokhau">Hệ đào tạo</span>
             <select runat="server" id="cbodaotao" class="honnhan">
                <option value="Đại học">Đại học</option>
                <option value="Cao đẳng">Cao đẳng</option>                
            </select>
        </li>

        <li><b><i style="width:100%;float:left;margin:15px 0 5px 0;text-align:center">Thông tin về người liên hệ khi cần thiết</i></b></li>
        
        
        <li><span class="hokhau">Họ tên người liên hệ:</span><asp:TextBox ID="txtnguoilienhe" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Quan hệ với người đăng ký dự tuyển:</span><asp:TextBox ID="txtquanhe" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Địa chỉ thường trú:</span><asp:TextBox ID="txtdiachinguoithan" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Điện thoại liên hệ:</span><asp:TextBox ID="txtdienthoainguoithan" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        
        <li><asp:Button ID="btngui" OnClientClick="return CheckSubmit()" runat="server" Text="Đăng ký" CssClass="btngui im" onclick="btngui_Click"/></li>
    </ul>
</div>



<script type="text/javascript" language="javascript">
    function CheckSubmit() {

        var txthoten = document.getElementById("<%=txthoten.ClientID %>").value;

        var txtngaysinh = document.getElementById("<%=txtngaysinh.ClientID %>").value;
        var txtthangsinh = document.getElementById("<%=txtthangsinh.ClientID %>").value;
        var txtnamsinh = document.getElementById("<%=txtnamsinh.ClientID %>").value;

        

        var txtCMND = document.getElementById("<%=txtCMND.ClientID %>").value;        
        var txthokhau = document.getElementById("<%=txthokhau.ClientID %>").value;
        var txtsonha = document.getElementById("<%=txtsonha.ClientID %>").value;
        var txtphuongxa = document.getElementById("<%=txtphuongxa.ClientID %>").value;
        var txtquanhuyen = document.getElementById("<%=txtquanhuyen.ClientID %>").value;
        var txtthanhpho = document.getElementById("<%=txtthanhpho.ClientID %>").value;
        var txtdienthoailienhe = document.getElementById("<%=txtdienthoailienhe.ClientID %>").value;


        var txtnguoilienhe = document.getElementById("<%=txtnguoilienhe.ClientID %>").value;
        var txtquanhe = document.getElementById("<%=txtquanhe.ClientID %>").value;
        var txtdiachinguoithan = document.getElementById("<%=txtdiachinguoithan.ClientID %>").value;
        var txtdienthoainguoithan = document.getElementById("<%=txtdienthoainguoithan.ClientID %>").value;

        if (txthoten == "") {
            alert("Hãy nhập Họ và tên");
            return false;
        }

        else if ((txtngaysinh == "") || (txtthangsinh == "") || (txtnamsinh == "") || (txtngaysinh == "dd") || (txtthangsinh == "MM") || (txtnamsinh == "yyyy")) {
            alert("Hãy nhập Ngày tháng năm sinh");
            return false;
        }
       
        else if (txtCMND == "") {
            alert("Hãy nhập CMND");
            return false;
        }
       
        else if (txthokhau == "") {
            alert("Hãy nhập Nơi đăng ký hộ khẩu thường trú");
            return false;
        }
        else if (txtsonha == "") {
            alert("Hãy nhập Số nhà/thôn/xóm");
            return false;
        }
        else if (txtphuongxa == "") {
            alert("Hãy nhập Phường/xã");
            return false;
        }
        else if (txtquanhuyen == "") {
            alert("Hãy nhập Quân/huyện");
            return false;
        }
        else if (txtthanhpho == "") {
            alert("Hãy nhập Thành phố/tỉnh");
            return false;
        }
        else if (txtdienthoailienhe == "") {
            alert("Hãy nhập Số điện thoại");
            return false;
        }        
        else if (txtnguoilienhe == "") {
            alert("Hãy nhập Hộ tên người liên hệ");
            return false;
        }
        else if (txtquanhe == "") {
            alert("Hãy nhập Quan hệ với người đăng ký");
            return false;
        }
        else if (txtdiachinguoithan == "") {
            alert("Hãy nhập Địa chỉ người liên hệ");
            return false;
        }
        else if (txtdienthoainguoithan == "") {
            alert("Hãy nhập Điện thoại người liên hệ");
            return false;
        }
        else {
            return true;
        }
    }
</script>