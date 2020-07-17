<%@ Control Language="C#" AutoEventWireup="true" CodeFile="dang-ky-tim-viec.ascx.cs" Inherits="Modules_dang_ky_tim_viec" %>
<div class="bg_title_cate">
<div class="title_cate">
    <div class="title_cate_ico"></div>
    <a class="a_title_cate">Đăng ký tìm việc trong nước</a>
</div>    
<div class="title_cate_right"></div>
</div>

<div class="img_24">
   
    <ul class="dangkytienghan">
        <li><span class="hokhau">Họ và tên (Đề nghị nhập có dấu)</span><asp:TextBox ID="txthoten" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Ngày sinh</span>
        
         <asp:TextBox ID="txtngaysinh" CssClass="txtngaythangnam"  Width="25" runat="server" onfocus="if(this.value=='dd') this.value='';" onblur="if(this.value=='') this.value='dd';" value="dd"></asp:TextBox>
      <span style="float:left;margin:10px 5px 0 5px">/</span>
        <asp:TextBox ID="txtthangsinh" CssClass="txtngaythangnam"  Width="25" runat="server" onfocus="if(this.value=='MM') this.value='';" onblur="if(this.value=='') this.value='MM';" value="MM"></asp:TextBox>
      <span style="float:left;margin:10px 5px 0 5px">/</span>
        <asp:TextBox ID="txtnamsinh" CssClass="txtngaythangnam"  Width="40" runat="server" onfocus="if(this.value=='yyyy') this.value='';" onblur="if(this.value=='') this.value='yyyy';" value="yyyy"></asp:TextBox>

        
        
        
        </li>
         <li><span class="hokhau">Giới tính</span>
            <select runat="server" id="cbogioitinh" class="ngoaingu">
                <option value="Nam">Nam</option>
                <option value="Nữ">Nữ</option>
            </select>
        </li>
        <li><span class="hokhau">Địa chỉ gửi thư</span><asp:TextBox ID="txtguithu" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Địa chỉ email</span><asp:TextBox ID="txtemail" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Điện thoại liên hệ</span><asp:TextBox ID="txtdienthoai" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        
        
        <li><span class="hokhau">Ngành nghề được đào tạo</span><asp:TextBox ID="txttennuoc" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Bằng cấp (nếu có):</span><asp:TextBox ID="txtbangcap" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Tên chương trình đã tham gia :</span>
            <select runat="server" id="cbochuongtrinh" class="ngoaingu">
                <option value="EPS">EPS</option>
                <option value="IM Japan">IM Japan</option>                
            </select>
        </li>        
        <li><span class="hokhau">Ngày xuất cảnh</span>
        
         <asp:TextBox ID="txtngayxuatcanh" CssClass="txtngaythangnam"  Width="25" runat="server" onfocus="if(this.value=='dd') this.value='';" onblur="if(this.value=='') this.value='dd';" value="dd"></asp:TextBox>
      <span style="float:left;margin:10px 5px 0 5px">/</span>
        <asp:TextBox ID="txtthangxuatcanh" CssClass="txtngaythangnam"  Width="25" runat="server" onfocus="if(this.value=='MM') this.value='';" onblur="if(this.value=='') this.value='MM';" value="MM"></asp:TextBox>
      <span style="float:left;margin:10px 5px 0 5px">/</span>
        <asp:TextBox ID="txtnamxuatcanh" CssClass="txtngaythangnam"  Width="40" runat="server" onfocus="if(this.value=='yyyy') this.value='';" onblur="if(this.value=='') this.value='yyyy';" value="yyyy"></asp:TextBox>

        
        
        </li>
        <li><span class="hokhau">Ngày về nước</span>
        
         <asp:TextBox ID="txtngayvenuoc" CssClass="txtngaythangnam"  Width="25" runat="server" onfocus="if(this.value=='dd') this.value='';" onblur="if(this.value=='') this.value='dd';" value="dd"></asp:TextBox>
      <span style="float:left;margin:10px 5px 0 5px">/</span>
        <asp:TextBox ID="txtthangvenuoc" CssClass="txtngaythangnam"  Width="25" runat="server" onfocus="if(this.value=='MM') this.value='';" onblur="if(this.value=='') this.value='MM';" value="MM"></asp:TextBox>
      <span style="float:left;margin:10px 5px 0 5px">/</span>
        <asp:TextBox ID="txtnamvenuoc" CssClass="txtngaythangnam"  Width="40" runat="server" onfocus="if(this.value=='yyyy') this.value='';" onblur="if(this.value=='') this.value='yyyy';" value="yyyy"></asp:TextBox>
        
        
        </li>
        <li><span class="hokhau">Công việc cụ thể được giao khi làm việc tại nước ngoài:</span><asp:TextBox ID="txtcongviecgiao" CssClass="txtcongviec" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Thời gian làm việc:</span><asp:TextBox ID="txtthoigianlamviec" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        

        <li><span class="hokhau">Trình độ ngoại ngữ:</span>
            <select runat="server" id="cbongoaingu" class="ngoaingu">
                <option value="Nghe nói cơ bản">Nghe nói cơ bản</option>
                <option value="Nghe nói tốt">Nghe nói tốt</option>
                <option value="Có thể phiên dịch">Có thể phiên dịch</option>
                <option value="khac">Khác</option>
            </select>
            <asp:TextBox ID="txttrinhdokhac" CssClass="trinhdokhac" runat="server"></asp:TextBox>
        </li>

        <li><span class="hokhau">Công việc mong muốn</span><asp:TextBox ID="txtcongviecmongmuon" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Mức lương mong muốn:</span><asp:TextBox ID="txtmucluong" CssClass="txthoten" Width="130" runat="server" onkeyup = "javascript:this.value=Comma(this.value);"></asp:TextBox></li>
        <li><span class="hokhau">Địa chỉ làm việc mong muốn:</span><asp:TextBox ID="txtdiachimongmuon" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        
               
        
         
        <li><asp:Button ID="btngui" OnClientClick="return CheckSubmit()" runat="server" Text="Đăng ký" CssClass="btngui im" 
                onclick="btngui_Click"/></li>

    </ul>


      <div class="tracuu">
        <a class="a_tracuu" href="<%= Newwind.VQS.URL %>/tra-cuu-dang-ky-thong-tin-tim-viec.aspx">Tra cứu thông tin lao động đã đăng ký tìm việc làm</a>
        </div>

