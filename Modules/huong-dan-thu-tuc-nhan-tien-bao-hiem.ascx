<%@ Control Language="C#" AutoEventWireup="true" CodeFile="huong-dan-thu-tuc-nhan-tien-bao-hiem.ascx.cs" Inherits="Modules_huong_dan_thu_tuc_nhan_tien_bao_hiem" %>
<%@ Register Src="Base/Article.ascx" TagName="Article" TagPrefix="uc1" %>

<div class="bg_title_cate">
<div class="title_cate">
    <div class="title_cate_ico"></div>
    <a class="a_title_cate">Hướng dẫn thủ tục nhận tiền bảo hiểm</a>
</div>    
<div class="title_cate_right"></div>
</div>

<div class="img_24">    
        <div class="tracuu">
        <a class="a_tracuu" href="<%= Newwind.VQS.URL %>/tra-cuu-danh-sach-nguoi-lao-dong-chua-nhan-tien-bao-hiem.aspx">Tra cứu danh sách người lao động chưa nhận tiền bảo hiểm</a>
        </div>
        <br />
         <div class="tracuu">
        <a class="a_tracuu" href="<%= Newwind.VQS.URL %>/tra-cuu-danh-sach-nguoi-lao-dong-da-nop-ho-so.aspx">Tra cứu danh sách người lao động đã nộp hồ sơ</a>
        </div> <br />
        <uc1:Article ID="Article1" ArticleID="822" runat="server" />    
</div>