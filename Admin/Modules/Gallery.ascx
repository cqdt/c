<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Gallery.ascx.cs" Inherits="Admin_Modules_Gallery" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 


<asp:DetailsView id="dvGallery" runat="server" DataSourceID="GalleryDataSource" 
     AutoGenerateRows="False" DataKeyNames="PK_GALLERY"  Width="100%" 
     DefaultMode="Insert" HorizontalAlign="Center" HeaderText="Thêm mới thư viện ảnh" OnItemCommand="dvGallery_ItemCommand" OnItemInserted="dvGallery_ItemInserted" OnItemInserting="dvGallery_ItemInserting" OnItemUpdated="dvGallery_ItemUpdated" OnItemUpdating="dvGallery_ItemUpdating" OnPreRender="dvGallery_PreRender">
    <Fields>
       <asp:TemplateField HeaderText="Nhóm thư viện ảnh">
            <EditItemTemplate>
               <CMS:DropDownList ID="ddlMenus" Type="GALLERY" LText="Root" CssClass="ddlMenu" FieldValue="PK_MENU" TableName="T_MENU" LangValue="1" CValue='<%# Bind("FK_MENU") %>' runat="server" OnSelectedIndexChanged="ddlMenus_SelectedIndexChanged"></CMS:DropDownList>
               <asp:RangeValidator ID="rvMenus" runat="server" ErrorMessage="Bạn cần chọn nhóm thư viện ảnh" Type="Integer" ControlToValidate="ddlMenus" MaximumValue="999" MinimumValue="3" ValidationGroup="vGalleryG1" SetFocusOnError="True" Display="Dynamic" >*</asp:RangeValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
               <CMS:DropDownList ID="ddlMenus" Type="GALLERY" LText="Root" CssClass="ddlMenu" FieldValue="PK_MENU" TableName="T_MENU" SelectedValue='<%# Bind("FK_MENU") %>' runat="server"></CMS:DropDownList>
               <asp:RangeValidator ID="rvMenus" runat="server" ErrorMessage="Bạn cần chọn nhóm thư viện ảnh" Type="Integer" ControlToValidate="ddlMenus" MaximumValue="999" MinimumValue="3" ValidationGroup="vGalleryG1" SetFocusOnError="True" Display="Dynamic" >*</asp:RangeValidator>
             </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Tên">
            <EditItemTemplate>
               <asp:TextBox ID="txtTitle" Width="400px" runat="server" Text='<%# Bind("C_NAME") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="Tên không thể rỗng" ControlToValidate="txtTitle" SetFocusOnError="True" ValidationGroup="vGalleryG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtTitle" Width="400px" runat="server" Text='<%# Bind("C_NAME") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="Tên không thể rỗng" ControlToValidate="txtTitle" SetFocusOnError="True" ValidationGroup="vGalleryG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ảnh hiển thị">
            <EditItemTemplate>
               <asp:TextBox ID="txtFileName" Width="400px" runat="server" Text='<%# Bind("C_FILE") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvFileName" runat="server" ErrorMessage="Tên file không thể rỗng" ControlToValidate="txtFileName" SetFocusOnError="True" ValidationGroup="vGalleryG1" Display="Dynamic">*</asp:RequiredFieldValidator>
               <asp:Button ID="btnShowImage" runat="server" OnClientClick="ShowForm();return false;" Text="Chọn File" />
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtFileName" Width="400px" runat="server" Text='<%# Bind("C_FILE") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvFileName" runat="server" ErrorMessage="Tên file không thể rỗng" ControlToValidate="txtFileName" SetFocusOnError="True" ValidationGroup="vGalleryG1" Display="Dynamic">*</asp:RequiredFieldValidator>
               <asp:Button ID="btnShowImage" runat="server" OnClientClick="ShowForm();return false;" Text="Chọn File" />
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ảnh nổi bật">
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
         <asp:TemplateField HeaderText="Trạng th&#225;i">
            <EditItemTemplate>
               <asp:RadioButtonList ID="rblStatus" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_STATUS") %>'>
                     <asp:ListItem Text="Hiển thị" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Không hiển thị" Value="0"></asp:ListItem>
               </asp:RadioButtonList>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:RadioButtonList ID="rblStatus" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_STATUS") %>'>
                     <asp:ListItem Text="Hiển thị"  Selected="True" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Không hiển thị" Value="0"></asp:ListItem>
               </asp:RadioButtonList>
            </InsertItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
               <div align="center">
                  <br />
                  <asp:Button ID="btnUpdate" ValidationGroup="vGalleryG1" runat="server" CommandName="Update" Text="Sửa đổi" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </EditItemTemplate>
            <InsertItemTemplate>
               <div align="center">
                  <br />
                  <asp:Button ID="btnInsert" ValidationGroup="vGalleryG1" runat="server" CommandName="Insert" Text="Th&#234;m mới" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </InsertItemTemplate>
        </asp:TemplateField>
    </Fields>
