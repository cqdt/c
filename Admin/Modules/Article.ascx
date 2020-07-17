<%@ Control Language="C#" AutoEventWireup="true" Inherits="CMS.TTV.Admin.Article" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<%@ Register Assembly="RadEditor.Net2" Namespace="Telerik.WebControls" TagPrefix="radE" %>
      
<asp:DetailsView id="dvArticle" runat="server" DataSourceID="ArticleDataSource" 
     AutoGenerateRows="False" DataKeyNames="PK_ARTICLE"  Width="100%" 
     DefaultMode="Insert" HorizontalAlign="Center" HeaderText="Thêm mới tin bài" OnItemCommand="dvArticle_ItemCommand" OnItemInserted="dvArticle_ItemInserted" 
     OnItemInserting="dvArticle_ItemInserting" OnItemUpdated="dvArticle_ItemUpdated" OnItemUpdating="dvArticle_ItemUpdating" OnPreRender="dvArticle_PreRender">
    <Fields>
        <asp:TemplateField HeaderText="Thuộc chuy&#234;n mục">
            <EditItemTemplate>
               <CMS:DropDownList ID="ddlMenus" Type="ARTICLE" LText="Root" CssClass="ddlMenu" FieldValue="PK_MENU" TableName="T_MENU" LangValue='<%# Eval("FK_LANG") %>' CValue='<%# Bind("FK_MENU") %>' runat="server" OnSelectedIndexChanged="ddlMenus_SelectedIndexChanged"></CMS:DropDownList>
               <asp:RangeValidator ID="rvMenus" runat="server" ErrorMessage="Bạn cần chọn chuyên mục" Type="Integer" ControlToValidate="ddlMenus" MaximumValue="999" MinimumValue="1" ValidationGroup="vArticleG1" SetFocusOnError="True" Display="Dynamic" >*</asp:RangeValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
               <CMS:DropDownList ID="ddlMenus" Type="ARTICLE" LText="Root" CssClass="ddlMenu" FieldValue="PK_MENU" TableName="T_MENU" SelectedValue='<%# Bind("FK_MENU") %>' runat="server"></CMS:DropDownList>
               <asp:RangeValidator ID="rvMenus" runat="server" ErrorMessage="Bạn cần chọn chuyên mục" Type="Integer" ControlToValidate="ddlMenus" MaximumValue="999" MinimumValue="1" ValidationGroup="vArticleG1" SetFocusOnError="True" Display="Dynamic" >*</asp:RangeValidator>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ng&#244;n ngữ hiển thị">
            <EditItemTemplate>
               <CMS:Label ID="lblLang" TableName="T_LANG" PkVColumn='<%# Eval("FK_LANG") %>' Column="C_TITLE" PkColumn="PK_LANG" runat="server"></CMS:Label>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:DropDownList ID="ddlLang" DataSourceID="LangDataSource" DataTextField="C_TITLE" DataValueField="PK_LANG" runat="server" OnSelectedIndexChanged="ddlLang_SelectedIndexChanged" AutoPostBack="true">
                </asp:DropDownList>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ti&#234;u đề tin b&#224;i">
            <EditItemTemplate>
               <asp:TextBox ID="txtTitle" Width="400px" runat="server" Text='<%# Bind("C_TITLE") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="Tiêu đề tin bài không thể rỗng" ControlToValidate="txtTitle" SetFocusOnError="True" ValidationGroup="vArticleG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtTitle" Width="400px" runat="server" Text='<%# Bind("C_TITLE") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="Tiêu đề tin bài không thể rỗng" ControlToValidate="txtTitle" SetFocusOnError="True" ValidationGroup="vArticleG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="T&#243;m tắt tin b&#224;i">
            <EditItemTemplate>
               <asp:TextBox ID="txtHead" TextMode="MultiLine" Rows="8" Width="650px" runat="server" Text='<%# Bind("C_HEAD") %>'></asp:TextBox>
