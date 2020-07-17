<%@ Control Language="C#" AutoEventWireup="true" CodeFile="module1.ascx.cs" Inherits="Admin_Modules_module1" %>
<asp:DetailsView id="dvAdv" runat="server" DataSourceID="AdvDataSource" 
     AutoGenerateRows="False" DataKeyNames="PK_MODULE"  Width="100%" 
     DefaultMode="Insert" HorizontalAlign="Center" HeaderText="Thêm mới " OnItemCommand="dvAdv_ItemCommand" OnItemInserted="dvAdv_ItemInserted" OnItemInserting="dvAdv_ItemInserting" OnItemUpdated="dvAdv_ItemUpdated" OnItemUpdating="dvAdv_ItemUpdating" OnPreRender="dvAdv_PreRender">
    <Fields>

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
        <asp:TemplateField HeaderText="URL">
            <EditItemTemplate>
							 <asp:TextBox ID="txtUrl" Width="400px" Text='<%# Bind("C_TYPE") %>' runat="server"></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
							 <asp:TextBox ID="txtUrl" Width="400px" Text='<%# Bind("C_TYPE") %>' runat="server"></asp:TextBox>
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

<asp:SqlDataSource ID="AdvDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT * FROM T_MODULE WHERE PK_MODULE=@PK_MODULE"   
   InsertCommand="INSERT INTO T_MODULE(C_TYPE,C_NAME) 
                              VALUES(@C_TYPE,@C_NAME)" 
   UpdateCommand="UPDATE T_MODULE SET C_TYPE=@C_TYPE,C_NAME=@C_NAME WHERE PK_MODULE=@PK_MODULE" 
    >
   <SelectParameters>
     <asp:QueryStringParameter Name="PK_MODULE" QueryStringField="fID" DefaultValue="0" Type="Int32" />
   </SelectParameters>
   <InsertParameters>
     
     <asp:Parameter Name="C_TYPE" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NAME" ConvertEmptyStringToNull="false" Type="String"/>

   </InsertParameters>
   <UpdateParameters>
     <asp:Parameter Name="PK_MODULE" Type="Int32" />
     <asp:Parameter Name="C_TYPE" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NAME" ConvertEmptyStringToNull="false" Type="String"/>
    
   </UpdateParameters>
</asp:SqlDataSource>