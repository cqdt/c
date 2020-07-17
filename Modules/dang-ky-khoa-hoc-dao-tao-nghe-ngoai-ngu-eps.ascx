<%@ Control Language="C#" AutoEventWireup="true" CodeFile="dang-ky-khoa-hoc-dao-tao-nghe-ngoai-ngu-eps.ascx.cs" Inherits="Modules_dang_ky_khoa_hoc_dao_tao_nghe_ngoai_ngu_eps" %>
<div class="bg_title_cate">
<div class="title_cate">
    <div class="title_cate_ico"></div>
    <a class="a_title_cate">Đăng ký khóa học đào tạo nghề và ngoại ngữ theo chương trình EPS</a>
</div>    
<div class="title_cate_right"></div>
</div>

<div class="img_24">
     <center>
        <p class="successful">
            Đơn đăng ký tham gia khóa đào tạo khởi nghiệp cho người lao động hồi hương
        </p>
        <i>※Yêu cầu lao động điền đầy đủ thông tin dưới đây</i>
    </center>

    <ul class="dangkytienghan">
        
        <li><span class="hokhau">Thời gian đào tạo:</span><asp:TextBox ID="txtthoigiandaotao" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Họ tên:</span><asp:TextBox ID="txthoten" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Ngày sinh:</span>
        
          <asp:TextBox ID="txtngaysinh" CssClass="txtngaythangnam"  Width="25" runat="server" onfocus="if(this.value=='dd') this.value='';" onblur="if(this.value=='') this.value='dd';" value="dd"></asp:TextBox>
      <span style="float:left;margin:10px 5px 0 5px">/</span>
        <asp:TextBox ID="txtthangsinh" CssClass="txtngaythangnam"  Width="25" runat="server" onfocus="if(this.value=='MM') this.value='';" onblur="if(this.value=='') this.value='MM';" value="MM"></asp:TextBox>
      <span style="float:left;margin:10px 5px 0 5px">/</span>
        <asp:TextBox ID="txtnamsinh" CssClass="txtngaythangnam"  Width="40" runat="server" onfocus="if(this.value=='yyyy') this.value='';" onblur="if(this.value=='') this.value='yyyy';" value="yyyy"></asp:TextBox>

        
        </li>
         <li><span class="hokhau">Giới tính:</span>
            <select runat="server" id="cbogioitinh" class="ngoaingu">
                <option value="Nam">Nam</option>
                <option value="Nữ">Nữ</option>
            </select>
        </li>
        <li><span class="hokhau">Số hộ chiếu cũ:</span><asp:TextBox ID="txthochieucu" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Số hộ chiếu mới:</span><asp:TextBox ID="txthochieumoi" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Số điện thoại 1:</span><asp:TextBox ID="txtdienthoai1" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Số điện thoại 2:</span><asp:TextBox ID="txtdienthoai2" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Số CMND Việt Nam:</span><asp:TextBox ID="txtCMNDVN" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Số CMND nước ngoài:</span><asp:TextBox ID="txtCMNDNN" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Ngày nhập cảnh vào HQ:</span>
        
          <asp:TextBox ID="txtngaynhapcanh" CssClass="txtngaythangnam"  Width="25" runat="server" onfocus="if(this.value=='dd') this.value='';" onblur="if(this.value=='') this.value='dd';" value="dd"></asp:TextBox>
      <span style="float:left;margin:10px 5px 0 5px">/</span>
        <asp:TextBox ID="txtthangnhapcanh" CssClass="txtngaythangnam"  Width="25" runat="server" onfocus="if(this.value=='MM') this.value='';" onblur="if(this.value=='') this.value='MM';" value="MM"></asp:TextBox>
      <span style="float:left;margin:10px 5px 0 5px">/</span>
        <asp:TextBox ID="txtnamnhapcanh" CssClass="txtngaythangnam"  Width="40" runat="server" onfocus="if(this.value=='yyyy') this.value='';" onblur="if(this.value=='') this.value='yyyy';" value="yyyy"></asp:TextBox>

        
        
        
        </li>
        <li><span class="hokhau">Ngày xuất cảnh về VN:</span>
        
              <asp:TextBox ID="txtngayxuatcanh" CssClass="txtngaythangnam"  Width="25" runat="server" onfocus="if(this.value=='dd') this.value='';" onblur="if(this.value=='') this.value='dd';" value="dd"></asp:TextBox>
      <span style="float:left;margin:10px 5px 0 5px">/</span>
        <asp:TextBox ID="txtthangxuatcanh" CssClass="txtngaythangnam"  Width="25" runat="server" onfocus="if(this.value=='MM') this.value='';" onblur="if(this.value=='') this.value='MM';" value="MM"></asp:TextBox>
      <span style="float:left;margin:10px 5px 0 5px">/</span>
        <asp:TextBox ID="txtnamxuatcanh" CssClass="txtngaythangnam"  Width="40" runat="server" onfocus="if(this.value=='yyyy') this.value='';" onblur="if(this.value=='') this.value='yyyy';" value="yyyy"></asp:TextBox>

        
        
        </li>
        <li><span class="hokhau">Hạn cuối cùng trên CMND nước ngoài:</span>
        
         <asp:TextBox ID="txtngayhancuoi" CssClass="txtngaythangnam"  Width="25" runat="server" onfocus="if(this.value=='dd') this.value='';" onblur="if(this.value=='') this.value='dd';" value="dd"></asp:TextBox>
      <span style="float:left;margin:10px 5px 0 5px">/</span>
        <asp:TextBox ID="txtnamhancuoi" CssClass="txtngaythangnam"  Width="25" runat="server" onfocus="if(this.value=='MM') this.value='';" onblur="if(this.value=='') this.value='MM';" value="MM"></asp:TextBox>
      <span style="float:left;margin:10px 5px 0 5px">/</span>
        <asp:TextBox ID="txtthanghancuoi" CssClass="txtngaythangnam"  Width="40" runat="server" onfocus="if(this.value=='yyyy') this.value='';" onblur="if(this.value=='') this.value='yyyy';" value="yyyy"></asp:TextBox>

        
        
        </li>
        <li><span class="hokhau">Email:</span><asp:TextBox ID="txtemail" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Quê quán:</span><asp:TextBox ID="txtquequan" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Thường trú:</span><asp:TextBox ID="txtthuongtru" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>        
        <li><span class="hokhau">Trình độ học vấn:</span>
            <select runat="server" id="cbotrinhdo" class="ngoaingu">
                <option value="Cấp I">Cấp I</option>
                <option value="Cấp II">Cấp II</option>
                <option value="Cấp III">Cấp III</option>
                <option value="Trung cấp">Trung cấp</option>
                <option value="Cao đẳng">Cao đẳng</option>
                <option value="Đại học">Đại học</option>
                <option value="Cao học">Cao học</option>
            </select>
        </li>
        <li><span class="hokhau">Công ty cuối cùng:</span><asp:TextBox ID="txtctycuoi" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Điện thoại:</span><asp:TextBox ID="txtdienthoaicty" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Thời gian làm việc:</span><asp:TextBox ID="txtthoigianlamviec" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li style="display:none"><span class="hokhau">Muốn quay lại Hàn Quốc làm việc:</span>
            <select runat="server" id="cboQuaylaiHQ" class="ngoaingu">
                <option value="Có">Có</option>
                <option value="Không">Không</option>                
            </select>
        </li>
        <li style="display:none"><span class="hokhau">Thi EPS-TOPIK: 