<%--               <asp:RequiredFieldValidator ID="rfvHead" runat="server" ErrorMessage="Tóm tắt tin bài không thể rỗng" ControlToValidate="txtHead" SetFocusOnError="True" ValidationGroup="vArticleG1" Display="Dynamic">*</asp:RequiredFieldValidator>
--%>            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtHead" TextMode="MultiLine" Rows="8" Width="650px" runat="server" Text='<%# Bind("C_HEAD") %>'></asp:TextBox>
<%--               <asp:RequiredFieldValidator ID="rfvHead" runat="server" ErrorMessage="Tóm tắt tin bài không thể rỗng" ControlToValidate="txtHead" SetFocusOnError="True" ValidationGroup="vArticleG1" Display="Dynamic">*</asp:RequiredFieldValidator>
--%>            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Nội dung tin b&#224;i" HeaderStyle-Width="150">
            <EditItemTemplate>
               <radE:RadEditor ID="radeContent" Html='<%# Bind("C_CONTENT") %>' Width="90%" Height="500px" runat="server" EnableHtmlIndentation="True" ShowSubmitCancelButtons="False" Skin="Default2006" ToolbarMode="Default" AllowThumbGeneration="True" DeleteDocumentsPaths="~/uploads/" DeleteFlashPaths="~/uploads/" DeleteImagesPaths="~/uploads/" DeleteMediaPaths="~/uploads/" DocumentsPaths="~/uploads/" FlashPaths="~/uploads/" ImagesPaths="~/uploads/" MediaPaths="~/uploads/" UploadDocumentsPaths="~/uploads/" UploadFlashPaths="~/uploads/" UploadImagesPaths="~/uploads/" UploadMediaPaths="~/uploads/" DocumentsFilters="*.doc,*.xls,*.pdf,*.docx,*.xlsx" MaxImageSize="10240000" MaxDocumentSize="10240000" MaxFlashSize="10240000">
               </radE:RadEditor>
               <asp:RequiredFieldValidator ID="rfvContent" runat="server" ErrorMessage="Nội dung tin bài không thể rỗng" ControlToValidate="radeContent" SetFocusOnError="True" ValidationGroup="vArticleG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
               <radE:RadEditor ID="radeContent" Html='<%# Bind("C_CONTENT") %>' Width="90%" Height="500px" runat="server" EnableHtmlIndentation="True" ShowSubmitCancelButtons="False" Skin="Default2006" ToolbarMode="Default" AllowThumbGeneration="True" DeleteDocumentsPaths="~/uploads/" DeleteFlashPaths="~/uploads/" DeleteImagesPaths="~/uploads/" DeleteMediaPaths="~/uploads/" DocumentsPaths="~/uploads/" FlashPaths="~/uploads/" ImagesPaths="~/uploads/" MediaPaths="~/uploads/" UploadDocumentsPaths="~/uploads/" UploadFlashPaths="~/uploads/" UploadImagesPaths="~/uploads/" UploadMediaPaths="~/uploads/" DocumentsFilters="*.doc,*.xls,*.pdf,*.docx,*.xlsx" MaxImageSize="10240000" MaxDocumentSize="10240000" MaxFlashSize="10240000">
               </radE:RadEditor>
               <asp:RequiredFieldValidator ID="rfvContent" runat="server" ErrorMessage="Nội dung tin bài không thể rỗng" ControlToValidate="radeContent" SetFocusOnError="True" ValidationGroup="vArticleG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Đường dẫn ảnh">
            <EditItemTemplate>
               <asp:TextBox ID="txtImage_file_name" Width="400px" runat="server" Text='<%# Bind("C_IMAGE_FILE_NAME") %>'></asp:TextBox>
               <asp:Button ID="btnShowImage" runat="server" OnClientClick="ShowForm();return false;" Text="Chọn ảnh" />
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtImage_file_name" Width="400px" runat="server" Text='<%# Bind("C_IMAGE_FILE_NAME") %>'></asp:TextBox>
               <asp:Button ID="btnShowImage" runat="server" OnClientClick="ShowForm();return false;" Text="Chọn ảnh" />
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ti&#234;u đề ảnh">
            <EditItemTemplate>
               <asp:TextBox ID="txtImage_file_title" Width="400px" runat="server" Text='<%# Bind("C_IMAGE_FILE_TITLE") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtImage_file_title" Width="400px" runat="server" Text='<%# Bind("C_IMAGE_FILE_TITLE") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ng&#224;y bắt đầu">
            <EditItemTemplate>
               <radCln:RadDateTimePicker ID="raddBegin_date" SelectedDate='<%# Bind("C_BEGIN_DATE") %>' runat="server"></radCln:RadDateTimePicker>
            </EditItemTemplate>
            <InsertItemTemplate>
               <radCln:RadDateTimePicker ID="raddBegin_date" SelectedDate='<%# Bind("C_BEGIN_DATE") %>' runat="server" OnLoad="raddBegin_date_Load"></radCln:RadDateTimePicker>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ng&#224;y kết th&#250;c">
            <EditItemTemplate>
               <radCln:RadDateTimePicker ID="raddEnd_date" SelectedDate='<%# Bind("C_END_DATE") %>' runat="server"></radCln:RadDateTimePicker>
            </EditItemTemplate>
            <InsertItemTemplate>
               <radCln:RadDateTimePicker ID="raddEnd_date" SelectedDate='<%# Bind("C_END_DATE") %>' runat="server" OnLoad="raddEnd_date_Load"></radCln:RadDateTimePicker>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Tin nổi bật">
            <EditItemTemplate>
                <asp:RadioButtonList ID="rblHot" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_HOT") %>'>
                     <asp:ListItem Text="Cho phép" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Không cho phép" Value="0"></asp:ListItem>
                </asp:RadioButtonList>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:RadioButtonList ID="rblHot" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_HOT") %>'>
                     <asp:ListItem Text="Cho phép" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Không cho phép" Selected="True" Value="0"></asp:ListItem>
                </asp:RadioButtonList>
            </InsertItemTemplate>
        </asp:TemplateField>


         <asp:TemplateField HeaderText="Tin mới">
            <EditItemTemplate>
                <asp:RadioButtonList ID="rblNew" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_MOI") %>'>
                     <asp:ListItem Text="Cho phép" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Không cho phép" Value="0"></asp:ListItem>
                </asp:RadioButtonList>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:RadioButtonList ID="rblNew" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_MOI") %>'>
                     <asp:ListItem Text="Cho phép" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Không cho phép" Selected="True" Value="0"></asp:ListItem>
                </asp:RadioButtonList>
            </InsertItemTemplate>
        </asp:TemplateField>


      
        <asp:TemplateField HeaderText="Trạng th&#225;i">
            <EditItemTemplate>
               <asp:RadioButtonList ID="rblStatus" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_STATUS") %>'>
                     <asp:ListItem Text="Hiển thị" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Không hiển thị" Value="0"></asp:ListItem>
               </asp:RadioButtonList>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:RadioButtonList ID="rblStatus" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_STATUS") %>'>
                     <asp:ListItem Text="Hiển thị" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Không hiển thị" Value="0"></asp:ListItem>
               </asp:RadioButtonList>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField ShowHeader="false">
            <InsertItemTemplate>
                <b>PHẦN MỞ RỘNG KHI XEM CHI TIẾT</b>
            </InsertItemTemplate>
            <EditItemTemplate>
                 <b>PHẦN MỞ RỘNG KHI XEM CHI TIẾT</b>
            </EditItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Hiển thị tiêu đề">
            <EditItemTemplate>
                <asp:RadioButtonList ID="rblIsTitle" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_IS_TITLE") %>'>
                     <asp:ListItem Text="Có" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Không" Value="0"></asp:ListItem>
                </asp:RadioButtonList>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:RadioButtonList ID="rblIsTitle" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_IS_TITLE") %>'>
                     <asp:ListItem Text="Có" Selected="True" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Không" Value="0"></asp:ListItem>
                </asp:RadioButtonList>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Hiển thị tóm tắt">
            <EditItemTemplate>
                <asp:RadioButtonList ID="rblIsHead" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_IS_HEAD") %>'>
                     <asp:ListItem Text="Có" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Không" Value="0"></asp:ListItem>
                </asp:RadioButtonList>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:RadioButtonList ID="rblIsHead" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_IS_HEAD") %>'>
                     <asp:ListItem Text="Có" Selected="True" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Không" Value="0"></asp:ListItem>
                </asp:RadioButtonList>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Hiển thị ảnh">
            <EditItemTemplate>
                <asp:RadioButtonList ID="rblIsImage" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_IS_IMAGE") %>'>
                     <asp:ListItem Text="Có" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Không" Value="0"></asp:ListItem>
                </asp:RadioButtonList>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:RadioButtonList ID="rblIsImage" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_IS_IMAGE") %>'>
                     <asp:ListItem Text="Có" Selected="True" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Không" Value="0"></asp:ListItem>
                </asp:RadioButtonList>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Chiều rộng ảnh">
            <EditItemTemplate>
               <asp:TextBox ID="txtImageWidth" runat="server" Text='<%# Bind("C_IMAGE_WIDTH") %>'></asp:TextBox>
               <asp:RangeValidator ID="rvImageWidth" runat="server" ErrorMessage="Chiều rộng ảnh là số >=0" Type="Integer" ControlToValidate="txtImageWidth" MaximumValue="9999" MinimumValue="0" ValidationGroup="vArticleG1" SetFocusOnError="True" Display="Dynamic" >*</asp:RangeValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtImageWidth" runat="server" Text='<%# Bind("C_IMAGE_WIDTH") %>'></asp:TextBox>
               <asp:RangeValidator ID="rvImageWidth" runat="server" ErrorMessage="Chiều rộng ảnh là số >=0" Type="Integer" ControlToValidate="txtImageWidth" MaximumValue="9999" MinimumValue="0" ValidationGroup="vArticleG1" SetFocusOnError="True" Display="Dynamic" >*</asp:RangeValidator>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Chiều cao ảnh">
            <EditItemTemplate>
               <asp:TextBox ID="txtImageHeigth" runat="server" Text='<%# Bind("C_IMAGE_HEIGTH") %>'></asp:TextBox>
               <asp:RangeValidator ID="rvImageHeigth" runat="server" ErrorMessage="Chiều cao ảnh là số >=0" Type="Integer" ControlToValidate="txtImageHeigth" MaximumValue="9999" MinimumValue="0" ValidationGroup="vArticleG1" SetFocusOnError="True" Display="Dynamic" >*</asp:RangeValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtImageHeigth" runat="server" Text='<%# Bind("C_IMAGE_HEIGTH") %>'></asp:TextBox>
               <asp:RangeValidator ID="rvImageHeigth" runat="server" ErrorMessage="Chiều cao ảnh là số >=0" Type="Integer" ControlToValidate="txtImageHeigth" MaximumValue="9999" MinimumValue="0" ValidationGroup="vArticleG1" SetFocusOnError="True" Display="Dynamic" >*</asp:RangeValidator>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
               <div align="center">
                  <br />
                  <asp:Button ID="btnUpdate" ValidationGroup="vArticleG1" runat="server" CommandName="Update" Text="Sửa đổi" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </EditItemTemplate>
            <InsertItemTemplate>
               <div align="center">
                  <br />
                  <asp:Button ID="btnInsert" ValidationGroup="vArticleG1" runat="server" CommandName="Insert" Text="Th&#234;m mới" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </InsertItemTemplate>
        </asp:TemplateField>
    </Fields>
