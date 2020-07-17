<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Top1News.ascx.cs" Inherits="Modules_Base_Top1News" %>

<asp:DataList ID="dlTop1News" runat="server" Width="100%" CaptionAlign="Top" ItemStyle-HorizontalAlign="Justify">
    <ItemTemplate>
       
        <a href="<%# Newwind.VQS.GetURL("tin-tuc", Eval("C_TITLE").ToString(), Eval("PK_ARTICLE").ToString())%>"
            class="text_top1">
            <%# Eval("C_TITLE")%>
            <%= imgnew %>
            </a>
            
            
             <a class="ngayuptin">
                <%# Eval("C_ENTRY_DATE","{0:hh: mm, dd/MM/yyyy}")%>
            </a>
            
             <a href="<%# Newwind.VQS.GetURL("tin-tuc", Eval("C_TITLE").ToString(), Eval("PK_ARTICLE").ToString())%>">
            <%# CMS.TTV.Web.Utils.CreateLink(Eval("C_IMAGE_FILE_NAME"), 172, 0, 0, "img_top1new", true)%></a>
                      
            
                <%# Eval("C_HEAD")%>




    </ItemTemplate>
</asp:DataList>
