<%@ Control Language="C#" AutoEventWireup="true" CodeFile="timviec.ascx.cs" Inherits="Modules_timviec" %>



<div class="bg_title_cate1">
<div class="title_cate">
    <div class="title_cate_ico"></div>
    <a class="a_title_cate">HƯỚNG DẪN ĐĂNG KÝ THÔNG TIN</a>
</div>    
<div class="title_cate_right"></div>
</div>


<div class="img_240">


     <ul class="dangkytdld1">
      <li>
      <span class="dangkytimviec" style="TEXT-ALIGN: center;font-size: 18px;">ĐĂNG KÝ TÌM VIỆC TRONG NƯỚC </span>
        
     </li>
     
     <li>
      <span class="dangkytimviec">1- Đăng ký tìm việc tại phiên giao dịch việc làm, các công ty tuyển dụng </span>
         <asp:TextBox ID="txtMaTV" CssClass="txtdangkytimviec" Width="175" Height="30" runat="server" onfocus="if(this.value=='Nhập mã tìm việc đã đăng ký') this.value='';"
                    onblur="if(this.value=='') this.value='Nhập mã tìm việc đã đăng ký';" value="Nhập mã tìm việc đã đăng ký" style="width:75%"></asp:TextBox>
         <asp:Button ID="btndangnhap"  runat="server" Text=" TÌM THEO MÃ " Width="60" Height="36" OnClientClick="return Checkdangnhap()" 
             onclick="btndangnhap_Click" style="background-color: #025dab;color: #ffffff;" />
     </li>
     <li>
       <span class="dangkytimviec"> 2- Nếu chưa có mã đăng ký tìm việc</span>
         <asp:Button ID="txtdangky" runat="server" Text=" ĐĂNG KÝ " Height="36" Width="243"
             onclick="txtdangky_Click" style="background-color: #b58d0f;color: #ffffff;"/>
     </li>
     <li>
       <span class="dangkytimviec"> 3- Tìm công ty tuyển dụng</span>
         <asp:TextBox ID="txtTimLD" Width="175" Height="30"  runat="server"></asp:TextBox>
         <asp:Button ID="btntimlaodong" runat="server" Text=" TÌM CÔNG TY " Width="60" Height="36" OnClientClick="return Checktimlaodong()" 
             onclick="btntimlaodong_Click" style="background-color: #025dab;color: #ffffff;"/>
     </li>
     <li>
       <span class="dangkytimviec"> 4- Tra cứu, thay đổi thông tin đăng ký</span>

         
         <asp:Button ID="tbntracuu" runat="server" Text=" TRA CỨU " Height="36" Width="243"
             onclick="tbntracuu_Click"  style="background-color: #b58d0f;color: #ffffff;"/>


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
