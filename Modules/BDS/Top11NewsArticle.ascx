<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Top11NewsArticle.ascx.cs" Inherits="Modules_BDS_Top11NewsArticle" %>
<%@ Register Src="../Base/Top1News.ascx" TagName="Top1News" TagPrefix="uc1" %>
<%@ Register Src="../Base/BArticles.ascx" TagName="BArticles" TagPrefix="uc2" %>


<div class="bg_title_cate88 11">
<div class="title_cate">
    <a class="a_title_cate"><%= Top1News1.Title %></a>
    
    
</div>
<%--<div class="title_cate_right">  <a>Tin tức - Sự kiện</a> &nbsp;&nbsp;&nbsp;&nbsp; <a>Thông báo</a></div>--%>
<div class="title_cate_right">  <%=listothercate%> </div>
</div>

<div class="content_news_home1">
    <div class="top1new">
        <uc1:Top1News ID="Top1News1" IsParent="true" runat="server" />
    </div>
    <div class="othernewshome">
        <uc2:BArticles ID="BArticles1" Count="5" Type="HOME" IsParent="true" runat="server" />
    </div>
</div>