</asp:DetailsView> 
<asp:ValidationSummary ID="vsGallery" ValidationGroup="vGalleryG1" ShowSummary="false" HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="true" />  

<script type="text/javascript">
function ShowForm(ctlID)
{
   window.open("Article_Image.aspx?Dir=Gallery","","width=550, height=400, top=80, left=200,scrollbars=yes");
   return false;
}

function refreshPage(arg)
{
   document.getElementById("ctl00_cphCMS_ctl00_dvGallery_txtFileName").value = arg;
}
</script>
     
     
     
<asp:SqlDataSource ID="GalleryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_GALLERY,FK_MENU,C_NAME,C_FILE,CONVERT(INT,C_STATUS) AS C_STATUS,CONVERT(INT,C_HOT) AS C_HOT FROM T_GALLERY WHERE PK_GALLERY=@PK_GALLERY"   
   InsertCommand="INSERT INTO T_GALLERY(FK_MENU,C_NAME,C_FILE,C_HOT,C_ORDER,C_STATUS,C_ENTRY_DATE) 
                              VALUES(@FK_MENU,@C_NAME,@C_FILE,@C_HOT,@C_ORDER,@C_STATUS,GETDATE()) " 
   UpdateCommand="UPDATE T_GALLERY SET FK_MENU=@FK_MENU,C_NAME=@C_NAME,C_FILE=@C_FILE,C_HOT=ISNULL(@C_HOT,C_HOT),C_ORDER=ISNULL(@C_ORDER,C_ORDER),C_STATUS=ISNULL(@C_STATUS,C_STATUS),C_MODIFY_DATE=GETDATE() WHERE PK_GALLERY=@PK_GALLERY" 
    >
   <SelectParameters>
     <asp:QueryStringParameter Name="PK_GALLERY" QueryStringField="aID" DefaultValue="0" Type="Int32" />
   </SelectParameters>
   <InsertParameters>
     <asp:Parameter Name="FK_MENU" Type="Int32" />
     <asp:Parameter Name="C_NAME" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_FILE" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_HOT" Type="Int32" DefaultValue="0" />
     <asp:Parameter Name="C_ORDER" Type="Int32"/>
     <asp:Parameter Name="C_STATUS" Type="Int32" DefaultValue="0" />
   </InsertParameters>
   <UpdateParameters>
     <asp:Parameter Name="PK_GALLERY" Type="Int32" />
     <asp:Parameter Name="FK_MENU" Type="Int32" />
     <asp:Parameter Name="C_NAME" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_FILE" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_HOT" Type="Int32" DefaultValue="0" />
     <asp:Parameter Name="C_ORDER" Type="Int32"/>
     <asp:Parameter Name="C_STATUS" Type="Int32" DefaultValue="0" />
   </UpdateParameters>
</asp:SqlDataSource>
