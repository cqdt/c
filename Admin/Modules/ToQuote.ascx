<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ToQuote.ascx.cs" Inherits="Admin_Modules_ToQuote" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 


<asp:DetailsView id="dvToQuote" runat="server" DataSourceID="ToQuoteDataSource" 
     AutoGenerateRows="False" DataKeyNames="PK_TOQUOTE"  Width="100%" 
     DefaultMode="Insert" HorizontalAlign="Center" HeaderText="Thêm mới báo giá" OnItemCommand="dvToQuote_ItemCommand" OnItemInserted="dvToQuote_ItemInserted" OnItemInserting="dvToQuote_ItemInserting" OnItemUpdated="dvToQuote_ItemUpdated" OnItemUpdating="dvToQuote_ItemUpdating" OnPreRender="dvToQuote_PreRender">
    <Fields>
        <asp:TemplateField HeaderText="Ng&#244;n ngữ hiển thị">
            <EditItemTemplate>
               <CMS:Label ID="lblLang" TableName="T_LANG" Column="C_TITLE" PkColumn="PK_LANG" runat="server"></CMS:Label>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:DropDownList ID="ddlLang" DataSourceID="LangDataSource" DataTextField="C_TITLE" SelectedValue='<%# Bind("FK_LANG") %>' DataValueField="PK_LANG" runat="server" >
                </asp:DropDownList>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="T&#234;n">
            <EditItemTemplate>
							 <asp:TextBox ID="txtName" Width="400px" Text='<%# Bind("C_NAME") %>' runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="T&#234;n không thể rỗng" ControlToValidate="txtName" SetFocusOnError="True" ValidationGroup="vTOQUOTEG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
							 <asp:TextBox ID="txtName" Width="400px" Text='<%# Bind("C_NAME") %>' runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="T&#234;n không thể rỗng" ControlToValidate="txtName" SetFocusOnError="True" ValidationGroup="vTOQUOTEG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Đường dẫn file">
            <EditItemTemplate>
               <asp:TextBox ID="txtfile_name" Width="400px" runat="server" Text='<%# Bind("C_FILE_NAME") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvfile_name" runat="server" ErrorMessage="Đường dẫn file không thể rỗng" ControlToValidate="txtfile_name" SetFocusOnError="True" ValidationGroup="vTOQUOTEG1" Display="Dynamic">*</asp:RequiredFieldValidator>
               <asp:Button ID="btnShowImage" runat="server" OnClientClick="ShowForm();return false;" Text="Chọn ảnh" />
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtfile_name" Width="400px" runat="server" Text='<%# Bind("C_FILE_NAME") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvfile_name" runat="server" ErrorMessage="Đường dẫn file không thể rỗng" ControlToValidate="txtfile_name" SetFocusOnError="True" ValidationGroup="vTOQUOTEG1" Display="Dynamic">*</asp:RequiredFieldValidator>
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
                  <asp:Button ID="btnUpdate" ValidationGroup="vTOQUOTEG1" runat="server" CommandName="Update" Text="Sửa đổi" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </EditItemTemplate>
            <InsertItemTemplate>
               <div align="center">
                  <br />
                  <asp:Button ID="btnInsert" ValidationGroup="vTOQUOTEG1" runat="server" CommandName="Insert" Text="Th&#234;m mới" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </InsertItemTemplate>
        </asp:TemplateField>
    </Fields>
</asp:DetailsView> 
<asp:ValidationSummary ID="vsTOQUOTE" ValidationGroup="vTOQUOTEG1" ShowSummary="false" HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="true" />  


<script type="text/javascript">
function ShowForm(ctlID)
{
   window.open("Text_File.aspx?Dir=Docs","","width=550, height=400, top=80, left=200,scrollbars=yes");
   return false;
}

function refreshPage(arg)
{
   document.getElementById("ctl00_cphCMS_ctl00_dvToQuote_txtfile_name").value = arg;
}
</script>


<asp:SqlDataSource ID="ToQuoteDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_TOQUOTE,FK_LANG,C_NAME,C_FILE_NAME,CONVERT(INT,C_STATUS) AS 'C_STATUS' FROM T_TOQUOTE WHERE PK_TOQUOTE=@PK_TOQUOTE"   
   InsertCommand="INSERT INTO T_TOQUOTE(FK_LANG,C_NAME,C_ORDER,C_FILE_NAME,C_STATUS,C_DATE) 
                              VALUES(@FK_LANG,@C_NAME,@C_ORDER,@C_FILE_NAME,@C_STATUS,GETDATE())" 
   UpdateCommand="UPDATE T_TOQUOTE SET C_NAME=@C_NAME,C_ORDER=ISNULL(@C_ORDER,C_ORDER),C_FILE_NAME=@C_FILE_NAME,C_STATUS=@C_STATUS,C_DATE=GETDATE() WHERE PK_TOQUOTE=@PK_TOQUOTE" 
    >
   <SelectParameters>
     <asp:QueryStringParameter Name="PK_TOQUOTE" QueryStringField="fID" DefaultValue="0" Type="Int32" />
   </SelectParameters>
   <InsertParameters>
     <asp:Parameter Name="FK_LANG" Type="Int32"/>
     <asp:Parameter Name="C_NAME" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_FILE_NAME" Type="String"/>
     <asp:Parameter Name="C_ORDER" Type="Int32"/>
     <asp:Parameter Name="C_STATUS" Type="Int32"/>
   </InsertParameters>
   <UpdateParameters>
     <asp:Parameter Name="PK_TOQUOTE" Type="Int32" />
     <asp:Parameter Name="C_NAME" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_FILE_NAME" Type="String"/>
     <asp:Parameter Name="C_ORDER" Type="Int32"/>
     <asp:Parameter Name="C_STATUS" Type="Int32"/>
   </UpdateParameters>
</asp:SqlDataSource>


<asp:SqlDataSource ID="LangDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_LANG,C_TITLE FROM T_LANG"   
    >
</asp:SqlDataSource>