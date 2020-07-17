<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MenuTop.ascx.cs" Inherits="Modules_Controls_MenuTop" %>
<%@ Register Src="Search.ascx" TagName="Search" TagPrefix="uc10" %>


<ul class="sf-menu">
    <li><div class="bg_home"><a class="a_menutop_home" href="<%= Newwind.VQS.URL %>">Trang chủ</a></div></li>
    <li><a class="a_menutop">Giới thiệu</a>
         <%= drophtml %>
    </li>
    <li><a class="a_menutop" href="<%= Newwind.VQS.URL %>/van-ban-lien-quan.aspx">Văn bản liên quan</a></li> 
    <li><a class="a_menutop" href="<%= Newwind.VQS.URL %>/tai-bieu-mau.aspx">Tải biểu mẫu</a></li>  
    <li><a class="a_menutop">Ecolab</a>
        <%= ecolabhtml %>
    </li>
    <li><a class="a_menutop" href="<%= Newwind.VQS.URL %>/faq.aspx">Tư vấn - Hỏi đáp</a></li>
</ul>

<div class="bg_search">
    <uc10:Search ID="Search1" runat="server" />
</div>
<%--<div class="thongtinchung">
    <a class="a_thongtinchung" href="<%= Newwind.VQS.URL %>/tin-tucs/275/thong-tin-chung.aspx">Thông tin chung</a>
</div>
--%>

