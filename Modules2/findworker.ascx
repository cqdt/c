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
      <span class="dangkytimviec" style="TEXT-ALIGN: center;font-size: 18px;">ĐĂNG KÝ TUYỂN DỤNG CỦA DOANH NGHIỆP </span>
        
     </li>
     
     <li class="col-left">
        <span class="nhapmatuyendung">1- <b>Nhập mã đăng ký tuyển dụng của công ty</b> <br />&nbsp;&nbsp;&nbsp; 회사의 채용 신청번호 입력(신청한 경우) </span>
     </li>
     <li class="col-right">
         <asp:TextBox ID="txtMaTD"  Width="280" runat="server" Height="30"></asp:TextBox>
         <asp:Button ID="btndangnhap"  runat="server" Text=" TÌM THEO MÃ "  Height="36" style="background-color: #025dab;color: #ffffff;"  OnClientClick="return Checkdangnhap()" 
             onclick="btndangnhap_Click" />
     </li>
     <li class="col-left">
       <span class="nhapmatuyendung"> 2- <b>Nếu chưa có mã đăng ký</b> <br />&nbsp;&nbsp;&nbsp; 신청번호 아직 없는 경우 </span>
        </li>
     <li class="col-right col-right2">
         <asp:Button ID="txtdangky" runat="server" Text="ĐĂNG KÝ/ 신 청 " 
             onclick="txtdangky_Click" Height="36" Width="280" style="background-color: #b58d0f;color: #ffffff;"/>
     </li>
     <li class="col-left">
       <span class="nhapmatuyendung"> 3- <b>Tìm lao động</b> <br />&nbsp;&nbsp;&nbsp; 근로자 구함</span>
        </li>
     <li class="col-right">
         <asp:TextBox ID="txtTimLD" Width="280" runat="server" Height="30"></asp:TextBox>
         <asp:Button ID="btntimlaodong" runat="server" Text=" TÌM KIẾM " OnClientClick="return Checktimlaodong()" 
             onclick="btntimlaodong_Click" Height="36" style="background-color: #025dab;color: #ffffff;"/>
     </li>
     <li class="col-left">
       <span class="nhapmatuyendung"> 4- <b>Tra cứu, chỉnh sửa thông tin đăng ký</b> <br />&nbsp;&nbsp;&nbsp; 신청 내용 검색, 수정</span>
 </li>
     <li class="col-right">
         
         <asp:Button ID="tbntracuu" runat="server" Text=" TRA CỨU " 
             onclick="tbntracuu_Click" Height="36" Width="280" style="background-color: #b58d0f;color: #ffffff;"/>


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



