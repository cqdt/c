<%@ Control Language="C#" AutoEventWireup="true" CodeFile="khai-bao-thay-doi-so-dien-thoai.ascx.cs" Inherits="Modules_khai_bao_thay_doi_so_dien_thoai" %>
<div class="bg_title_cate">
<div class="title_cate">
    <div class="title_cate_ico"></div>
    <a class="a_title_cate">Khai báo lần đầu nơi làm việc tại Hàn Quốc</a>
</div>
    
<div class="title_cate_right"></div>

</div>


<div class="img_24">
    <center>
    <p id="successful" runat="server" class="successful">
        <img alt="Thao tác thành công" src="<%= Newwind.VQS.URL %>/images/1424769315_accepted_48.png" /><br /><br />
        Bạn đã khai báo thành công!
        <br />
       <i style="font-size:11px;font-weight:normal;">  Nếu muốn xem thông tin đã khai báo, ấn nút  
     <a href="<%= Newwind.VQS.URL %>/tra-cuu-thong-tin-nguoi-lao-dong-tai-han-quoc.aspx?hc=<%=CMS.TTV.Web.Utils.GetStringFromQueryString("hc", "")  %>&ht=<%=CMS.TTV.Web.Utils.GetStringFromQueryString("ht", "") %>&st=<%=CMS.TTV.Web.Utils.GetStringFromQueryString("st", "") %>">XEM LẠI </a>
     </i>

    </p>

     <p id="unsuccessful" runat="server" class="successful">
        <img alt="" src="<%= Newwind.VQS.URL %>/images/warning.png" /><br /><br />
        Có thể bạn chưa khai báo hoặc nhập sai thông tin!
        <br />
   <i style="font-size:11px;font-weight:normal;">    Xem lại hướng dẫn  
        <a href="#">XEM</a> hoặc <br />

        Liên hệ với Văn phòng QLLĐ Việt Nam theo chương trình EPS tại Hàn Quốc để được hướng dẫn.
        </i>

    </p>


   
    
    </center>
</div>