<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FAQ.ascx.cs" Inherits="Admin_Modules_FAQ" %>
<%@ Register Assembly="RadEditor.Net2" Namespace="Telerik.WebControls" TagPrefix="radE" %>



<asp:DetailsView id="dvFAQ" runat="server" DataSourceID="FAQDataSource" 
     AutoGenerateRows="False" DataKeyNames="PK_FAQ"  Width="100%" 
     DefaultMode="Insert" HorizontalAlign="Center" 
    HeaderText="Thêm mới câu hỏi" OnItemCommand="dvFAQ_ItemCommand" 
    OnItemInserted="dvFAQ_ItemInserted" OnItemInserting="dvFAQ_ItemInserting" 
    OnItemUpdated="dvFAQ_ItemUpdated" OnItemUpdating="dvFAQ_ItemUpdating" 
    onprerender="dvFAQ_PreRender">
    <Fields>
       <asp:TemplateField HeaderText="Ng&#244;n ngữ hiển thị">
            <EditItemTemplate>
                <asp:DropDownList ID="ddlLang" SelectedValue='<%# Bind("FK_LANG") %>' DataSourceID="LangDataSource" DataTextField="C_TITLE" DataValueField="PK_LANG" runat="server">
                </asp:DropDownList>            
            </EditItemTemplate>
           
            <InsertItemTemplate>
                <asp:DropDownList ID="ddlLang" SelectedValue='<%# Bind("FK_LANG") %>' DataSourceID="LangDataSource" DataTextField="C_TITLE" DataValueField="PK_LANG" runat="server">
                </asp:DropDownList>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Kiểu">
            <EditItemTemplate>
							<asp:DropDownList ID="ddlType" SelectedValue='<%# Bind("C_TYPE") %>' runat="server">
							 <asp:ListItem Text="Hỏi đáp" Value="FAQ"></asp:ListItem>
						     <asp:ListItem Text="Tư vấn" Value="Consulting"></asp:ListItem>						   
							</asp:DropDownList>
            </EditItemTemplate>
            <InsertItemTemplate>
							<asp:DropDownList ID="ddlType" SelectedValue='<%# Bind("C_TYPE") %>' runat="server">
							     <asp:ListItem Text="Hỏi đáp" Value="FAQ"></asp:ListItem>
						     <asp:ListItem Text="Tư vấn" Value="Consulting"></asp:ListItem>							    
							</asp:DropDownList>
					  </InsertItemTemplate>
        </asp:TemplateField>
          <asp:TemplateField  HeaderText="Lĩnh vực">
                <InsertItemTemplate>                    
                    <asp:DropDownList ID="ddlMenus" DataSourceID="FAQ1DataSource" DataTextField="C_NAME" SelectedValue='<%# Bind("FK_MENU") %>' DataValueField="PK_MENU" runat="server" >
                </asp:DropDownList>
                </InsertItemTemplate>
                 <EditItemTemplate>
                   <asp:DropDownList ID="ddlMenus" DataSourceID="FAQ1DataSource" DataTextField="C_NAME" SelectedValue='<%# Bind("FK_MENU") %>' DataValueField="PK_MENU" runat="server" >
                </asp:DropDownList>
                 </EditItemTemplate>
                
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>   
        <asp:TemplateField HeaderText="C&#226;u hỏi">
            <EditItemTemplate>
               <radE:RadEditor ID="radeTitle" Html='<%# Bind("C_TITLE") %>' Width="90%" Height="250px" runat="server" EnableHtmlIndentation="True" ShowSubmitCancelButtons="False" Skin="Default2006" ToolbarMode="Default" AllowThumbGeneration="True" DeleteDocumentsPaths="~/uploads/Doc/" DeleteFlashPaths="~/uploads/Flash/" DeleteImagesPaths="~/uploads/News/" DeleteMediaPaths="~/uploads/Media/" DocumentsPaths="~/uploads/Doc/" FlashPaths="~/uploads/Flash/" ImagesPaths="~/uploads/News/" MediaPaths="~/uploads/Media/" UploadDocumentsPaths="~/uploads/Doc/" UploadFlashPaths="~/uploads/Flash/" UploadImagesPaths="~/uploads/News/" UploadMediaPaths="~/uploads/Media/" DocumentsFilters="*.doc,*.xls,*.ppt,*.txt">
               </radE:RadEditor>
               <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="T&#234;n câu hỏi không thể rỗng" ControlToValidate="radeTitle" SetFocusOnError="True" ValidationGroup="vFAQG1" Display="Dynamic">*</asp:RequiredFieldValidator>
