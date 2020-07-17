<%@ Control Language="C#" AutoEventWireup="true" Inherits="CMS.TTV.Admin.User_Pass" %>


<asp:DetailsView id="dvUser_Pass" runat="server" DataSourceID="User_PassDataSource" 
      DataKeyNames="PK_USER" Width="100%" HorizontalAlign="Center" AutoGenerateRows="False" 
      DefaultMode="Edit" OnItemUpdating="dvUser_Pass_ItemUpdating" 
      HeaderText="Thay đổi password" OnItemUpdated="dvUser_Pass_ItemUpdated" >
     <Fields>
         <asp:TemplateField HeaderText="Mật khẩu cũ">
            <EditItemTemplate>
                 <asp:TextBox ID="txtPassword1" TextMode="Password" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rfvPassword1" runat="server" ErrorMessage="Mật khẩu cũ không thể rỗng" ControlToValidate="txtPassword1" SetFocusOnError="True"  ValidationGroup="User_PassG1" Display="Dynamic">*</asp:RequiredFieldValidator>
                 <asp:CustomValidator ID="cvPassword1" ControlToValidate="txtPassword1"  OnServerValidate="CheckPassword" runat="server" ErrorMessage="Sai mật khẩu cũ" ValidationGroup="User_PassG1" Display="Dynamic"></asp:CustomValidator>
            </EditItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Mật khẩu mới">
            <EditItemTemplate>
                 <asp:TextBox ID="txtPassword2" TextMode="Password" runat="server"></asp:TextBox>
                 <%-- <asp:RangeValidator ID="Value2RangeValidator"  ControlToValidate="txtPassword2" Type="Integer" MinimumValue="8" MaximumValue="32"
                    ErrorMessage="Bạn phải nhập tối thiểu 8 ký tự và tối đa 32 ký tự" ValidationGroup="User_PassG1"
                    Display="Dynamic"
                    runat="server"/>--%>
                 <asp:RequiredFieldValidator ID="rfvPassword2" runat="server" ErrorMessage="Mật khẩu mới không thể rỗng" ControlToValidate="txtPassword2" SetFocusOnError="True" ValidationGroup="User_PassG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="X&#225;c nhận">
            <EditItemTemplate>
                  <asp:TextBox ID="txtPassword3" TextMode="Password" runat="server"></asp:TextBox>
                  <asp:CompareValidator ID="cvPassword3" runat="server" ErrorMessage="Xác nhận mật khẩu không trùng nhau" ControlToCompare="txtPassword3" ControlToValidate="txtPassword2" SetFocusOnError="True" ValidationGroup="User_PassG1" Display="Dynamic">*</asp:CompareValidator>
                  <asp:ValidationSummary ID="vsUser_Pass"  ShowSummary="false" HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="True" ValidationGroup="User_PassG1" />   
            </EditItemTemplate>
         </asp:TemplateField>
         <asp:CommandField ShowEditButton="True" ItemStyle-HorizontalAlign="Center" ShowCancelButton="False" ValidationGroup="User_PassG1" UpdateText="Thay đổi password" ButtonType="Button" >
         </asp:CommandField>
     </Fields>
</asp:DetailsView> 
   
   
<asp:SqlDataSource ID="User_PassDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
     UpdateCommand="UPDATE [T_USER] SET C_PASSWORD=@C_PASSWORD WHERE PK_USER=@PK_USER"
     SelectCommand="SELECT [PK_USER] FROM [T_USER] WHERE [PK_USER]=@PK_USER"
    >
    <SelectParameters>
         <asp:Parameter Name="PK_USER" Type="int32" /> 
    </SelectParameters>
   <UpdateParameters>
         <asp:Parameter Name="PK_USER"  Type="int32" />
         <asp:Parameter Name="C_PASSWORD"  />
   </UpdateParameters> 
</asp:SqlDataSource>