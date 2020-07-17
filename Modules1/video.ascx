<%@ Control Language="C#" AutoEventWireup="true" CodeFile="video.ascx.cs" Inherits="Modules_video" %>
<div class="bg_title_cate" style="width: 100%;">
    <div class="title_cate">
        <div class="title_cate_ico">
        </div>
        <a class="a_title_cate">
            Video - Clip</a>
    </div>
    <div class="title_cate_right">
    </div>
</div>
<div class="img_24" style="margin-top: 10px;">

    <asp:Repeater ID="dlVideo" runat="server" >
                <ItemTemplate>
                
                <video width="100%"  controls autoplay><source src="<%# Replace(Eval("C_VIDEO_FILE_NAME")) %>" type="video/mp4" ></video>
                  <%-- <%# Eval("C_VIDEO_FILE_NAME") %>--%> <br />
                    <h3><a href="<%# Newwind.VQS.GetURL("video", Eval("C_NAME").ToString(), Eval("PK_VIDEO")) %>"><%# Eval("C_NAME") %></a></h3>
             
                </ItemTemplate>
            </asp:Repeater>     
    
</div>