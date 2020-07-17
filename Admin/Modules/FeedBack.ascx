<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FeedBack.ascx.cs" Inherits="Admin_Modules_FeedBack" %>


<asp:DetailsView id="dvFeedBack" runat="server" DataSourceID="FeedBackDataSource" 
     AutoGenerateRows="False" DataKeyNames="PK_FEEDBACK"  Width="100%" 
     DefaultMode="ReadOnly" HorizontalAlign="Center" HeaderText="Thông tin liên hệ" OnItemCommand="dvFeedBack_ItemCommand" >
    <Fields>
        <asp:TemplateField HeaderText="Họ và tên">
            <ItemTemplate>
               <%# Eval("C_SENDER_NAME") %>
            </ItemTemplate>
            <HeaderStyle Width="200px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Địa chỉ">
            <ItemTemplate>
               <%# Eval("C_SENDER_ADDRESS")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Tel">
            <ItemTemplate>
               <%# Eval("C_SENDER_TEL")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Email">
            <ItemTemplate>
               <%# Eval("C_SENDER_EMAIL")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Chủ đề">
            <ItemTemplate>
               <%# Eval("C_TITLE")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Nội dung">
            <ItemTemplate>
               <%# Eval("C_CONTENT")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngày gửi">
            <ItemTemplate>
               <%# Eval("C_SENDER_DATE","{0:dd/MM/yyyy}")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
               <div align="center">
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
             </div>
            </ItemTemplate>
       </asp:TemplateField>
    </Fields>
</asp:DetailsView> 

     
<asp:SqlDataSource ID="FeedBackDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT * FROM [T_FEEDBACK] WHERE [PK_FEEDBACK]=@PK_FEEDBACK"   
    >
   <SelectParameters>
     <asp:QueryStringParameter Name="PK_FEEDBACK" QueryStringField="fID" DefaultValue="0" Type="Int32" />
   </SelectParameters>
</asp:SqlDataSource>