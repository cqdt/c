<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FeedBacks.ascx.cs" Inherits="Admin_Modules_FeedBacks" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 


<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>

<asp:GridView id="gvFeedBacks" runat="server"  DataSourceID="FeedBacksDataSource" DataKeyNames="PK_FEEDBACK"
    AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" Width="100%" >
    <Columns>
       <asp:TemplateField>
           <ItemTemplate>
             <input name="chkFeedBacks" class="checkbox" type="checkbox" value="<%# Eval("PK_FEEDBACK") %>" />
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Trả lời">
            <ItemTemplate>
                 <a href="Default.aspx?ctl=SendMail&M=FeedBacks&Page=<%= gvFeedBacks.PageIndex %>&Email=<%# Eval("C_SENDER_EMAIL") %>"><img src="Images/feedback.gif" style="border:0"  alt="" /></a>
            </ItemTemplate>
            <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Xem">
            <ItemTemplate>
                 <a href="Default.aspx?ctl=FeedBack&Page=<%= gvFeedBacks.PageIndex %>&fID=<%# Eval("PK_FEEDBACK") %>"><img src="Images/View.png" style="border:0"  alt="" /></a>
            </ItemTemplate>
            <ItemStyle Width="30px" />
        </asp:TemplateField> 
        <asp:BoundField DataField="C_TITLE" HeaderText="Chủ đề" SortExpression="C_TITLE"></asp:BoundField>
        <asp:BoundField DataField="C_SENDER_NAME" HeaderText="Họ và tên" SortExpression="C_SENDER_NAME"></asp:BoundField>
        <asp:BoundField DataField="C_SENDER_TEL" HeaderText="Tel" SortExpression="C_SENDER_TEL"></asp:BoundField>
        <asp:BoundField DataField="C_SENDER_EMAIL" HeaderText="Email" SortExpression="C_SENDER_EMAIL"></asp:BoundField>
        <asp:BoundField HtmlEncode="False" DataFormatString="{0:dd/MM/yyyy}"  DataField="C_SENDER_DATE" SortExpression="C_SENDER_DATE" HeaderText="Ng&#224;y gửi"></asp:BoundField>
        <asp:TemplateField HeaderText="Trạng th&#225;i" SortExpression="C_STATUS">
           <ItemTemplate>
              <CMS:Status ID="Status1" ActiveText="Đã đọc" InActiveText="Chưa đọc" Value='<%# Eval("C_STATUS") %>' runat="server"></CMS:Status>
           </ItemTemplate>
           <ItemStyle Width="70px" />
        </asp:TemplateField>
     </Columns>
</asp:GridView>


<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkFeedBacks" runat="server" />
  
<center>
   <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
</center>


<asp:SqlDataSource ID="FeedBacksDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT T_FEEDBACK.*,(SELECT COUNT(FK_FEEDBACK) FROM T_FEEDBACK_USER WHERE FK_FEEDBACK=T_FEEDBACK.PK_FEEDBACK AND FK_USER=@FK_USER) AS 'C_STATUS' FROM [T_FEEDBACK] ORDER BY [C_SENDER_DATE] DESC">
    <SelectParameters>
       <asp:Parameter Name="FK_USER" Type="int32" />
    </SelectParameters>
</asp:SqlDataSource>