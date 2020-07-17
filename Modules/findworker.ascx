<%@ Control Language="C#" AutoEventWireup="true" CodeFile="findworker.ascx.cs" Inherits="Modules_findworker" %>


<div class="bg_title_cate1">
<div class="title_cate">
    <div class="title_cate_ico"></div>
    <a class="a_title_cate">채용 신청</a>
</div>    
<div class="title_cate_right"></div>
</div>


<div class="img_240">
     <ul class="dangkytdld">
     <li>
      <span class="nhapmatuyendung">1- <b>NHẬP MÃ ĐĂNG KÝ TUYỂN DỤNG  CỦA CÔNG TY</b> <br />&nbsp;&nbsp;&nbsp; 회사의 채용 신청번호 입력(신청한 경우) </span>
         <asp:TextBox ID="txtMaTD"  Width="135" runat="server" Height="30"></asp:TextBox>
         <asp:Button ID="btndangnhap"  runat="server" Text=" GO " Height="36"  OnClientClick="return Checkdangnhap()" 
             onclick="btndangnhap_Click" />
     </li>
     <li>
       <span class="nhapmatuyendung"> 2- <b>NẾU CHƯA CÓ MÃ ĐĂNG KÝ</b> <br />&nbsp;&nbsp;&nbsp; 신청번호 아직 없는 경우 </span>
         <asp:Button ID="txtdangky" runat="server" Text="ĐĂNG KÝ/ 신 청 " 
             onclick="txtdangky_Click" Height="36" Width="187"/>
     </li>
     <li>
       <span class="nhapmatuyendung"> 3- <b>TÌM LAO ĐỘNG</b> <br />&nbsp;&nbsp;&nbsp; 근로자 구함</span>
         <asp:TextBox ID="txtTimLD" Width="135" runat="server" Height="30"></asp:TextBox>
         <asp:Button ID="btntimlaodong" runat="server" Text=" GO " OnClientClick="return Checktimlaodong()" 
             onclick="btntimlaodong_Click" Height="36"/>
     </li>
     <li>
       <span class="nhapmatuyendung"> 4- <b>TRA CỨU, SỬA THÔNG TIN ĐĂNG KÝ</b> <br />&nbsp;&nbsp;&nbsp; 신청 내용 검색, 수정</span>

         
         <asp:Button ID="tbntracuu" runat="server" Text=" GO " 
             onclick="tbntracuu_Click" Height="36" Width="187"/>


     </li>




     </ul>
</div>

<script type="text/javascript" language="javascript">
    function Checkdangnhap() {
        var txtMaTD = document.getElementById("<%=txtMaTD.ClientID %>").value;

        if (txtMaTD == "") {
            alert("1- 회사의채용신청번호입력 (*)");
            document.getElementById("<%=txtMaTD.ClientID %>").focus();
            return false;
        }
        else {
            return true;
        }
    }


    function Checktimlaodong() {
        var txtTimLD = document.getElementById("<%=txtTimLD.ClientID %>").value;

        if (txtTimLD == "") {
            alert("3- 회사의채용신청번호입력 (*)");
            document.getElementById("<%=txtTimLD.ClientID %>").focus();
            return false;
        }
        else {
            return true;
        }
    }

   
    
</script>



