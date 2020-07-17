<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MenuTop.ascx.cs" Inherits="Modules_Controls_MenuTop" %>
<%@ Register Src="Search.ascx" TagName="Search" TagPrefix="uc10" %>


<ul class="sf-menu">
    <li style="margin-top: 0px;"><div class="bg_home"><a class="a_menutop_home" href="<%= Newwind.VQS.URL %>" style="padding-top:1px">Trang chủ</a></div>
     <%=menungang(450) %>
    </li>
    <li><a class="a_menutop">Giới thiệu</a>
    
        <%=menungang(1) %>
    </li>
     <li><a class="a_menutop">Các chương trình</a>
         <%=menungang(321) %>
    </li>
    
    <li><a class="a_menutop" href="<%= Newwind.VQS.URL %>/van-ban-lien-quan.aspx">Văn bản liên quan</a>
    <%=menungang(231) %>
    </li> 
    <li><a class="a_menutop" href="<%= Newwind.VQS.URL %>/tai-bieu-mau.aspx">Tải biểu mẫu</a>
       <%=menungang(320) %>
    </li>  
    <li><a class="a_menutop">Ecolab</a>
      <%=menungang(379) %>
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