</asp:DetailsView> 
<asp:ValidationSummary ID="vsArticle" ValidationGroup="vArticleG1" ShowSummary="false" HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="true" />  


<script runat="server">
         
    protected void dvArticle_PreRender(object sender, EventArgs e)
    {
        Telerik.WebControls.RadEditor radeContent = dvArticle.FindControl("radeContent") as Telerik.WebControls.RadEditor;

        if (Request.Browser.Browser.ToLowerInvariant() == "firefox")
        {
            System.Reflection.FieldInfo browserCheckedField = typeof(RadEditor).GetField("_browserCapabilitiesRetrieved", System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.NonPublic);
            browserCheckedField.SetValue(radeContent, true);
            System.Reflection.FieldInfo browserSupportedField = typeof(RadEditor).GetField("_isSupportedBrowser", System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.NonPublic);
            browserSupportedField.SetValue(radeContent, true);
        }

        RadioButtonList rblStatus = dvArticle.FindControl("rblStatus") as RadioButtonList;
        if (dvArticle.CurrentMode == DetailsViewMode.Insert)
        {
            rblStatus.Items[1].Selected = true;
            rblStatus.Visible = false;
            
        }       

    }

                
</script>

<script type="text/javascript">
	function ShowForm(ctlID)
	{
		 window.open("Article_Image.aspx?Dir=<%= DirPath %>","","width=550, height=400, top=80, left=200,scrollbars=yes");
		 return false;
	}
	function refreshPage(arg)
	{
		 document.getElementById("ctl00_cphCMS_ctl00_dvArticle_txtImage_file_name").value = arg;
	}
