<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QVote.ascx.cs" Inherits="Admin_Modules_QVote" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>

<asp:DetailsView id="dvQVote" runat="server" DataSourceID="QVoteDataSource" 
     AutoGenerateRows="False" DataKeyNames="PK_QVOTE"  Width="100%" 
     DefaultMode="Insert" HorizontalAlign="Center" HeaderText="Thêm mới câu hỏi" OnItemCommand="dvQVote_ItemCommand" OnItemInserted="dvQVote_ItemInserted" OnItemInserting="dvQVote_ItemInserting" OnItemUpdated="dvQVote_ItemUpdated" OnItemUpdating="dvQVote_ItemUpdating" OnPreRender="dvQVote_PreRender">
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
        <asp:TemplateField HeaderText="T&#234;n câu hỏi">
            <EditItemTemplate>
							 <asp:TextBox ID="txtName" Width="400px" Text='<%# Bind("C_NAME") %>' runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="T&#234;n câu hỏi không thể rỗng" ControlToValidate="txtName" SetFocusOnError="True" ValidationGroup="vQVOTEG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
							 <asp:TextBox ID="txtName" Width="400px" Text='<%# Bind("C_NAME") %>' runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="T&#234;n câu hỏi không thể rỗng" ControlToValidate="txtName" SetFocusOnError="True" ValidationGroup="vQVOTEG1" Display="Dynamic">*</asp:RequiredFieldValidator>
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
                  <asp:Button ID="btnUpdate" ValidationGroup="vQVOTEG1" runat="server" CommandName="Update" Text="Sửa đổi" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </EditItemTemplate>
            <InsertItemTemplate>
               <div align="center">
                  <br />
                  <asp:Button ID="btnInsert" ValidationGroup="vQVOTEG1" runat="server" CommandName="Insert" Text="Th&#234;m mới" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </InsertItemTemplate>
        </asp:TemplateField>
    </Fields>
</asp:DetailsView> 
<asp:ValidationSummary ID="vsQVOTE" ValidationGroup="vQVOTEG1" ShowSummary="false" HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="true" />  

     
<asp:SqlDataSource ID="QVoteDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_QVOTE,FK_LANG,C_NAME,C_BEGIN_DATE,C_END_DATE,CONVERT(INT,C_STATUS) AS 'C_STATUS' FROM T_QVOTE WHERE PK_QVOTE=@PK_QVOTE"   
   InsertCommand="INSERT INTO T_QVOTE(FK_LANG,C_NAME,C_ORDER,C_ENTRY_DATE,C_BEGIN_DATE,C_END_DATE,C_STATUS) 
                              VALUES(@FK_LANG,@C_NAME,@C_ORDER,GETDATE(),@C_BEGIN_DATE,@C_END_DATE,@C_STATUS)" 
   UpdateCommand="UPDATE T_QVOTE SET C_NAME=@C_NAME,C_ORDER=ISNULL(@C_ORDER,C_ORDER),C_BEGIN_DATE=@C_BEGIN_DATE,C_END_DATE=@C_END_DATE,C_STATUS=@C_STATUS WHERE PK_QVOTE=@PK_QVOTE" 
    >
   <SelectParameters>
     <asp:QueryStringParameter Name="PK_QVOTE" QueryStringField="fID" DefaultValue="0" Type="Int32" />
   </SelectParameters>
   <InsertParameters>
     <asp:Parameter Name="FK_LANG" Type="Int32"/>
     <asp:Parameter Name="C_NAME" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_ORDER" Type="Int32"/>
     <asp:Parameter Name="C_BEGIN_DATE" Type="dateTime"/>
     <asp:Parameter Name="C_END_DATE" Type="dateTime"/>
     <asp:Parameter Name="C_STATUS" Type="Int32"/>
   </InsertParameters>
   <UpdateParameters>
     <asp:Parameter Name="PK_QVOTE" Type="Int32" />
     <asp:Parameter Name="C_NAME" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_ORDER" Type="Int32"/>
     <asp:Parameter Name="C_BEGIN_DATE" Type="dateTime"/>
     <asp:Parameter Name="C_END_DATE" Type="dateTime"/>
     <asp:Parameter Name="C_STATUS" Type="Int32"/>
   </UpdateParameters>
</asp:SqlDataSource>


<asp:SqlDataSource ID="LangDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_LANG,C_TITLE FROM T_LANG"   
    >
</asp:SqlDataSource>