<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Top1News.ascx.cs" Inherits="Modules_Base_Top1News" %>

<asp:DataList ID="dlTop1News" runat="server" Width="100%" CaptionAlign="Top" ItemStyle-HorizontalAlign="Justify">
    <ItemTemplate>
       <div class="list_news_home">
     
             <a class="box_image" href="<%# Newwind.VQS.GetURL("tin-tuc", Eval("C_TITLE").ToString(), Eval("PK_ARTICLE").ToString())%>">
            <%# CMS.TTV.Web.Utils.CreateLink(Eval("C_IMAGE_FILE_NAME"), 172, 0, 0, "img_top1new", true)%></a>
                 
                 <a href="<%# Newwind.VQS.GetURL("tin-tuc", Eval("C_TITLE").ToString(), Eval("PK_ARTICLE").ToString())%>"
            class="text_top1">
            <%# Eval("C_TITLE")%>
        <%--    <%= imgnew %>--%>
            </a>
           </div>
    </ItemTemplate>
</asp:DataList>
