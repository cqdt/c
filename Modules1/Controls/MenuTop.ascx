<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MenuTop.ascx.cs" Inherits="Modules_Controls_MenuTop" %>
<%@ Register Src="Search.ascx" TagName="Search" TagPrefix="uc10" %>

<ul class="menu_top2">
    <li>
        <a href="<%= Newwind.VQS.URL %>">Trang chủ</a>
    </li>
    <li>
        <a href="">Giới thiệu</a>
        <%= drophtml %>
    </li>
     <li><a  href="<%= Newwind.VQS.URL %>/van-ban-lien-quan.aspx">Văn bản liên quan</a></li> 
    <li><a  href="<%= Newwind.VQS.URL %>/tai-bieu-mau.aspx">Tải biểu mẫu</a></li>
    
    <ul>
        <li><a href="http://colab.gov.vn/tin-tucs/428/Chuong-trinh-EPS.aspx">Chương trình EPS</a>
            </li>
        <li><a href="http://colab.gov.vn/tin-tucs/429/Chuong-trinh-IM-Japan.aspx">Chương trình IM Japan</a>
            </li>
        <li><a href="http://colab.gov.vn/tin-tucs/430/Chuong-trinh-CHLB-Duc.aspx">Chương trình CHLB Đức</a>
            </li>
        <li><a href="http://colab.gov.vn/tin-tucs/431/Dai-Loan.aspx">Đài Loan</a></li>
        <li><a href="http://colab.gov.vn/tin-tucs/471/Chuong-trinh-Ho-ly-Nhat-Ban.aspx">Chương trình hộ lý Nhật bản</a></li>
    </ul>
      
    <li><a >Ecolab</a>
        <%= ecolabhtml %>
    </li>
    <li><a href="<%= Newwind.VQS.URL %>/faq.aspx">Tư vấn - Hỏi đáp</a></li>
</ul>

