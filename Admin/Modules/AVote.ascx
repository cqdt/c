<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AVote.ascx.cs" Inherits="Admin_Modules_AVote" %>



<asp:DetailsView id="dvAVote" runat="server" DataSourceID="AVoteDataSource" 
     AutoGenerateRows="False" DataKeyNames="PK_AVOTE"  Width="100%" 
     DefaultMode="Insert" HorizontalAlign="Center" HeaderText="Thêm mới câu trả lời" OnItemCommand="dvAVote_ItemCommand" OnItemInserted="dvAVote_ItemInserted" OnItemInserting="dvAVote_ItemInserting" OnItemUpdated="dvAVote_ItemUpdated" OnItemUpdating="dvAVote_ItemUpdating">
    <Fields>
        <asp:TemplateField HeaderText="T&#234;n câu trả lời">
            <EditItemTemplate>
							 <asp:TextBox ID="txtName" Width="400px" Text='<%# Bind("C_NAME") %>' runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="T&#234;n câu trả lời không thể rỗng" ControlToValidate="txtName" SetFocusOnError="True" ValidationGroup="vAVOTEG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
							 <asp:TextBox ID="txtName" Width="400px" Text='<%# Bind("C_NAME") %>' runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="T&#234;n câu trả lời không thể rỗng" ControlToValidate="txtName" SetFocusOnError="True" ValidationGroup="vAVOTEG1" Display="Dynamic">*</asp:RequiredFieldValidator>
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
                  <asp:Button ID="btnUpdate" ValidationGroup="vAVOTEG1" runat="server" CommandName="Update" Text="Sửa đổi" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </EditItemTemplate>
            <InsertItemTemplate>
               <div align="center">
                  <br />
                  <asp:Button ID="btnInsert" ValidationGroup="vAVOTEG1" runat="server" CommandName="Insert" Text="Th&#234;m mới" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </InsertItemTemplate>
        </asp:TemplateField>
    </Fields>
</asp:DetailsView> 
<asp:ValidationSummary ID="vsAVOTE" ValidationGroup="vAVOTEG1" ShowSummary="false" HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="true" />  

     
<asp:SqlDataSource ID="AVoteDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_AVOTE,C_NAME,CONVERT(INT,C_STATUS) AS 'C_STATUS' FROM T_AVOTE WHERE PK_AVOTE=@PK_AVOTE"   
   InsertCommand="INSERT INTO T_AVOTE(FK_QVOTE,C_NAME,C_HITS,C_ORDER,C_STATUS) 
                              VALUES(@FK_QVOTE,@C_NAME,0,@C_ORDER,@C_STATUS)" 
   UpdateCommand="UPDATE T_AVOTE SET C_NAME=@C_NAME,C_STATUS=@C_STATUS WHERE PK_AVOTE=@PK_AVOTE" 
    >
   <SelectParameters>
     <asp:QueryStringParameter Name="PK_AVOTE" QueryStringField="fID" DefaultValue="0" Type="Int32" />
   </SelectParameters>
   <InsertParameters>
     <asp:QueryStringParameter Name="FK_QVOTE" QueryStringField="pID" Type="int32" DefaultValue="-1" />
     <asp:Parameter Name="C_NAME" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_ORDER" Type="Int32"/>
     <asp:Parameter Name="C_STATUS" Type="Int32"/>
   </InsertParameters>
   <UpdateParameters>
     <asp:Parameter Name="PK_AVOTE" Type="Int32" />
     <asp:Parameter Name="C_NAME" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_STATUS" Type="Int32"/>
   </UpdateParameters>
</asp:SqlDataSource>


<asp:SqlDataSource ID="LangDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_LANG,C_TITLE FROM T_LANG"   
    >
</asp:SqlDataSource>