</script>
      
<asp:SqlDataSource ID="ArticleDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT a.PK_ARTICLE,a.FK_MENU,a.C_TITLE,a.C_HEAD,a.C_CONTENT,a.C_IMAGE_FILE_NAME,a.C_IMAGE_FILE_TITLE,a.C_BEGIN_DATE,a.C_END_DATE,CONVERT(INT,a.C_HOT) AS 'C_HOT',CONVERT(INT,a.C_STATUS) AS 'C_STATUS',CONVERT(INT,a.C_IS_TITLE) AS 'C_IS_TITLE',ISNULL(CONVERT(INT,a.C_MOI),0) AS 'C_MOI',CONVERT(INT,a.C_IS_HEAD) AS 'C_IS_HEAD',CONVERT(INT,a.C_IS_IMAGE) AS 'C_IS_IMAGE',a.C_IMAGE_WIDTH,a.C_IMAGE_HEIGTH,b.FK_LANG FROM T_ARTICLE a,T_MENU b WHERE a.FK_MENU=b.PK_MENU AND a.PK_ARTICLE=@PK_ARTICLE"   
   InsertCommand="INSERT INTO T_ARTICLE(FK_MENU,FK_USER,C_TITLE,C_HEAD,C_CONTENT,C_IMAGE_FILE_NAME,C_IMAGE_FILE_TITLE,C_ENTRY_DATE,C_BEGIN_DATE,C_END_DATE,C_MODIFY_DATE,C_HOT,C_HITS,C_HIT,C_ORDER,C_STATUS,C_IS_TITLE,C_IS_HEAD,C_IS_IMAGE,C_IMAGE_WIDTH,C_IMAGE_HEIGTH,C_MOI) 
                                 VALUES(@FK_MENU,@FK_USER,@C_TITLE,@C_HEAD,@C_CONTENT,@C_IMAGE_FILE_NAME,@C_IMAGE_FILE_TITLE,GETDATE(),@C_BEGIN_DATE,@C_END_DATE,GETDATE(),@C_HOT,0,0,@C_ORDER,@C_STATUS,@C_IS_TITLE,@C_IS_HEAD,@C_IS_IMAGE,@C_IMAGE_WIDTH,@C_IMAGE_HEIGTH,@C_MOI)" 
   UpdateCommand="UPDATE T_ARTICLE SET FK_MENU=@FK_MENU,FK_USER_EDIT=@FK_USER_EDIT,C_TITLE=@C_TITLE,C_HEAD=@C_HEAD,C_CONTENT=@C_CONTENT,C_IMAGE_FILE_NAME=@C_IMAGE_FILE_NAME,C_IMAGE_FILE_TITLE=@C_IMAGE_FILE_TITLE,C_BEGIN_DATE=@C_BEGIN_DATE,C_END_DATE=@C_END_DATE,C_MODIFY_DATE=GETDATE(),C_HOT=ISNULL(@C_HOT,C_HOT),C_ORDER=ISNULL(@C_ORDER,C_ORDER),C_STATUS=ISNULL(@C_STATUS,C_STATUS),C_IS_TITLE=ISNULL(@C_IS_TITLE,C_IS_TITLE),C_IS_HEAD=ISNULL(@C_IS_HEAD,C_IS_HEAD),C_IS_IMAGE=ISNULL(@C_IS_IMAGE,C_IS_IMAGE),C_MOI=ISNULL(@C_MOI,C_MOI),C_IMAGE_WIDTH=@C_IMAGE_WIDTH,C_IMAGE_HEIGTH=@C_IMAGE_HEIGTH WHERE PK_ARTICLE=@PK_ARTICLE" 
    >
   <SelectParameters>
     <asp:QueryStringParameter Name="PK_ARTICLE" QueryStringField="aID" DefaultValue="0" Type="Int32" />
   </SelectParameters>
   <InsertParameters>
     <asp:Parameter Name="FK_MENU" Type="Int32" DefaultValue="1"/>
     <asp:Parameter Name="FK_USER" Type="int32" />
     <asp:Parameter Name="C_TITLE" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_HEAD" ConvertEmptyStringToNull="false" Type="String" />
     <asp:Parameter Name="C_CONTENT" ConvertEmptyStringToNull="false" Type="String" />
     <asp:Parameter Name="C_IMAGE_FILE_NAME" ConvertEmptyStringToNull="false" Type="String"  />
     <asp:Parameter Name="C_IMAGE_FILE_TITLE" ConvertEmptyStringToNull="false" Type="String"  />
     <asp:Parameter Name="C_BEGIN_DATE" Type="dateTime"  />
     <asp:Parameter Name="C_END_DATE" Type="dateTime"  />
     <asp:Parameter Name="C_HOT" Type="Int32" DefaultValue="0" />
     
     <asp:Parameter Name="C_ORDER" Type="Int32" />
     <asp:Parameter Name="C_STATUS" Type="Int32" DefaultValue="0" />
     <asp:Parameter Name="C_IS_TITLE" Type="Int32" DefaultValue="0" />
     <asp:Parameter Name="C_IS_HEAD" Type="Int32" DefaultValue="0" />
     <asp:Parameter Name="C_IS_IMAGE" Type="Int32" DefaultValue="0" />
     <asp:Parameter Name="C_IMAGE_WIDTH" Type="Int32" DefaultValue="0" />
     <asp:Parameter Name="C_IMAGE_HEIGTH" Type="Int32" DefaultValue="0" />
     <asp:Parameter Name="C_MOI" Type="Int32" DefaultValue="0" />
   </InsertParameters>
   <UpdateParameters>
     <asp:Parameter Name="PK_ARTICLE" Type="Int32" />
     <asp:Parameter Name="FK_USER_EDIT" Type="int32" />
     <asp:Parameter Name="FK_MENU" Type="Int32" DefaultValue="1"/>
     <asp:Parameter Name="C_TITLE" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_HEAD" ConvertEmptyStringToNull="false" Type="String" />
     <asp:Parameter Name="C_CONTENT" ConvertEmptyStringToNull="false" Type="String" />
     <asp:Parameter Name="C_IMAGE_FILE_NAME" ConvertEmptyStringToNull="false" Type="String"  />
     <asp:Parameter Name="C_IMAGE_FILE_TITLE" ConvertEmptyStringToNull="false" Type="String"  />
     <asp:Parameter Name="C_BEGIN_DATE" Type="dateTime"  />
     <asp:Parameter Name="C_END_DATE" Type="dateTime"  />
     <asp:Parameter Name="C_HOT" Type="Int32"  />
     
     <asp:Parameter Name="C_ORDER" Type="Int32" />
     <asp:Parameter Name="C_STATUS" Type="Int32" />
     <asp:Parameter Name="C_IS_TITLE" Type="Int32" DefaultValue="0" />
     <asp:Parameter Name="C_IS_HEAD" Type="Int32" DefaultValue="0" />
     <asp:Parameter Name="C_IS_IMAGE" Type="Int32" DefaultValue="0" />
     <asp:Parameter Name="C_IMAGE_WIDTH" Type="Int32" DefaultValue="0" />
     <asp:Parameter Name="C_IMAGE_HEIGTH" Type="Int32" DefaultValue="0" />
     <asp:Parameter Name="C_MOI" Type="Int32" DefaultValue="0" />
   </UpdateParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="LangDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_LANG,C_TITLE FROM T_LANG"   
    >
</asp:SqlDataSource>