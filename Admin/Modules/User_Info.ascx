<%@ Control Language="C#" AutoEventWireup="true" Inherits="CMS.TTV.Admin.User_Info" %>


<asp:DetailsView id="dvUser_Info" runat="server" DataSourceID="User_InfoDataSource" DataKeyNames="PK_USER" 
     Width="100%" HorizontalAlign="Center" AutoGenerateRows="False" 
     DefaultMode="Edit" HeaderText="Thay đổi thông tin" OnItemUpdated="dvUser_Info_ItemUpdated">
        <Fields>
           <asp:TemplateField HeaderText="Họ và T&#234;n">
                <EditItemTemplate>
                    <asp:TextBox ID="txtName" Text='<%# Bind("C_NAME") %>' runat="server"></asp:TextBox>  
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Họ và T&#234;n không thể rỗng" ControlToValidate="txtName" SetFocusOnError="True" ValidationGroup="User_InfoG1" Display="Dynamic">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
           </asp:TemplateField>
           <asp:TemplateField HeaderText="Email">
                <EditItemTemplate>
                    <asp:TextBox ID="txtEmail" Text='<%# Bind("C_EMAIL") %>' Width="200px" runat="server"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email không thể rỗng" ControlToValidate="txtEmail" SetFocusOnError="True" ValidationGroup="User_InfoG1" Display="Dynamic">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Email sai định dạng" ControlToValidate="txtEmail" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  ValidationGroup="User_InfoG1" Display="Dynamic">*</asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="cvEmail" ControlToValidate="txtEmail" OnServerValidate="CheckEmail" runat="server" ErrorMessage="Email đã tồn tại"  ValidationGroup="User_InfoG1" Display="Dynamic"></asp:CustomValidator>
                    <asp:ValidationSummary ID="vsUser_Info" ShowSummary="false" HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="True"  ValidationGroup="User_InfoG1" />   
                 </EditItemTemplate>
           </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" ItemStyle-HorizontalAlign="Center" ValidationGroup="User_InfoG1" ShowCancelButton="False" UpdateText="Thay đổi th&#244;ng tin" ButtonType="Button" >
            </asp:CommandField>
        </Fields>
</asp:DetailsView> 
   

   
<asp:SqlDataSource ID="User_InfoDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    UpdateCommand="UPDATE [T_USER] SET C_NAME=@C_NAME,C_EMAIL=@C_EMAIL WHERE PK_USER=@PK_USER"
     SelectCommand="SELECT PK_USER,C_NAME,C_EMAIL FROM [T_USER] WHERE PK_USER=@PK_USER">
    <SelectParameters>
        <asp:Parameter Name="PK_USER" Type="int32" />
    </SelectParameters>
   <UpdateParameters>
         <asp:Parameter Name="PK_USER" Type="int32" />
         <asp:Parameter Name="C_NAME" />
         <asp:Parameter Name="C_EMAIL" />
   </UpdateParameters> 
</asp:SqlDataSource>