<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Tin-tuc.ascx.cs" Inherits="Modules_Tin_tuc" %>
<%@ Register Src="Base/BArticles.ascx" TagName="BArticles" TagPrefix="uc2" %>
<%@ Register Src="Base/Article.ascx" TagName="Article" TagPrefix="uc1" %>
<div class="bg_title_cate">
    <div class="title_cate">
        <a class="a_title_cate">
            <%= Article1.MenuTitle%></a>
    </div>
</div>
<div class="img_24">
    <uc1:Article ID="Article1" runat="server" />
    <div class="tinkhac">
        Tin khác
    </div>
    <div class="khung_tinkhac">
        <uc2:BArticles ID="BArticles1" Count="10" runat="server" />
    </div>
</div>