</span>
            <select runat="server" id="cboThiEPS" class="ngoaingu">
                <option value="Chưa thi">Chưa thi</option>
                <option value="Đã thi">Đã thi</option>                
            </select><i style="float:left;margin:8px 0 0 4px">(Thi để quay lại Hàn Quốc làm việc)</i>
        </li>
        <li style="display:none"><span class="hokhau">Ngày thi:</span><asp:TextBox ID="txtngaythi" CssClass="txthoten"  Width="330" runat="server" onfocus="if(this.value=='31/12/1985') this.value='';" onblur="if(this.value=='') this.value='31/12/1985';" value="31/12/1985"></asp:TextBox></li>
        <li style="display:none"><span class="hokhau">Số điểm:</span><asp:TextBox ID="txtsodiem" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><asp:Button ID="btngui" OnClientClick="return CheckSubmit()" runat="server" Text="Đăng ký" CssClass="btngui im" onclick="btngui_Click"/></li>

    </ul>

</div>


<script type="text/javascript" language="javascript">
    function CheckSubmit() {

       
        var txtthoigiandaotao = document.getElementById("<%=txtthoigiandaotao.ClientID %>").value;
        var txthoten = document.getElementById("<%=txthoten.ClientID %>").value;


        var txtngaysinh = document.getElementById("<%=txtngaysinh.ClientID %>").value;
        var txtthangsinh = document.getElementById("<%=txtthangsinh.ClientID %>").value;
        var txtnamsinh = document.getElementById("<%=txtnamsinh.ClientID %>").value;


        var txthochieucu = document.getElementById("<%=txthochieucu.ClientID %>").value;
        var txthochieumoi = document.getElementById("<%=txthochieumoi.ClientID %>").value;
        var txtdienthoai1 = document.getElementById("<%=txtdienthoai1.ClientID %>").value;
        var txtdienthoai2 = document.getElementById("<%=txtdienthoai2.ClientID %>").value;

        var txtCMNDVN = document.getElementById("<%=txtCMNDVN.ClientID %>").value;
        var txtCMNDNN = document.getElementById("<%=txtCMNDNN.ClientID %>").value;
        var txtemail = document.getElementById("<%=txtemail.ClientID %>").value;
        var txtquequan = document.getElementById("<%=txtquequan.ClientID %>").value;
        var txtthuongtru = document.getElementById("<%=txtthuongtru.ClientID %>").value;

        var txtctycuoi = document.getElementById("<%=txtctycuoi.ClientID %>").value;
        var txtdienthoaicty = document.getElementById("<%=txtdienthoaicty.ClientID %>").value;
        var txtthoigianlamviec = document.getElementById("<%=txtthoigianlamviec.ClientID %>").value;
        //var txtsodiem = document.getElementById("<%=txtsodiem.ClientID %>").value;
        var cboThiEPS = document.getElementById("<%=cboThiEPS.ClientID %>").value;


        if (txtthoigiandaotao == "") {
            alert("Hãy nhập Thời gian đào tạo");
            return false;
        }
        else if (txthoten == "") {
            alert("Hãy nhập Họ tên");
            return false;
        }

        else if ((txtngaysinh == "") || (txtthangsinh == "") || (txtnamsinh == "") || (txtngaysinh == "dd") || (txtthangsinh == "MM") || (txtnamsinh == "yyyy")) {
            alert("Hãy nhập Ngày tháng năm sinh");
            return false;
        }

        else if (txthochieucu == "") {
            alert("Hãy nhập Số hộ chiếu cũ");
            return false;
        }
        else if (txthochieumoi == "") {
            alert("Hãy nhập Số hộ chiếu mới");
            return false;
        }
        else if (txtdienthoai1 == "") {
            alert("Hãy nhập Số điện thoại 1");
            return false;
        }
        else if (txtdienthoai2 == "") {
            alert("Hãy nhập Số điện thoại 2");
            return false;
        }
        else if (txtCMNDVN == "") {
            alert("Hãy nhập CMND Việt Nam");
            return false;
        }
        else if (txtCMNDNN == "") {
            alert("Hãy nhập CMND nước ngoài");
            return false;
        }
        else if (txtemail == "") {
            alert("Hãy nhập Email");
            return false;
        }
        else if (txtquequan == "") {            
            alert("Hãy nhập Quê quán");
            return false;
        }
        else if (txtthuongtru == "") {
            alert("Hãy nhập Thường trú");
            return false;
        }
        else if (txtctycuoi == "") {
            alert("Hãy nhập Công ty cuối cùng");
            return false;
        }
        else if (txtdienthoaicty == "") {
            alert("Hãy nhập Điện thoại công ty cuối cùng");
            return false;
        }
        else if (txtthoigianlamviec == "") {
            alert("Hãy nhập Thời gian làm việc");
            return false;
        }

//        else if (cboThiEPS.value == "Đã thi") {
//            if (txtsodiem == "") {
//                alert("Hãy nhập Số điểm thi");
//                return false;
//            }
//        }
        else {
            return true;
        }
    }
</script>