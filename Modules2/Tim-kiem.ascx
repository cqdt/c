<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Tim-kiem.ascx.cs" Inherits="Modules_Tim_kiem" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %>

<%@ Register Src="Base/Articles.ascx" TagName="Articles" TagPrefix="uc1" %>



<div class="bg_title_cate">
<div class="title_cate">
    <div class="title_cate_ico"></div>
    <a class="a_title_cate">Kết quả tìm kiếm</a>
</div>    
<div class="title_cate_right"></div>
</div>


<div class="img_24">
   
     <uc1:Articles ID="Articles1" runat="server" />
     
</div>





        
    