<%@ Control Language="C#" AutoEventWireup="true" CodeFile="POST_FAQ.ascx.cs" Inherits="Modules_Base_POST_FAQ" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 
<script type="text/javascript" src="Scripts/avim.js"></script>

   <asp:Panel ID="pnPost" runat="server">
Chọn kiểu gõ: <input id="hmweb_auto" onClick="setMethod(0);" checked="checked" name="type_method" type="radio">AUTO <input id="hmweb_telex" onClick="setMethod(1);" name="type_method" type="radio">TELEX <input id="hmweb_vni" onClick="setMethod(2);" name="type_method" type="radio">VNI <input id="hmweb_viqr" onClick="setMethod(3);" name="type_method" type="radio">VIQR
<br />
    <asp:DetailsView ID="dvPOST_FAQ" runat="server" DataSourceID="POST_FAQDataSource"
        DataKeyNames="PK_FEEDBACK" SkinID="FeedBack" 
        AutoGenerateRows="False" DefaultMode="Insert" OnItemCommand="dvPOST_FAQ_ItemCommand"
        Width="100%" HeaderText="Câu hỏi của bạn (Chọn TELEX để gõ được tiếng việt có dấu)" CaptionAlign="Top" 
        HorizontalAlign="Center" OnItemInserted="dvPOST_FAQ_ItemInserted" 
        OnItemInserting="dvPOST_FAQ_ItemInserting" GridLines="None" 
    onprerender="dvPOST_FAQ_PreRender">
        <Fields>
            <asp:TemplateField  HeaderText="Họ và tên (*)">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtSENDER_NAME" Width="250px" Text='<%# Bind("C_SENDER_NAME") %>' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSENDER_NAME" runat="server"  ErrorMessage="Bạn chưa nhập Họ và tên" ControlToValidate="txtSENDER_NAME" SetFocusOnError="True" ValidationGroup="vPOST_FAQG1" Display="Dynamic">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="E-mail (*)">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtSENDER_EMAIL" Width="250px" Text='<%# Bind("C_SENDER_EMAIL") %>' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSENDER_EMAIL" runat="server"  ErrorMessage="Bạn chưa nhập Email" ControlToValidate="txtSENDER_EMAIL" SetFocusOnError="True" ValidationGroup="vPOST_FAQG1" Display="Dynamic">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revSENDER_EMAIL" runat="server"  ErrorMessage="Sai định dạng Email" ControlToValidate="txtSENDER_EMAIL" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="vPOST_FAQG1" Display="Dynamic">*</asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
             <asp:TemplateField  HeaderText="Địa chỉ (*)">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_SENDER_ADDRESS" Width="250px" Text='<%# Bind("C_ADDRESS") %>' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvC_SENDER_ADDRESS" runat="server"  ErrorMessage="Bạn chưa nhập địa chỉ" ControlToValidate="txtC_SENDER_ADDRESS" SetFocusOnError="True" ValidationGroup="vPOST_FAQG1" Display="Dynamic">*</asp:RequiredFieldValidator>
                    
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
             <asp:TemplateField  HeaderText="Lĩnh vực">
                <InsertItemTemplate>
                    
                    <asp:DropDownList ID="ddlMenus" Width="256px" DataSourceID="FAQDataSource" DataTextField="C_NAME" SelectedValue='<%# Bind("FK_MENU") %>' DataValueField="PK_MENU" runat="server" >
                </asp:DropDownList>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>             
            
            <asp:TemplateField  HeaderText="Câu hỏi (*)" >
                <InsertItemTemplate>
                    <asp:TextBox ID="txtTITLE" Width="250px" TextMode="MultiLine" Columns="30" Height="100" Text='<%# Bind("C_TITLE") %>' runat="server"></asp:TextBox>
                    
                    <asp:RequiredFieldValidator ID="rfvTITLE" runat="server"  ErrorMessage="Bạn chưa nhập câu hỏi" ControlToValidate="txtTITLE" SetFocusOnError="True" ValidationGroup="vPOST_FAQG1" Display="Dynamic">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
           <%-- <asp:CommandField  ButtonType="Button" ValidationGroup="vPOST_FAQG1" ShowInsertButton="True">
                <ItemStyle HorizontalAlign="Center" />
            </asp:CommandField>--%>


             <asp:TemplateField ShowHeader="False">           
            <InsertItemTemplate>
               <div align="center">
                  <br />
                  <asp:Button ID="btnInsert" ValidationGroup="vFeedBackG1" runat="server" CommandName="Insert" Text="Gửi đi" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Làm lại" />
               </div>
            </InsertItemTemplate>
        </asp:TemplateField>


        </Fields>
    </asp:DetailsView>
    
    </asp:Panel>
    
    <asp:Panel ID="PnThank" runat="server" CssClass="caution" Height="50px" Width="100%"
        Visible="false">
        <%= CMS.Lang.GetKey("POST_FAQ.ascx", "Thank")%>
  </asp:Panel>
    <asp:ValidationSummary ID="vsPOST_FAQ" ValidationGroup="vPOST_FAQG1" ShowSummary="false"  HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="true" />  





<asp:SqlDataSource ID="POST_FAQDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    InsertCommand="INSERT INTO T_FAQ(FK_MENU,FK_LANG,C_ORDER,C_TITLE,C_CONTENT,C_SENDER_NAME,C_SENDER_EMAIL,C_ADDRESS,C_SENDER_DATE,C_STATUS,C_TYPE) 
                         VALUES(@FK_MENU,@FK_LANG,@C_ORDER,@C_TITLE,@C_CONTENT,@C_SENDER_NAME,@C_SENDER_EMAIL,@C_ADDRESS,GETDATE(),0,'FAQ')">
    <InsertParameters>
        <asp:Parameter Name="FK_LANG" />
         <asp:Parameter Name="FK_MENU" />
        <asp:Parameter Name="C_ORDER" />
        <asp:Parameter Name="C_TITLE" />
        <asp:Parameter Name="C_CONTENT" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_SENDER_NAME" />
        <asp:Parameter Name="C_SENDER_EMAIL" />
        <asp:Parameter Name="C_ADDRESS" />
        <asp:Parameter Name="C_TYPE" />
    </InsertParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="FAQDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT * FROM T_MENU where C_STATUS=1 and C_PARENT=283"   
    >
</asp:SqlDataSource>