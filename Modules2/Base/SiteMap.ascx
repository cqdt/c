<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SiteMap.ascx.cs" Inherits="Modules_Base_SiteMap" %>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <div id="about">
      &nbsp;&nbsp;&nbsp;&nbsp;  <%= CMS.Lang.GetKey("SiteMap.ascx", "Text_SiteMap")%>
      </div>
    </td>
  </tr>
  <tr>
    <td>
      <asp:TreeView ID="tvMenu" runat="server" ImageSet="BulletedList4">
    <Nodes>
        <asp:TreeNode Text="MENU" Value="MENU" >
            <asp:TreeNode NavigateUrl="~/Default.aspx" Text="TRANG CHỦ" Value="TRANG CHỦ" Expanded="False"></asp:TreeNode>
            <asp:TreeNode NavigateUrl="~/Default.aspx?ctl=Introduce" Text="GIỚI THIỆU" Value="GIỚI THIỆU" Expanded="False"></asp:TreeNode>
            <asp:TreeNode Text="SẢN PHẨM" Value="SẢN PHẨM" Expanded="False" NavigateUrl="~/Default.aspx?ct=Products">
            </asp:TreeNode>
            <asp:TreeNode Text="LI&#202;N HỆ" Value="LI&#202;N HỆ" Expanded="False" NavigateUrl="~/Default.aspx?ctl=FeedBack"></asp:TreeNode>
            <asp:TreeNode NavigateUrl="~/Default.aspx?ctl=Sitemap" Text="Site Map" Value="Site Map"></asp:TreeNode>
        </asp:TreeNode>
    </Nodes>
    <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
    <ParentNodeStyle Font-Bold="False" />
    <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
    <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px" VerticalPadding="0px" />
</asp:TreeView>

    </td>
  </tr>
  <tr>
    <td>
      &nbsp;</td>
  </tr>
</table>


