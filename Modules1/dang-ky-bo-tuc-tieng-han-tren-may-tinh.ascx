<%@ Control Language="C#" AutoEventWireup="true" CodeFile="dang-ky-bo-tuc-tieng-han-tren-may-tinh.ascx.cs" Inherits="Modules_dang_ky_bo_tuc_tieng_han_tren_may_tinh" %>



<div class="bg_title_cate">
<div class="title_cate">
    <div class="title_cate_ico"></div>
    <a class="a_title_cate">Đăng ký bổ túc tiếng Hàn trên máy tính</a>
</div>
    
<div class="title_cate_right"></div>

</div>



<div class="img_24">
    <ul class="dangkytienghan">
        <li><span class="hoten">Họ và tên:</span><asp:TextBox ID="txthoten" CssClass="txthoten" Width="397" runat="server"></asp:TextBox></li>
        <li><span class="hoten">Ngày sinh:</span>
        
          <asp:TextBox ID="txtngaysinh" CssClass="txtngaythangnam"  Width="25" runat="server" onfocus="if(this.value=='dd') this.value='';" onblur="if(this.value=='') this.value='dd';" value="dd"></asp:TextBox>
      <span style="float:left;margin:10px 5px 0 5px">/</span>
        <asp:TextBox ID="txtthangsinh" CssClass="txtngaythangnam"  Width="25" runat="server" onfocus="if(this.value=='MM') this.value='';" onblur="if(this.value=='') this.value='MM';" value="MM"></asp:TextBox>
      <span style="float:left;margin:10px 5px 0 5px">/</span>
        <asp:TextBox ID="txtnamsinh" CssClass="txtngaythangnam"  Width="40" runat="server" onfocus="if(this.value=='yyyy') this.value='';" onblur="if(this.value=='') this.value='yyyy';" value="yyyy"></asp:TextBox>
        </li>
        <li><span class="hoten">Giới tính:</span>
            <select runat="server" id="cbogioitinh" class="gioitinh">
                <option value="Nam">Nam</option>
                <option value="Nữ">Nữ</option>
            </select>
        </li>
        <li><span class="hoten">Thường trú tại Tỉnh/TP:</span><asp:TextBox ID="txtthuongtru" Width="397" CssClass="txthoten" runat="server"></asp:TextBox></li>
        <li><span class="hoten">Ngày từ Hàn Quốc về nước:</span>
        
        <asp:TextBox ID="txtngayve" CssClass="txtngaythangnam"  Width="25" runat="server" onfocus="if(this.value=='dd') this.value='';" onblur="if(this.value=='') this.value='dd';" value="dd"></asp:TextBox>
      <span style="float:left;margin:10px 5px 0 5px">/</span>
        <asp:TextBox ID="txtthangve" CssClass="txtngaythangnam"  Width="25" runat="server" onfocus="if(this.value=='MM') this.value='';" onblur="if(this.value=='') this.value='MM';" value="MM"></asp:TextBox>
      <span style="float:left;margin:10px 5px 0 5px">/</span>
        <asp:TextBox ID="txtnamve" CssClass="txtngaythangnam"  Width="40" runat="server" onfocus="if(this.value=='yyyy') this.value='';" onblur="if(this.value=='') this.value='yyyy';" value="yyyy"></asp:TextBox>


        </li>
        <li><span class="hoten">Đăng ký học tháng:</span>
             <select runat="server" id="cbothanghoc" class="gioitinh">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
            </select>
        </li>
        <li><span class="hoten">Số điện thoại liên hệ:</span><asp:TextBox ID="txtdienthoai" Width="397" CssClass="txthoten" runat="server"></asp:TextBox></li>
        <li><asp:Button ID="btngui" OnClientClick="return CheckSubmit()" runat="server" Text="Đăng ký" CssClass="btngui" 
                onclick="btngui_Click"/></li>
    </ul>
    
    
    
    
    
    
    
    
</div>
<script type="text/javascript" language="javascript">
    function CheckSubmit() {
        
        var txthoten = document.getElementById("<%=txthoten.ClientID %>").value;
        var txtthuongtru = document.getElementById("<%=txtthuongtru.ClientID %>").value;
        var txtdienthoai = document.getElementById("<%=txtdienthoai.ClientID %>").value;
       
        var txtngaysinh = document.getElementById("<%=txtngaysinh.ClientID %>").value;
        var txtthangsinh = document.getElementById("<%=txtthangsinh.ClientID %>").value;
        var txtnamsinh = document.getElementById("<%=txtnamsinh.ClientID %>").value;


        if (txthoten == "") {
            alert("Hãy nhập Họ và tên");
            return false;
        }

        else if ((txtngaysinh == "") || (txtthangsinh == "") || (txtnamsinh == "") || (txtngaysinh == "dd") || (txtthangsinh == "MM") || (txtnamsinh == "yyyy")) {
            alert("Hãy nhập Ngày tháng năm sinh");
            return false;
        }

        else if (txtthuongtru == "") {
            alert("Hãy nhập Thường trú tại Tỉnh/TP");
            return false;
        }
        else if (txtdienthoai == "") {
            alert("Hãy nhập Số điện thoại liên hệ");
            return false;
        }
        else {
            return true;
        }
    }
</script>