</div>

<script type="text/javascript" language ="javascript">
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
    function CheckSubmit() {

        var txthoten = document.getElementById("<%=txthoten.ClientID %>").value;
        var txtguithu = document.getElementById("<%=txtguithu.ClientID %>").value;
        var txtemail = document.getElementById("<%=txtemail.ClientID %>").value;
        var txtdienthoai = document.getElementById("<%=txtdienthoai.ClientID %>").value;


        var txtngaysinh = document.getElementById("<%=txtngaysinh.ClientID %>").value;
        var txtthangsinh = document.getElementById("<%=txtthangsinh.ClientID %>").value;
        var txtnamsinh = document.getElementById("<%=txtnamsinh.ClientID %>").value;


        var txtcongviecmongmuon = document.getElementById("<%=txtcongviecmongmuon.ClientID %>").value;
        var txtmucluong = document.getElementById("<%=txtmucluong.ClientID %>").value;
        var txtdiachimongmuon = document.getElementById("<%=txtdiachimongmuon.ClientID %>").value;
        var txtcongviecgiao = document.getElementById("<%=txtcongviecgiao.ClientID %>").value;
        var txtthoigianlamviec = document.getElementById("<%=txtthoigianlamviec.ClientID %>").value;
        var txttennuoc = document.getElementById("<%=txttennuoc.ClientID %>").value;
        var txtbangcap = document.getElementById("<%=txtbangcap.ClientID %>").value;
        var cbongoaingu = document.getElementById("<%=cbongoaingu.ClientID %>").value;
        var txttrinhdokhac = document.getElementById("<%=txttrinhdokhac.ClientID %>").value;

        if (txthoten == "") {
            alert("Hãy nhập Họ và tên");
            return false;
        }

        else if ((txtngaysinh == "") || (txtthangsinh == "") || (txtnamsinh == "") || (txtngaysinh == "dd") || (txtthangsinh == "MM") || (txtnamsinh == "yyyy")) {
            alert("Hãy nhập Ngày tháng năm sinh");
            return false;
        }

        else if (txtguithu == "") {
            alert("Hãy nhập Địa chỉ gửi thư");
            return false;
        }
        else if (txtemail == "") {
            alert("Hãy nhập Địa chỉ Email");
            return false;
        }
        else if (txtdienthoai == "") {
            alert("Hãy nhập Điện thoại liên hệ");
            return false;
        }
        else if (txtbangcap == "") {
            alert("Hãy nhập Bằng cấp (nếu có)");
            return false;
        }
        else if (txtcongviecmongmuon == "") {
            alert("Hãy nhập Công việc mong muốn");
            return false;
        }
        else if (txtmucluong == "") {
            alert("Hãy nhập Mức lương mong muốn");
            return false;
        }
        else if (txtdiachimongmuon == "") {
            alert("Hãy nhập Địa chỉ làm việc mong muốn");
            return false;
        }
        else if (txtcongviecgiao == "") {
            alert("Hãy nhập Công việc cụ thể được giao khi làm việc tại nước ngoài");
            return false;
        }
        else if (txtthoigianlamviec == "") {
            alert("Hãy nhập Thời gian làm việc");
            return false;
        }
        else if (txttennuoc == "") {
            alert("Hãy nhập Tên nước ngoài đã đi làm việc");
            return false;
        }
        else if (cbongoaingu == "khac") {
            if (txttrinhdokhac == "") {
                alert("Hãy nhập Trình độ khác");
                return false;
            }            
        }
        else {
            return true;
        }
    }
</script>