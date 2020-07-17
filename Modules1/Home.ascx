<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Home.ascx.cs" Inherits="Modules_Home" %>



<%@ Register Src="BDS/ListNewsArticles.ascx" TagName="ListNewsArticles" TagPrefix="uc1" %>

<%@ Register Src="Base/NewslideHome.ascx" TagName="NewslideHome" TagPrefix="uc1" %>


<style type="text/css">

.anhmobile {
    display: block;
    width: 100%;
    height: auto;
}
</style>
<div class="bg_title_cate" style="margin-bottom: 3px;">
<div class="title_cate">
    <a class="a_title_cate">Video 1111- Clip</a>
</div>
<div class="list_title_cate_right">
    <i class="fa fa-angle-right" aria-hidden="true"></i>
</div>
</div>

<div class="content_news_home">
    <div class="cacmohinh1">
        
            <asp:Repeater ID="dlVideo" runat="server" >
                <ItemTemplate>
                <div class="item_mohinh" style="text-align:center">
              <a href="<%# Newwind.VQS.GetURL("video", Eval("C_NAME").ToString(), Eval("PK_VIDEO")) %>">  <%# CMS.TTV.Web.Utils.CreateLink(Eval("C_IMAGE_FILE_NAME"), 0, 0, 0, "anhmobile", true)%></a>
                  <a href="<%# Newwind.VQS.GetURL("video", Eval("C_NAME").ToString(), Eval("PK_VIDEO")) %>"><%# Eval("C_NAME") %></a>
                </div>
                </ItemTemplate>
            </asp:Repeater>       
       
    </div>
    
        
</div>   
<div class="bg_title_cate" style="margin-bottom: 3px;">
<div class="title_cate">
    <a class="a_title_cate">TIN TỨC MỚI</a>
</div>
<div class="list_title_cate_right">
    <i class="fa fa-angle-right" aria-hidden="true"></i>
</div>
</div>
<div class="content_news_home">
    <uc1:NewslideHome ID="NewslideHome1" MenuID="356" runat="server" />
</div>
<uc1:ListNewsArticles ID="ListNewsArticles1" MenuID="356" runat="server" />
<script type="text/javascript">window.jQuery || document.write('<script src="<%= Newwind.VQS.URL %>/Scripts/newslide/jquery-1.8.1.min.js"><\/script>')</script>
<script type="text/javascript" src="<%= Newwind.VQS.URL %>/Scripts/newslide/vertical.news.slider.js"></script>