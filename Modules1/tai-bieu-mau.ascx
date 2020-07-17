<%@ Control Language="C#" AutoEventWireup="true" CodeFile="tai-bieu-mau.ascx.cs" Inherits="Modules_tai_bieu_mau" %>
<%@ Register Src="Base/BArticles.ascx" TagName="BArticles" TagPrefix="uc3" %>
<%@ Register Src="Base/Articles.ascx" TagName="Articles" TagPrefix="uc1" %>




<div class="bg_title_cate">
<div class="title_cate">
    <a class="a_title_cate"><%= Articles1.Title %></a>
</div>

</div>


<div class="img_24">
    <uc1:Articles ID="Articles1" Type="VBLQ" IsParent="true" OnPageIndexChange="Articles1_PageIndexChange" Rows="20" runat="server" /> 
<div class="tinkhac">Tin khác</div>
<div class="khung_tinkhac">
<uc3:BArticles ID="BArticles1" Count="10" runat="server"/> </div>
</div>
