<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Video.ascx.cs" Inherits="Admin_Modules_Video" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>

<asp:DetailsView id="dvAdv" runat="server" DataSourceID="AdvDataSource" 
     AutoGenerateRows="False" DataKeyNames="PK_VIDEO"  Width="100%" 
     DefaultMode="Insert" HorizontalAlign="Center" HeaderText="Thêm mới quảng cáo" OnItemCommand="dvAdv_ItemCommand" OnItemInserted="dvAdv_ItemInserted" OnItemInserting="dvAdv_ItemInserting" OnItemUpdated="dvAdv_ItemUpdated" OnItemUpdating="dvAdv_ItemUpdating" OnPreRender="dvAdv_PreRender">
    <Fields>
   <asp:TemplateField HeaderText="Ng&#244;n ngữ hiển thị">
            <EditItemTemplate>
               <CMS:Label ID="lblLang" TableName="T_LANG" PkVColumn='<%# Eval("FK_LANG") %>' Column="C_TITLE" PkColumn="PK_LANG" runat="server"></CMS:Label>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:DropDownList ID="ddlLang" DataSourceID="LangDataSource" DataTextField="C_TITLE" SelectedValue='<%# Bind("FK_LANG") %>' DataValueField="PK_LANG" runat="server" >
                </asp:DropDownList>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="T&#234;n">
            <EditItemTemplate>
							 <asp:TextBox ID="txtName" Width="400px" Text='<%# Bind("C_NAME") %>' runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="T&#234;n không thể rỗng" ControlToValidate="txtName" SetFocusOnError="True" ValidationGroup="vADVG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
							 <asp:TextBox ID="txtName" Width="400px" Text='<%# Bind("C_NAME") %>' runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="T&#234;n không thể rỗng" ControlToValidate="txtName" SetFocusOnError="True" ValidationGroup="vADVG1" Display="Dynamic">*</asp:RequiredFieldValidator>
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
        
        <asp:TemplateField HeaderText="Đường dẫn video">
            <EditItemTemplate>
               <asp:TextBox ID="txtVideo_file_name" Width="400px" runat="server" Text='<%# Bind("C_VIDEO_FILE_NAME") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rvVideo_file_name" runat="server" ErrorMessage="Đường dẫn ảnh không thể rỗng" ControlToValidate="txtVideo_file_name" SetFocusOnError="True" ValidationGroup="vADVG1" Display="Dynamic">*</asp:RequiredFieldValidator>
               <asp:Button ID="btnShowVideo" runat="server" OnClientClick="ShowForm1();return false;" Text="Chọn video" />
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtVideo_file_name" Width="400px" runat="server" Text='<%# Bind("C_VIDEO_FILE_NAME") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rvVideo_file_name" runat="server" ErrorMessage="Đường dẫn ảnh không thể rỗng" ControlToValidate="txtVideo_file_name" SetFocusOnError="True" ValidationGroup="vADVG1" Display="Dynamic">*</asp:RequiredFieldValidator>
              <asp:Button ID="btnShowVideo" runat="server" OnClientClick="ShowForm1();return false;" Text="Chọn video" />
               
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
                  <asp:Button ID="btnUpdate" ValidationGroup="vADVG1" runat="server" CommandName="Update" Text="Sửa đổi" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </EditItemTemplate>
            <InsertItemTemplate>
               <div align="center">
                  <br />
                  <asp:Button ID="btnInsert" ValidationGroup="vADVG1" runat="server" CommandName="Insert" Text="Th&#234;m mới" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </InsertItemTemplate>
        </asp:TemplateField>
    </Fields>
</asp:DetailsView> 
<asp:ValidationSummary ID="vsADV" ValidationGroup="vADVG1" ShowSummary="false" HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="true" />  
<script type="text/javascript">
function ShowForm(ctlID)
{
   window.open("Article_Image.aspx?Dir=anhvideo","","width=550, height=400, top=80, left=200,scrollbars=yes");
   return false;
}
function ShowForm1(ctlID)
{
   window.open("flash_file.aspx?Dir=Video","","width=550, height=400, top=80, left=200,scrollbars=yes");
   return false;
}

function refreshPage1(arg)
{
   document.getElementById("ctl00_cphCMS_ctl00_dvAdv_txtVideo_file_name").value = arg;
}
function refreshPage(arg)
{
   document.getElementById("ctl00_cphCMS_ctl00_dvAdv_txtImage_file_name").value = arg;
}
</script>


<asp:SqlDataSource ID="AdvDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_VIDEO,C_NAME,FK_LANG,C_BEGIN_DATE,C_END_DATE,C_VIDEO_FILE_NAME,C_IMAGE_FILE_NAME,CONVERT(INT,C_STATUS) AS 'C_STATUS' FROM T_VIDEO WHERE PK_VIDEO=@PK_VIDEO"   
   InsertCommand="INSERT INTO T_VIDEO(FK_LANG,C_NAME,C_ORDER,C_VIDEO_FILE_NAME,C_IMAGE_FILE_NAME,C_STATUS,C_BEGIN_DATE,C_END_DATE) 
                              VALUES(@FK_LANG,@C_NAME,@C_ORDER,@C_VIDEO_FILE_NAME,@C_IMAGE_FILE_NAME,@C_STATUS,@C_BEGIN_DATE,@C_END_DATE)" 
   UpdateCommand="UPDATE T_VIDEO SET C_NAME=@C_NAME,C_VIDEO_FILE_NAME=@C_VIDEO_FILE_NAME,C_IMAGE_FILE_NAME=@C_IMAGE_FILE_NAME,C_STATUS=@C_STATUS WHERE PK_VIDEO=@PK_VIDEO" 
    >
   <SelectParameters>
     <asp:QueryStringParameter Name="PK_VIDEO" QueryStringField="fID" DefaultValue="0" Type="Int32" />
   </SelectParameters>
   <InsertParameters> 
     <asp:Parameter Name="FK_LANG" Type="Int32"/>
     <asp:Parameter Name="C_NAME" ConvertEmptyStringToNull="false" Type="String"/> 
     <asp:Parameter Name="C_VIDEO_FILE_NAME" Type="String"/>
     <asp:Parameter Name="C_IMAGE_FILE_NAME" Type="String"/>
     <asp:Parameter Name="C_ORDER" Type="Int32"/>
     <asp:Parameter Name="C_STATUS" Type="Int32"/>     
     <asp:Parameter Name="C_BEGIN_DATE" Type="dateTime"  />
     <asp:Parameter Name="C_END_DATE" Type="dateTime"  />
   </InsertParameters>
   <UpdateParameters>
     <asp:Parameter Name="PK_VIDEO" Type="Int32" />   
     <asp:Parameter Name="C_NAME" ConvertEmptyStringToNull="false" Type="String"/> 
     <asp:Parameter Name="C_VIDEO_FILE_NAME" Type="String"/>
     <asp:Parameter Name="C_IMAGE_FILE_NAME" Type="String"/>
     <asp:Parameter Name="C_ORDER" Type="Int32"/>
     <asp:Parameter Name="C_STATUS" Type="Int32"/>
     <asp:Parameter Name="C_BEGIN_DATE" Type="dateTime"  />
     <asp:Parameter Name="C_END_DATE" Type="dateTime"  />
   </UpdateParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="LangDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_LANG,C_TITLE FROM T_LANG"   
    >
</asp:SqlDataSource>