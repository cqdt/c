<%@ Control Language="C#" AutoEventWireup="true" CodeFile="khai-bao-lan-dau.ascx.cs" Inherits="Modules_khai_bao_lan_dau" %>



<div class="bg_title_cate">
<div class="title_cate">
    <div class="title_cate_ico"></div>
    <a class="a_title_cate">Khai báo lần đầu nơi làm việc tại Hàn Quốc</a>
</div>
    
<div class="title_cate_right"></div>

</div>


<div class="img_24">
    <center>
    <p class="successful">
        <img alt="Thao tác thành công" src="<%= Newwind.VQS.URL %>/images/1424769315_accepted_48.png" /><br /><br />
        Bạn đã khai báo thành công!
        <br />
         Nếu muốn xem thông tin đã khai báo, ấn nút  
    <a href="<%= Newwind.VQS.URL %>/tra-cuu-thong-tin-nguoi-lao-dong-tai-han-quoc.aspx?hc=<%=CMS.TTV.Web.Utils.GetStringFromQueryString("hc", "")  %>&ht=<%=CMS.TTV.Web.Utils.GetStringFromQueryString("ht", "") %>&st=<%=CMS.TTV.Web.Utils.GetStringFromQueryString("st", "") %>">XEM LẠI </a>


    </p>
   
    
    </center>
</div>