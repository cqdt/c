<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Banner.ascx.cs" Inherits="Admin_Modules_Banner" %>



<asp:DetailsView id="dvBanner" runat="server" DataSourceID="BannerDataSource" 
     AutoGenerateRows="False" DataKeyNames="PK_BANNER"  Width="100%" 
     DefaultMode="Insert" HorizontalAlign="Center" HeaderText="Thêm mới Banner" OnItemCommand="dvBanner_ItemCommand" OnItemUpdated="dvBanner_ItemUpdated" OnItemUpdating="dvBanner_ItemUpdating">
    <Fields>
         <asp:TemplateField HeaderText="T&#234;n Banner">
            <EditItemTemplate>
               <asp:TextBox ID="txtImage_file_name" Width="400px" runat="server" Text='<%# Bind("C_IMAGE_FILE_NAME") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvImage_file_name" runat="server" ErrorMessage="Banner không thể rỗng" ControlToValidate="txtImage_file_name" SetFocusOnError="True" ValidationGroup="vBannerG1" Display="Dynamic">*</asp:RequiredFieldValidator>
               <asp:Button ID="btnShowImage" runat="server" OnClientClick="ShowForm();return false;" Text="Chọn ảnh" />
               <asp:Button ID="btnShowFlash" runat="server" OnClientClick="ShowFormFlash();return false;" Text="Chọn Flash" />
            </EditItemTemplate>
<%--            <InsertItemTemplate>
               <asp:TextBox ID="txtImage_file_name" Width="400px" runat="server" Text='<%# Bind("C_IMAGE_FILE_NAME") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvImage_file_name" runat="server" ErrorMessage="Banner không thể rỗng" ControlToValidate="txtImage_file_name" SetFocusOnError="True" ValidationGroup="vBannerG1" Display="Dynamic">*</asp:RequiredFieldValidator>
               <asp:Button ID="btnShowImage" runat="server" OnClientClick="ShowForm();return false;" Text="Chọn ảnh" />
               <asp:Button ID="btnShowFlash" runat="server" OnClientClick="ShowFormFlash();return false;" Text="Chọn Flash" />
            </InsertItemTemplate>--%>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="URL">
            <EditItemTemplate>
							 <asp:TextBox ID="txtUrl" Width="400px" Text='<%# Bind("C_LINK") %>' runat="server"></asp:TextBox>
            </EditItemTemplate>
         </asp:TemplateField>
          <asp:TemplateField HeaderText="Cỡ ảnh">
            <EditItemTemplate>
							 <asp:TextBox ID="txtSizze" Width="400px" Text='<%# Bind("C_SIZE") %>' runat="server"></asp:TextBox>
            </EditItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
               <div align="center">
                  <br />
                  <asp:Button ID="btnUpdate" ValidationGroup="vBannerG1" runat="server" CommandName="Update" Text="Sửa đổi" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </EditItemTemplate>
          <%--  <InsertItemTemplate>
               <div align="center">
                  <br />
                  <asp:Button ID="btnInsert" ValidationGroup="vBannerG1" runat="server" CommandName="Insert" Text="Th&#234;m mới" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </InsertItemTemplate>--%>
        </asp:TemplateField>
    </Fields>
</asp:DetailsView> 
<asp:ValidationSummary ID="vsBanner" ValidationGroup="vBannerG1" ShowSummary="false" HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="true" />  

<script type="text/javascript">
function ShowForm(ctlID)
{
   window.open("Article_Image.aspx?Dir=Banner","","width=550, height=400, top=80, left=200,scrollbars=yes");
   return false;
}
function ShowFormFlash(ctlID)
{
   window.open("Text_File.aspx?Dir=Flash","","width=550, height=400, top=80, left=200,scrollbars=yes");
   return false;
}
function refreshPage(arg)
{
   document.getElementById("ctl00_cphCMS_ctl00_dvBanner_txtImage_file_name").value = arg;
}
</script>
     
     
<asp:SqlDataSource ID="BannerDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT * FROM T_BANNER WHERE PK_BANNER=@PK_BANNER"   
   UpdateCommand="UPDATE T_BANNER SET C_IMAGE_FILE_NAME=@C_IMAGE_FILE_NAME,C_LINK=@C_LINK,C_SIZE=@C_SIZE WHERE PK_BANNER=@PK_BANNER" 
    >
   <SelectParameters>
     <asp:QueryStringParameter Name="PK_BANNER" QueryStringField="bID" DefaultValue="0" Type="Int32" />
   </SelectParameters>
   <UpdateParameters>
     <asp:Parameter Name="PK_BANNER" Type="Int32" />
     <asp:Parameter Name="C_IMAGE_FILE_NAME" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_LINK" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_SIZE" ConvertEmptyStringToNull="false" Type="String"/>
   </UpdateParameters>
</asp:SqlDataSource>