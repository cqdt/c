<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Link.ascx.cs" Inherits="Admin_Modules_Link" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 

      
<asp:DetailsView id="dvLink" runat="server" DataSourceID="LinkDataSource" 
     AutoGenerateRows="False" DataKeyNames="PK_LINK"  Width="100%" 
     DefaultMode="Insert" HorizontalAlign="Center" HeaderText="Thêm mới liên kết" OnItemCommand="dvLink_ItemCommand" OnItemInserted="dvLink_ItemInserted" OnItemInserting="dvLink_ItemInserting" OnItemUpdated="dvLink_ItemUpdated" OnItemUpdating="dvLink_ItemUpdating">
    <Fields>
        <asp:TemplateField HeaderText="Ng&#244;n ngữ hiển thị">
            <EditItemTemplate>
               <CMS:Label ID="lblLang" TableName="T_LANG" Column="C_TITLE" PkColumn="PK_LANG" PkVColumn='<%# Bind("FK_LANG") %>' runat="server"></CMS:Label>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:DropDownList ID="ddlLang" DataSourceID="LangDataSource" SelectedValue='<%# Bind("FK_LANG") %>' DataTextField="C_TITLE" DataValueField="PK_LANG" runat="server"></asp:DropDownList>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Tên liên kết">
            <EditItemTemplate>
               <asp:TextBox ID="txtName" Width="400px" runat="server" Text='<%# Bind("C_NAME") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtName" Width="400px" runat="server" Text='<%# Bind("C_NAME") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="URL">
            <EditItemTemplate>
               <asp:TextBox ID="txtUrl" Width="400px" runat="server" Text='<%# Bind("C_LINK") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvUrl" runat="server" ErrorMessage="URL không thể rỗng" ControlToValidate="txtUrl" SetFocusOnError="True" ValidationGroup="vLinkG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtUrl" Width="400px" runat="server" Text='<%# Bind("C_LINK") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvUrl" runat="server" ErrorMessage="URL không thể rỗng" ControlToValidate="txtUrl" SetFocusOnError="True" ValidationGroup="vLinkG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </InsertItemTemplate>
        </asp:TemplateField>


          <asp:TemplateField HeaderText="Đường dẫn ảnh">
            <EditItemTemplate>
               <asp:TextBox ID="txtImage_file_name" Width="400px" runat="server" Text='<%# Bind("C_IMAGE_FILE_NAME") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvImage_file_name" runat="server" ErrorMessage="Đường dẫn ảnh không thể rỗng" ControlToValidate="txtImage_file_name" SetFocusOnError="True" ValidationGroup="vADVG1" Display="Dynamic">*</asp:RequiredFieldValidator>
               <asp:Button ID="btnShowImage" runat="server" OnClientClick="ShowForm();return false;" Text="Chọn ảnh" />
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtImage_file_name" Width="400px" runat="server" Text='<%# Bind("C_IMAGE_FILE_NAME") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvImage_file_name" runat="server" ErrorMessage="Đường dẫn ảnh không thể rỗng" ControlToValidate="txtImage_file_name" SetFocusOnError="True" ValidationGroup="vADVG1" Display="Dynamic">*</asp:RequiredFieldValidator>
               <asp:Button ID="btnShowImage" runat="server" OnClientClick="ShowForm();return false;" Text="Chọn ảnh" />
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
                     <asp:ListItem Text="Hiển thị" Selected="True" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Không hiển thị" Value="0"></asp:ListItem>
               </asp:RadioButtonList>
            </InsertItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
               <div align="center">
                  <br />
                  <asp:Button ID="btnUpdate" ValidationGroup="vLinkG1" runat="server" CommandName="Update" Text="Sửa đổi" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </EditItemTemplate>
            <InsertItemTemplate>
               <div align="center">
                  <br />
                  <asp:Button ID="btnInsert" ValidationGroup="vLinkG1" runat="server" CommandName="Insert" Text="Th&#234;m mới" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </InsertItemTemplate>
        </asp:TemplateField>
    </Fields>
</asp:DetailsView> 
<asp:ValidationSummary ID="vsLink" ValidationGroup="vLinkG1" ShowSummary="false" HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="true" />  
<script type="text/javascript">
    function ShowForm(ctlID) {
        window.open("Article_Image.aspx?Dir=Advs", "", "width=550, height=400, top=80, left=200,scrollbars=yes");
        return false;
    }

    function refreshPage(arg) {
        document.getElementById("ctl00_cphCMS_ctl00_dvLink_txtImage_file_name").value = arg;
    }
</script>

<asp:SqlDataSource ID="LinkDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_LINK,FK_LANG,C_NAME,C_LINK,CONVERT(INT,C_STATUS) AS 'C_STATUS',C_IMAGE_FILE_NAME FROM T_LINK WHERE PK_LINK=@PK_LINK"   
   InsertCommand="INSERT INTO T_LINK(FK_LANG,C_NAME,C_LINK,C_ORDER,C_STATUS,C_IMAGE_FILE_NAME) 
                              VALUES(@FK_LANG,@C_NAME,@C_LINK,@C_ORDER,@C_STATUS,@C_IMAGE_FILE_NAME)" 
   UpdateCommand="UPDATE T_LINK SET C_NAME=@C_NAME,C_LINK=@C_LINK,C_ORDER=ISNULL(@C_ORDER,C_ORDER),C_STATUS=@C_STATUS,C_IMAGE_FILE_NAME=@C_IMAGE_FILE_NAME WHERE PK_LINK=@PK_LINK" 
    >
   <SelectParameters>
     <asp:QueryStringParameter Name="PK_LINK" QueryStringField="lID" DefaultValue="0" Type="Int32" />
   </SelectParameters>
   <InsertParameters>
     <asp:Parameter Name="FK_LANG" Type="Int32"/>
     <asp:Parameter Name="C_NAME" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
     <asp:Parameter Name="C_LINK" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_IMAGE_FILE_NAME" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_ORDER" Type="Int32"/>
     <asp:Parameter Name="C_STATUS" Type="Int32"/>
   </InsertParameters>
   <UpdateParameters>
     <asp:Parameter Name="PK_LINK" Type="Int32" />
     <asp:Parameter Name="C_NAME" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
     <asp:Parameter Name="C_LINK" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_IMAGE_FILE_NAME" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_ORDER" Type="Int32"/>
     <asp:Parameter Name="C_STATUS" Type="Int32"/>
   </UpdateParameters>
</asp:SqlDataSource>


<asp:SqlDataSource ID="LangDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_LANG,C_TITLE FROM T_LANG"   
    >
</asp:SqlDataSource>