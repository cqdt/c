<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddSetPass.ascx.cs" Inherits="Admin_Modules_AddSetPass" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 


<asp:DetailsView id="dvAdv" runat="server" DataSourceID="AdvDataSource" 
     AutoGenerateRows="False" DataKeyNames="PK_TT"  Width="100%" 
     DefaultMode="Insert" HorizontalAlign="Center" HeaderText="Thêm mới" OnItemCommand="dvAdv_ItemCommand" 
     OnItemInserted="dvAdv_ItemInserted" OnItemInserting="dvAdv_ItemInserting" OnItemUpdated="dvAdv_ItemUpdated" 
     OnItemUpdating="dvAdv_ItemUpdating">
    <Fields>
       
        <asp:TemplateField HeaderText="Mã trung tâm">
            <EditItemTemplate>
							 <asp:TextBox ID="txtCode" Width="400px" Text='<%# Bind("C_MA") %>' runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvCode" runat="server" ErrorMessage="Mã không thể rỗng" ControlToValidate="txtCode" SetFocusOnError="True" ValidationGroup="vADVG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
							 <asp:TextBox ID="txtCode" Width="400px" Text='<%# Bind("C_MA") %>' runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvCode" runat="server" ErrorMessage="Mã không thể rỗng" ControlToValidate="txtCode" SetFocusOnError="True" ValidationGroup="vADVG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="T&#234;n trung tâm">
            <EditItemTemplate>
							 <asp:TextBox ID="txtName" Width="400px" Text='<%# Bind("C_TEN") %>' runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="T&#234;n không thể rỗng" ControlToValidate="txtName" SetFocusOnError="True" ValidationGroup="vADVG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
							 <asp:TextBox ID="txtName" Width="400px" Text='<%# Bind("C_TEN") %>' runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="T&#234;n không thể rỗng" ControlToValidate="txtName" SetFocusOnError="True" ValidationGroup="vADVG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </InsertItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Mật khẩu">
            <EditItemTemplate>
				<asp:TextBox ID="txtpass" Width="400px" Text='<%# Bind("C_PASS") %>' runat="server"></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
				<asp:TextBox ID="txtpass" Width="400px" Text='<%# Bind("C_PASS") %>' runat="server"></asp:TextBox>
            </InsertItemTemplate>
            
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Điện thoại">
            <EditItemTemplate>
				<asp:TextBox ID="txtTel" Width="400px" Text='<%# Bind("C_TEL") %>' runat="server"></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
				<asp:TextBox ID="txtTel" Width="400px" Text='<%# Bind("C_TEL") %>' runat="server"></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Địa chỉ">
            <EditItemTemplate>
				<asp:TextBox ID="txtAdd" Width="400px" Text='<%# Bind("C_ADDRESS") %>' runat="server"></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
				<asp:TextBox ID="txtAdd" Width="400px" Text='<%# Bind("C_ADDRESS") %>' runat="server"></asp:TextBox>
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


<asp:SqlDataSource ID="AdvDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_TT,C_PASS,C_MA,C_TEN,C_TEL,C_ADDRESS,CONVERT(INT,C_STATUS) AS 'C_STATUS' FROM T_TT WHERE PK_TT=@PK_TT"   
   InsertCommand="INSERT INTO T_TT(C_MA,C_TEN,C_TEL,C_ADDRESS,C_STATUS,C_PASS) 
                              VALUES(@C_MA,@C_TEN,@C_TEL,@C_ADDRESS,@C_STATUS,@C_PASS)" 
   UpdateCommand="UPDATE T_TT SET C_MA=@C_MA,C_TEN=@C_TEN,C_TEL=@C_TEL,C_ADDRESS=@C_ADDRESS,C_STATUS=@C_STATUS,C_PASS=@C_PASS WHERE PK_TT=@PK_TT" 
    >
   <SelectParameters>
     <asp:QueryStringParameter Name="PK_TT" QueryStringField="fID" DefaultValue="0" Type="Int32" />
   </SelectParameters>
   <InsertParameters>   
     <asp:Parameter Name="C_MA" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_TEN" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_TEL" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_PASS" ConvertEmptyStringToNull="false" Type="String"/>
     
     <asp:Parameter Name="C_ADDRESS" Type="String"/>     
     <asp:Parameter Name="C_STATUS" Type="Int32"/>
   </InsertParameters>
   <UpdateParameters>
     <asp:Parameter Name="C_MA" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_TEN" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_TEL" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_PASS" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_ADDRESS" Type="String"/>     
     <asp:Parameter Name="C_STATUS" Type="Int32"/>
   </UpdateParameters>
</asp:SqlDataSource>
