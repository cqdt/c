<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Home.ascx.cs" Inherits="Modules_Home" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %>
<%@ Register Src="BDS/ListNewsArticles.ascx" TagName="ListNewsArticles" TagPrefix="uc1" %>
<%--<%@ Register Src="Base/Top1News.ascx" TagName="Top1News" TagPrefix="uc1" %>
<%@ Register Src="Base/BArticles.ascx" TagName="BArticles" TagPrefix="uc2" %>--%>
<%@ Register Src="Base/NewslideHome.ascx" TagName="NewslideHome" TagPrefix="uc1" %>
<div class="content_news_home slide_news">
    <uc1:NewslideHome ID="NewslideHome1" MenuID="356" runat="server" />
</div>
<div class="banner_ad">
    <a href="">
       <%=bannergiua %>
    </a>
</div>
<div class="bg_title_catevideo">
<div class="title_cate">
    <a class="a_title_cate">Video - Clip</a>
</div>
</div>

<div class="content_news_home">
    <div class="cacmohinh">
        
            <asp:Repeater ID="dlVideo" runat="server" >
                <ItemTemplate>
                <div class="item_mohinh">
               <%# CMS.TTV.Web.Utils.CreateLink(Eval("C_IMAGE_FILE_NAME"), 200, 120, 0, "cms_images", true)%>
                    <h3><a href="<%# Newwind.VQS.GetURL("video", Eval("C_NAME").ToString(), Eval("PK_VIDEO")) %>"><%# Eval("C_NAME") %></a></h3>
                </div>
                </ItemTemplate>
            </asp:Repeater>       
       
    </div>
    
        
</div>   
<uc1:ListNewsArticles ID="ListNewsArticles1" MenuID="356" runat="server" />
<script type="text/javascript">window.jQuery || document.write('<script src="<%= Newwind.VQS.URL %>/Scripts/newslide/jquery-1.8.1.min.js"><\/script>')</script>
<script type="text/javascript" src="<%= Newwind.VQS.URL %>/Scripts/newslide/vertical.news.slider.js"></script>