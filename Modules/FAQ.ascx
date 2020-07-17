<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FAQ.ascx.cs" Inherits="Modules_FAQ" %>
<%@ Register Src="Base/POST_FAQ.ascx" TagName="POST_FAQ" TagPrefix="uc2" %>
<%@ Register Src="Base/FAQ.ascx" TagName="FAQ" TagPrefix="uc1" %>
<%@ Register Src="Controls/Search-hd.ascx" TagName="Search" TagPrefix="uc3" %>
<div class="bg_title_cate">
    <div class="title_cate">
        <div class="title_cate_ico">
        </div>
        <a class="a_title_cate">Tư vấn - Hỏi đáp</a>
    </div>
    <div class="title_cate_right">
    </div>
</div>
<div class="img_24">
    <div class="timhoidap">
        <uc3:Search ID="searchhd" runat="server" Type="FAQ" />
    </div>
    <div class="timhoidap">
        <uc1:FAQ ID="FAQ1" runat="server" Type="FAQ" />
    </div>
    <div class="timhoidap">
        <uc2:POST_FAQ ID="POST_FAQ1" runat="server" />
    </div>
</div> 