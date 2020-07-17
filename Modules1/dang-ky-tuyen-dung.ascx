<%@ Control Language="C#" AutoEventWireup="true" CodeFile="dang-ky-tuyen-dung.ascx.cs" Inherits="Modules_dang_ky_tuyen_dung" %>
<div class="bg_title_cate">
<div class="title_cate">
    <div class="title_cate_ico"></div>
    <a class="a_title_cate">Đăng ký tuyển dụng lao động</a>
</div>    
<div class="title_cate_right"></div>
</div>

<div class="img_24">
   
    <ul class="dangkytienghan">
        <li><span class="hokhau">Tên công ty:</span><asp:TextBox ID="txtcongty" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Ngành nghề, lĩnh vực hoạt động:</span><asp:TextBox ID="txtnganhnghe" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Địa chỉ:</span><asp:TextBox ID="txtdiachi" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Số điện thoại:</span><asp:TextBox ID="txtdienthoai" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Email hoặc Website:</span><asp:TextBox ID="txtemail" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Vị trí tuyển dụng:</span><asp:TextBox ID="txtvitri" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Điều kiện tuyển dụng:</span><asp:TextBox ID="txtdieukien" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Yêu cầu của công việc:</span><asp:TextBox ID="txtyeucau" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Số lượng cần tuyển:</span><asp:TextBox ID="txtsoluong" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Mức lương:</span><asp:TextBox ID="txtthunhap" CssClass="txthoten" Width="330" runat="server" onkeyup = "javascript:this.value=Comma(this.value);"></asp:TextBox></li>
        <li><span class="hokhau">Hồ sơ dự tuyển gồm có:</span><asp:TextBox ID="txthoso" CssClass="txthoten" Width="330" runat="server"></asp:TextBox></li>
        <li><span class="hokhau">Thời gian nhận hồ sơ từ:</span>
        
        <asp:TextBox ID="txtngaynhan" CssClass="txtngaythangnam"  Width="25" runat="server" onfocus="if(this.value=='dd') this.value='';" onblur="if(this.value=='') this.value='dd';" value="dd"></asp:TextBox>
      <span style="float:left;margin:10px 5px 0 5px">/</span>
        <asp:TextBox ID="txtthangnhan" CssClass="txtngaythangnam"  Width="25" runat="server" onfocus="if(this.value=='MM') this.value='';" onblur="if(this.value=='') this.value='MM';" value="MM"></asp:TextBox>
      <span style="float:left;margin:10px 5px 0 5px">/</span>
        <asp:TextBox ID="txtnamnhan" CssClass="txtngaythangnam"  Width="40" runat="server" onfocus="if(this.value=='yyyy') this.value='';" onblur="if(this.value=='') this.value='yyyy';" value="yyyy"></asp:TextBox>

            <span class="hosoden">đến</span>
            
            <asp:TextBox ID="txtdenngay" CssClass="txtngaythangnam"  Width="25" runat="server" onfocus="if(this.value=='dd') this.value='';" onblur="if(this.value=='') this.value='dd';" value="dd"></asp:TextBox>
      <span style="float:left;margin:10px 5px 0 5px">/</span>
            <asp:TextBox ID="txtdenthang" CssClass="txtngaythangnam"  Width="25" runat="server" onfocus="if(this.value=='MM') this.value='';" onblur="if(this.value=='') this.value='MM';" value="MM"></asp:TextBox>
            <span style="float:left;margin:10px 5px 0 5px">/</span>
            <asp:TextBox ID="txtdennam" CssClass="txtngaythangnam"  Width="40" runat="server" onfocus="if(this.value=='yyyy') this.value='';" onblur="if(this.value=='') this.value='yyyy';" value="yyyy"></asp:TextBox>
        </li>
        
        
        <li><asp:Button ID="btngui" OnClientClick="return CheckSubmit()" runat="server" Text="Đăng ký" CssClass="btngui im" onclick="btngui_Click"/></li>
    
    </ul>
      <div class="tracuu">
        <a class="a_tracuu" href="<%= Newwind.VQS.URL %>/tra-cuu-thong-tin-dang-ky-tuyen-dung.aspx">Tra cứu thông tin đăng ký tuyển dụng lao động</a>
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

        var txtcongty = document.getElementById("<%=txtcongty.ClientID %>").value;
        var txtnganhnghe = document.getElementById("<%=txtnganhnghe.ClientID %>").value;
        var txtdiachi = document.getElementById("<%=txtdiachi.ClientID %>").value;
        var txtdienthoai = document.getElementById("<%=txtdienthoai.ClientID %>").value;
        var txtemail = document.getElementById("<%=txtemail.ClientID %>").value;
        var txtvitri = document.getElementById("<%=txtvitri.ClientID %>").value;
        var txtdieukien = document.getElementById("<%=txtdieukien.ClientID %>").value;
        var txtyeucau = document.getElementById("<%=txtyeucau.ClientID %>").value;
        var txtsoluong = document.getElementById("<%=txtsoluong.ClientID %>").value;
        var txtthunhap = document.getElementById("<%=txtthunhap.ClientID %>").value;
        var txthoso = document.getElementById("<%=txthoso.ClientID %>").value;

        var txtngaynhan = document.getElementById("<%=txtngaynhan.ClientID %>").value;
        var txtthangnhan = document.getElementById("<%=txtthangnhan.ClientID %>").value;
        var txtnamnhan = document.getElementById("<%=txtnamnhan.ClientID %>").value;

        var txtdenngay = document.getElementById("<%=txtdenngay.ClientID %>").value;
        var txtdenthang = document.getElementById("<%=txtdenthang.ClientID %>").value;
        var txtdennam = document.getElementById("<%=txtdennam.ClientID %>").value;
        


        if (txtcongty == "") {
            alert("Hãy nhập Tên công ty");
            return false;
        }
        else if (txtnganhnghe == "") {
            alert("Hãy nhập Ngành nghề, lĩnh vực hoạt động");
            return false;
        }
        else if (txtdiachi == "") {
            alert("Hãy nhập Địa chỉ");
            return false;
        }
        else if (txtdienthoai == "") {
            alert("Hãy nhập số điện thoại");
            return false;
        }
        else if (txtemail == "") {
            alert("Hãy nhập Email hoặc Website");
            return false;
        }
        else if (txtvitri == "") {
            alert("Hãy nhập Vị trí tuyển dụng");
            return false;
        }
        else if (txtdieukien == "") {
            alert("Hãy nhập Điều kiện tuyển dụng");
            return false;
        }
        else if (txtyeucau == "") {
            alert("Hãy nhập Yêu cầu công việc");
            return false;
        }
        else if (txtsoluong == "") {
            alert("Hãy nhập Số lượng cần tuyển");
            return false;
        }
        else if (txtthunhap == "") {
            alert("Hãy nhập Thu nhập và chế độ đãi ngộ");
            return false;
        }
        else if (txthoso == "") {
            alert("Hãy nhập Hồ sơ dự tuyển gồm có");
            return false;
        }
        
        else if ((txtngaynhan == "") || (txtthangnhan == "") || (txtnamnhan == "") || (txtngaynhan == "dd") || (txtthangnhan == "MM") || (txtnamnhan == "yyyy")) {
            alert("Hãy nhập Thời gian nhận hồ sơ");
            return false;
        }

        else if ((txtdenngay == "") || (txtdenthang == "") || (txtdennam == "") || (txtdenngay == "dd") || (txtdenthang == "MM") || (txtdennam == "yyyy")) {
            alert("Hãy nhập Hạn nộp hồ sơ");
            return false;
        }
        
               
        else {
            return true;
        }
    }
</script>