<%--               <asp:CustomValidator ID="cvTitle" ControlToValidate="txtTitle" OnServerValidate="CheckTitle" runat="server" ErrorMessage="Tên câu hỏi đã tồn tại" ValidationGroup="vFAQG1" Display="Dynamic">Tên câu hỏi đã tồn tại</asp:CustomValidator>
--%>            </EditItemTemplate>
            <InsertItemTemplate>
               <radE:RadEditor ID="radeTitle" Html='<%# Bind("C_TITLE") %>' Width="90%" Height="250px" runat="server" EnableHtmlIndentation="True" ShowSubmitCancelButtons="False" Skin="Default2006" ToolbarMode="Default" AllowThumbGeneration="True" DeleteDocumentsPaths="~/uploads/Doc/" DeleteFlashPaths="~/uploads/Flash/" DeleteImagesPaths="~/uploads/News/" DeleteMediaPaths="~/uploads/Media/" DocumentsPaths="~/uploads/Doc/" FlashPaths="~/uploads/Flash/" ImagesPaths="~/uploads/News/" MediaPaths="~/uploads/Media/" UploadDocumentsPaths="~/uploads/Doc/" UploadFlashPaths="~/uploads/Flash/" UploadImagesPaths="~/uploads/News/" UploadMediaPaths="~/uploads/Media/" DocumentsFilters="*.doc,*.xls,*.ppt,*.txt">
               </radE:RadEditor>
               <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="Tên câu hỏi không thể rỗng" ControlToValidate="radeTitle" SetFocusOnError="True" ValidationGroup="vFAQG1" Display="Dynamic">*</asp:RequiredFieldValidator>
<%--               <asp:CustomValidator ID="cvTitle" ControlToValidate="txtTitle" OnServerValidate="CheckTitle" runat="server" ErrorMessage="Tên câu hỏi đã tồn tại" ValidationGroup="vFAQG1" Display="Dynamic">Tên câu hỏi đã tồn tại</asp:CustomValidator>
--%>            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="C&#226;u trả lời">
        <EditItemTemplate>
               <radE:RadEditor ID="radeContent" Html='<%# Bind("C_CONTENT") %>' Width="90%" Height="500px" runat="server" EnableHtmlIndentation="True" ShowSubmitCancelButtons="False" Skin="Default2006" ToolbarMode="Default" AllowThumbGeneration="True" DeleteDocumentsPaths="~/uploads/" DeleteFlashPaths="~/uploads/" DeleteImagesPaths="~/uploads/" DeleteMediaPaths="~/uploads/" DocumentsPaths="~/uploads/" FlashPaths="~/uploads/" ImagesPaths="~/uploads/" MediaPaths="~/uploads/" UploadDocumentsPaths="~/uploads/" UploadFlashPaths="~/uploads/" UploadImagesPaths="~/uploads/" UploadMediaPaths="~/uploads/" DocumentsFilters="*.doc,*.xls,*.ppt,*.txt,*.pdf" MaxImageSize="10240000" MaxDocumentSize="10240000" MaxFlashSize="10240000">
               </radE:RadEditor>               
            </EditItemTemplate>
            <InsertItemTemplate>
               <radE:RadEditor ID="radeContent" Html='<%# Bind("C_CONTENT") %>' Width="90%" Height="500px" runat="server" EnableHtmlIndentation="True" ShowSubmitCancelButtons="False" Skin="Default2006" ToolbarMode="Default" AllowThumbGeneration="True" DeleteDocumentsPaths="~/uploads/" DeleteFlashPaths="~/uploads/" DeleteImagesPaths="~/uploads/" DeleteMediaPaths="~/uploads/" DocumentsPaths="~/uploads/" FlashPaths="~/uploads/" ImagesPaths="~/uploads/" MediaPaths="~/uploads/" UploadDocumentsPaths="~/uploads/" UploadFlashPaths="~/uploads/" UploadImagesPaths="~/uploads/" UploadMediaPaths="~/uploads/" DocumentsFilters="*.doc,*.xls,*.ppt,*.txt,*.pdf" MaxImageSize="10240000" MaxDocumentSize="10240000" MaxFlashSize="10240000">
               </radE:RadEditor>               
            </InsertItemTemplate>
                        
          
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Trạng th&#225;i">
            <EditItemTemplate>
               <asp:RadioButtonList ID="rblStatus" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_STATUS") %>'>
                     <asp:ListItem Text="Đã duyệt" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Chờ duyệt" Value="0"></asp:ListItem>
               </asp:RadioButtonList>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:RadioButtonList ID="rblStatus" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_STATUS") %>'>
                     <asp:ListItem Text="Đã duyệt" Selected="True" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Chờ duyệt" Value="0"></asp:ListItem>
               </asp:RadioButtonList>
            </InsertItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
               <div align="center">
                  <br />
                  <asp:Button ID="btnUpdate" ValidationGroup="vFAQG1" runat="server" CommandName="Update" Text="Sửa đổi" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </EditItemTemplate>
            <InsertItemTemplate>
               <div align="center">
                  <br />
                  <asp:Button ID="btnInsert" ValidationGroup="vFAQG1" runat="server" CommandName="Insert" Text="Th&#234;m mới" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </InsertItemTemplate>
        </asp:TemplateField>
    </Fields>
