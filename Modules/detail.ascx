<%@ Control Language="C#" AutoEventWireup="true" CodeFile="detail.ascx.cs" Inherits="Modules_detail" %>
<%@ Register Src="Base/BArticles.ascx" TagName="BArticles" TagPrefix="uc2" %>
<%@ Register Src="Base/Article.ascx" TagName="Article" TagPrefix="uc1" %>
<div class="bg_title_cate">
    <div class="title_cate">
        <div class="title_cate_ico">
        </div>
        <a class="a_title_cate">
            <%= Article1.MenuTitle%></a>
    </div>
    <div class="title_cate_right">
    </div>
</div>
<div class="img_24">
    <uc1:Article ID="Article1" runat="server" />
    
</div>