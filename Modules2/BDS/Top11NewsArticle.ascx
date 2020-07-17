<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Top11NewsArticle.ascx.cs" Inherits="Modules_BDS_Top11NewsArticle" %>
<%@ Register Src="../Base/Top1News.ascx" TagName="Top1News" TagPrefix="uc1" %>
<%@ Register Src="../Base/BArticles.ascx" TagName="BArticles" TagPrefix="uc2" %>


<div class="bg_title_cate">
<div class="title_cate">
    <div class="title_cate_ico"></div>
    <a class="a_title_cate"><%= Top1News1.Title %></a>
</div>
<div class="title_cate_right"></div>
<div class="list_title_cate_right">
    <%= listothercate %>
</div>
</div>

<div class="content_news_home">
    <div class="top1new">
        <uc1:Top1News ID="Top1News1" IsParent="true" runat="server" />
    </div>
    <div class="othernewshome">
        <uc2:BArticles ID="BArticles1" Count="5" Type="HOME" IsParent="true" runat="server" />
    </div>
</div>
<div class="viewmore">
    <img class="imgico_viewmore" src="<%= Newwind.VQS.URL %>/images/ico.jpg" width="6px" height="6px" />
    <a href="<%= Newwind.VQS.GetURL("tin-tucs", Top1News1.Title, Top1News1._iMenuID) %>" class="a_viewmore">Xem tiếp</a>
</div>