</asp:DetailsView> 
<asp:ValidationSummary ID="vsFAQ" ValidationGroup="vFAQG1" ShowSummary="false" HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="true" />  

     <script runat="server">
         
         protected void dvFAQ_PreRender(object sender, EventArgs e)
    {
        Telerik.WebControls.RadEditor radeTitle = dvFAQ.FindControl("radeTitle") as Telerik.WebControls.RadEditor;
        Telerik.WebControls.RadEditor radeContent = dvFAQ.FindControl("radeContent") as Telerik.WebControls.RadEditor;

        if (Request.Browser.Browser.ToLowerInvariant() == "firefox")
        {
            System.Reflection.FieldInfo browserCheckedField = typeof(RadEditor).GetField("_browserCapabilitiesRetrieved", System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.NonPublic);
            browserCheckedField.SetValue(radeContent, true);
            browserCheckedField.SetValue(radeTitle, true);
            System.Reflection.FieldInfo browserSupportedField = typeof(RadEditor).GetField("_isSupportedBrowser", System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.NonPublic);
            browserSupportedField.SetValue(radeContent, true);
            browserSupportedField.SetValue(radeTitle, true);
        }

         

    }

                
</script>
<asp:SqlDataSource ID="FAQDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_FAQ,FK_LANG,FK_MENU,C_TITLE,C_CONTENT,C_TYPE,CONVERT(INT,C_STATUS) AS 'C_STATUS' FROM T_FAQ WHERE PK_FAQ=@PK_FAQ"   
   InsertCommand="INSERT INTO T_FAQ(FK_MENU,FK_LANG,C_TITLE,C_CONTENT,C_ORDER,C_STATUS,C_TYPE) 
                              VALUES(@FK_MENU,@FK_LANG,@C_TITLE,@C_CONTENT,@C_ORDER,@C_STATUS,@C_TYPE)" 
   UpdateCommand="UPDATE T_FAQ SET FK_MENU=@FK_MENU,FK_LANG=@FK_LANG,C_TITLE=@C_TITLE,C_CONTENT=@C_CONTENT,C_TYPE=@C_TYPE,C_ORDER=ISNULL(@C_ORDER,C_ORDER),C_STATUS=@C_STATUS WHERE PK_FAQ=@PK_FAQ">
   <SelectParameters>
     <asp:QueryStringParameter Name="PK_FAQ" QueryStringField="fID" DefaultValue="0" Type="Int32" />
   </SelectParameters>
   <InsertParameters>
     <asp:Parameter Name="FK_LANG" Type="Int32"/>
     <asp:Parameter Name="FK_MENU" Type="Int32"/>
     <asp:Parameter Name="C_TITLE" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_CONTENT" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_TYPE" ConvertEmptyStringToNull="false" Type="String"/>
     
     <asp:Parameter Name="C_ORDER" Type="Int32"/>
     <asp:Parameter Name="C_STATUS" Type="Int32"/>
   </InsertParameters>
   <UpdateParameters>
   <asp:Parameter Name="FK_MENU" Type="Int32"/>
     <asp:Parameter Name="PK_FAQ" Type="Int32" />
     <asp:Parameter Name="FK_LANG" Type="Int32"/>
     <asp:Parameter Name="C_TITLE" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_CONTENT" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_TYPE" ConvertEmptyStringToNull="false" Type="String"/>
     
     <asp:Parameter Name="C_ORDER" Type="Int32"/>
     <asp:Parameter Name="C_STATUS" Type="Int32"/>
   </UpdateParameters>
</asp:SqlDataSource>


<asp:SqlDataSource ID="LangDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_LANG,C_TITLE FROM T_LANG">
</asp:SqlDataSource>

<asp:SqlDataSource ID="FAQ1DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT * FROM T_MENU where C_STATUS=1 and C_PARENT=283"   
    ></asp:SqlDataSource>
