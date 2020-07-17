<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Home.ascx.cs" Inherits="Modules_Home" %>

<%@ Register Src="BDS/ListNewsArticles.ascx" TagName="ListNewsArticles" TagPrefix="uc1" %>
<%--<%@ Register Src="Base/Top1News.ascx" TagName="Top1News" TagPrefix="uc1" %>
<%@ Register Src="Base/BArticles.ascx" TagName="BArticles" TagPrefix="uc2" %>--%>
<%@ Register Src="Base/NewslideHome.ascx" TagName="NewslideHome" TagPrefix="uc1" %>

<div class="bg_title_cate">
<div class="title_cate">
    <div class="title_cate_ico"></div>
    <a class="a_title_cate" href="<%= Newwind.VQS.URL %>/tin-tucs/275/tin-noi-bat.aspx">tin nổi bật</a>
</div>
<div class="title_cate_right"></div>
</div>

<div class="content_news_home">
    <uc1:NewslideHome ID="NewslideHome1" MenuID="356" runat="server" />
</div>



<uc1:ListNewsArticles ID="ListNewsArticles1" MenuID="356" runat="server" />



<script type="text/javascript">window.jQuery || document.write('<script src="<%= Newwind.VQS.URL %>/Scripts/newslide/jquery-1.8.1.min.js"><\/script>')</script>
<script type="text/javascript" src="<%= Newwind.VQS.URL %>/Scripts/newslide/vertical.news.slider.js"></script>