<%@ Control Language="C#" AutoEventWireup="true" CodeFile="timviec.ascx.cs" Inherits="Modules_timviec" %>



<div class="bg_title_cate1">
<div class="title_cate">
    <div class="title_cate_ico"></div>
    <a class="a_title_cate">HƯỚNG DẪN ĐĂNG KÝ THÔNG TIN</a>
</div>    
<div class="title_cate_right"></div>
</div>


<div class="img_240">
     <ul class="dangkytdld">
     <li>
      <span class="dangkytimviec">1- ĐĂNG KÝ TÌM VIỆC TẠI PHIÊN GIAO DỊCH VIỆC LÀM, CÁC CÔNG TY TUYỂN DỤNG </span>
         <asp:TextBox ID="txtMaTV" CssClass="txtdangkytimviec" Width="175" Height="30" runat="server" onfocus="if(this.value=='Nhập mã tìm việc đã đăng ký') this.value='';"
                    onblur="if(this.value=='') this.value='Nhập mã tìm việc đã đăng ký';" value="Nhập mã tìm việc đã đăng ký"></asp:TextBox>
         <asp:Button ID="btndangnhap"  runat="server" Text=" GO " Width="60" Height="36" OnClientClick="return Checkdangnhap()" 
             onclick="btndangnhap_Click" />
     </li>
     <li>
       <span class="dangkytimviec"> 2- NẾU CHƯA CÓ MÃ ĐĂNG KÝ TÌM VIỆC</span>
         <asp:Button ID="txtdangky" runat="server" Text=" ĐĂNG KÝ " Height="36" Width="243"
             onclick="txtdangky_Click" />
     </li>
     <li>
       <span class="dangkytimviec"> 3- TÌM CÔNG TY TUYỂN DỤNG</span>
         <asp:TextBox ID="txtTimLD" Width="175" Height="30"  runat="server"></asp:TextBox>
         <asp:Button ID="btntimlaodong" runat="server" Text=" GO " Width="60" Height="36" OnClientClick="return Checktimlaodong()" 
             onclick="btntimlaodong_Click" />
     </li>
     <li>
       <span class="dangkytimviec"> 4- TRA CỨU, THAY ĐỔI THÔNG TIN ĐĂNG KÝ</span>

         
         <asp:Button ID="tbntracuu" runat="server" Text=" GO " Height="36" Width="243"
             onclick="tbntracuu_Click" />


     </li>




     </ul>
</div>

<script type="text/javascript" language="javascript">
    function Checkdangnhap() {
        var txtMaTV = document.getElementById("<%=txtMaTV.ClientID %>").value;

        if (txtMaTV == "") {
            alert("NHẬP MÃ ĐĂNG KÝ TÌM VIỆC (*)");
            document.getElementById("<%=txtMaTV.ClientID %>").focus();
            return false;
        }
        else {
            return true;
        }
    }


    function Checktimlaodong() {
        var txtTimLD = document.getElementById("<%=txtTimLD.ClientID %>").value;

        if (txtTimLD == "") {
            alert("NHẬP MÃ ĐĂNG KÝ TÌM VIỆC (*)");
            document.getElementById("<%=txtTimLD.ClientID %>").focus();
            return false;
        }
        else {
            return true;
        }
    }


</script>
