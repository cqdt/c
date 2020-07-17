<%@ Control Language="C#" AutoEventWireup="true" Inherits="CMS.TTV.Admin.GImages" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 


<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>

<asp:GridView ID="gvGImages"  Width="100%" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="20" AllowSorting="false" OnPageIndexChanging="gvGImages_PageIndexChanging">
    <Columns>
        <asp:TemplateField>
           <ItemTemplate>
             <input name="chkGImages" class="checkbox" type="checkbox" value="<%# Eval("DirName") %>" />
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Sửa" >
           <ItemTemplate>
              <a href="Default.aspx?ctl=GImage&iID=<%# Eval("DirName") %>"><img src="Images/Edit.png" border="0" alt="" /></a>
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="T&#234;n nhóm">
           <ItemTemplate>
              <a class="Link" href="Default.aspx?ctl=GImage&iID=<%# Eval("DirName") %>"><%# Eval("DirName")%></a>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngày tạo">
           <ItemTemplate>
              <%# Eval("DirDate", "{0:dd/MM/yyyy}")%>
           </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>


<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkGImages" runat="server" />


<center>
   <asp:Button ID="btnInsert" runat="server" Text="Thêm mới" OnClick="btnInsert_Click"  />
   &nbsp; &nbsp;&nbsp;
   <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
</center>