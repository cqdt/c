<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FeedBack.ascx.cs" Inherits="Modules_Base_FeedBack" %>


               <asp:Panel ID="pnFeedBack1" runat="server">
<br />
    <asp:DetailsView ID="dvFeedBack" runat="server" DataSourceID="FeedBackDataSource"
        DataKeyNames="PK_FEEDBACK" GridLines="None"
        AutoGenerateRows="False" DefaultMode="Insert" OnItemCommand="dvFeedBack_ItemCommand"
        Width="100%" CaptionAlign="Top" HorizontalAlign="Center" OnItemInserted="dvFeedBack_ItemInserted">
        <Fields>
            <asp:TemplateField  HeaderText="Họ v&#224; t&#234;n (*)" HeaderStyle-CssClass="feedback">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtSENDER_NAME" Width="350px" Text='<%# Bind("C_SENDER_NAME") %>' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSENDER_NAME" runat="server"  ErrorMessage="Bạn chưa nhập Họ và tên" ControlToValidate="txtSENDER_NAME" SetFocusOnError="True" ValidationGroup="vFeedBackG1" Display="Dynamic">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="Địa chỉ(*)" HeaderStyle-CssClass="feedback">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtSENDER_ADDRESS" Width="350px" Text='<%# Bind("C_SENDER_ADDRESS") %>' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSENDER_ADDRESS" runat="server"  ErrorMessage="Bạn chưa nhập địa chỉ" ControlToValidate="txtSENDER_ADDRESS" SetFocusOnError="True" ValidationGroup="vFeedBackG1" Display="Dynamic">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="Tel(*)" HeaderStyle-CssClass="feedback">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtSENDER_TEL" Width="350px" Text='<%# Bind("C_SENDER_TEL") %>' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSENDER_TEL" runat="server"  ErrorMessage="Bạn chưa nhập điện thoại" ControlToValidate="txtSENDER_TEL" SetFocusOnError="True" ValidationGroup="vFeedBackG1" Display="Dynamic">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="E-mail (*)" HeaderStyle-CssClass="feedback">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtSENDER_EMAIL" Width="350px" Text='<%# Bind("C_SENDER_EMAIL") %>' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSENDER_EMAIL" runat="server"  ErrorMessage="Bạn chưa nhập Email" ControlToValidate="txtSENDER_EMAIL" SetFocusOnError="True" ValidationGroup="vFeedBackG1" Display="Dynamic">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revSENDER_EMAIL" runat="server"  ErrorMessage="Sai định dạng Email" ControlToValidate="txtSENDER_EMAIL" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="vFeedBackG1" Display="Dynamic">*</asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="Chủ đề (*)" HeaderStyle-CssClass="feedback">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtTITLE" Width="350px" Text='<%# Bind("C_TITLE") %>' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTITLE" runat="server"  ErrorMessage="Bạn chưa nhập Chủ đề" ControlToValidate="txtTITLE" SetFocusOnError="True" ValidationGroup="vFeedBackG1" Display="Dynamic">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="Nội dung (*)" HeaderStyle-CssClass="feedback">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtCONTENT" Width="350px" Text='<%# Bind("C_CONTENT") %>' TextMode="MultiLine" Columns="30" Height="100" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCONTENT" runat="server"  ErrorMessage="Bạn chưa nhập nội dung" ControlToValidate="txtCONTENT" SetFocusOnError="True" ValidationGroup="vFeedBackG1" Display="Dynamic">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:CommandField  ButtonType="Button" ValidationGroup="vFeedBackG1" ShowInsertButton="True">
                <ItemStyle HorizontalAlign="Center" />
            </asp:CommandField>
        </Fields>
        <HeaderStyle Font-Bold="False" />
    </asp:DetailsView>

   

</asp:Panel>
             
 <asp:Panel ID="pnFeedBack" runat="server" CssClass="caution" Height="50px" Width="100%"
        Visible="false">
        <%= CMS.Lang.GetKey("FeedBack.ascx", "Thank")%>
  </asp:Panel>
<asp:ValidationSummary ID="vsFeedBack" ValidationGroup="vFeedBackG1" ShowSummary="false"   HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="true" />  

<br />
<center>
   <%= CMS.Lang.GetKey("FeedBack.ascx", "Info")%>
</center>





<asp:SqlDataSource ID="FeedBackDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    InsertCommand="INSERT INTO T_FEEDBACK(C_SENDER_NAME,C_SENDER_ADDRESS,C_SENDER_TEL,C_SENDER_EMAIL,C_TITLE,C_CONTENT,C_SENDER_DATE) 
                         VALUES(@C_SENDER_NAME,@C_SENDER_ADDRESS,@C_SENDER_TEL,@C_SENDER_EMAIL,@C_TITLE,@C_CONTENT,GETDATE())">
    <InsertParameters>
        <asp:Parameter Name="C_SENDER_NAME" />
        <asp:Parameter Name="C_SENDER_ADDRESS" />
        <asp:Parameter Name="C_SENDER_TEL" />
        <asp:Parameter Name="C_SENDER_EMAIL" />
        <asp:Parameter Name="C_TITLE" />
        <asp:Parameter Name="C_CONTENT" />
    </InsertParameters>
</asp:SqlDataSource>