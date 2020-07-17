<%@ Control Language="C#" AutoEventWireup="true" Inherits="CMS.TTV.Admin.Images" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 


<center>
    <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>


 Thư mục :
 <asp:DropDownList ID="ddlDir" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDir_SelectedIndexChanged">
 </asp:DropDownList>


<asp:GridView id="gvImages" runat="server" AutoGenerateColumns="False" PageSize="20" AllowPaging="True" OnPageIndexChanging="gvImages_PageIndexChanging"  >
    <Columns>
        <asp:TemplateField>
           <ItemTemplate>
             <input name="chkImages" class="checkbox" type="checkbox" value="<%# CMS.CryptoString.Encrypt(Eval("FileNameFull").ToString()) %>" />
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ảnh">
           <ItemTemplate>
							 <a href="../ViewImg.aspx?img=<%# CMS.CryptoString.Encrypt(Eval("FileNameFull").ToString()) %>" target="_blank"><%# CMS.TTV.Web.Utils.CreateLink(Eval("FileNameFull"),50,50,0,"",false) %></a>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="FileName" SortExpression="FileName" HeaderText="T&#234;n file"></asp:BoundField>
        <asp:BoundField DataField="FileSize" SortExpression="FileSize" HeaderText="Dung lượng" DataFormatString="{0:#,##0.00} KB" HtmlEncode="False"></asp:BoundField>
        <asp:BoundField HtmlEncode="False" DataFormatString="{0:dd/MM/yyyy}" DataField="FileDate" SortExpression="FileDate" HeaderText="Ng&#224;y"></asp:BoundField>
    </Columns>
</asp:GridView>


<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkImages" runat="server" />


<center>
   <asp:Button ID="btnInsert" runat="server" Text="Thêm mới" OnClick="btnInsert_Click"  />
   &nbsp; &nbsp;&nbsp;
   <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
</center>