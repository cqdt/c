<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Service.ascx.cs" Inherits="Admin_Modules_Service" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 
<%@ Register Assembly="RadEditor.Net2" Namespace="Telerik.WebControls" TagPrefix="radE" %>


<asp:DetailsView id="dvService" runat="server" DataSourceID="ServiceDataSource" 
     AutoGenerateRows="False" DataKeyNames="PK_SERVICE"  Width="100%" 
     DefaultMode="Insert" HorizontalAlign="Center" HeaderText="Thêm mới dịch vụ" OnItemCommand="dvService_ItemCommand" OnItemInserted="dvService_ItemInserted" OnItemInserting="dvService_ItemInserting" OnItemUpdated="dvService_ItemUpdated" OnItemUpdating="dvService_ItemUpdating" >
    <Fields>                          
         
        
        <asp:TemplateField HeaderText="Tên dịch vụ">
            <EditItemTemplate>
               <asp:TextBox ID="txtTitle" TextMode="MultiLine" Columns="80" Rows="5" Width="400px" runat="server" Text='<%# Bind("C_SERVICE_NAME") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="Tên không thể rỗng" ControlToValidate="txtTitle" SetFocusOnError="True" ValidationGroup="vProductG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtTitle" TextMode="MultiLine" Columns="80" Rows="5" Width="400px" runat="server" Text='<%# Bind("C_SERVICE_NAME") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="Tên không thể rỗng" ControlToValidate="txtTitle" SetFocusOnError="True" ValidationGroup="vProductG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Thời gian">
            <EditItemTemplate>
               <asp:TextBox ID="txtHead" Width="200px" runat="server" Text='<%# Bind("C_TIME") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtHead" Width="200px" runat="server" Text='<%# Bind("C_TIME") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Giá">
            <EditItemTemplate>
              <table>
                <tr>
                  <td>
                     <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("C_PRICE") %>'></asp:TextBox>
                     <asp:RangeValidator ID="rvPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="Giá phải là chữ số >=0" ValidationGroup="vProductG1" MaximumValue="9999999999" MinimumValue="0" SetFocusOnError="True" Type="Double" Display="Dynamic">*</asp:RangeValidator>
                  </td>
                  <td>
                     <asp:RadioButtonList ID="rblUnit" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_UNIT") %>'>
                          <asp:ListItem Text="VNĐ" Value="VNĐ"></asp:ListItem>
                          <asp:ListItem Text="USD" Value="USD"></asp:ListItem>
                    </asp:RadioButtonList>
                 </td>
                 </tr>
               </table>
            </EditItemTemplate>
            <InsertItemTemplate>
               <table>
                 <tr>
                   <td>
                      <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("C_PRICE") %>'></asp:TextBox>
                      <asp:RangeValidator ID="rvPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="Giá phải là chữ số >=0" ValidationGroup="vProductG1" MaximumValue="9999999999" MinimumValue="0" SetFocusOnError="True" Type="Double" Display="Dynamic">*</asp:RangeValidator>
                   </td>
                   <td>
                      <asp:RadioButtonList ID="rblUnit" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_UNIT") %>'>
                        <asp:ListItem Text="VNĐ" Selected="True" Value="VNĐ"></asp:ListItem>
                        <asp:ListItem Text="USD" Value="USD"></asp:ListItem>
                     </asp:RadioButtonList>
                   </td>
                 </tr>
               </table>
            </InsertItemTemplate>
        </asp:TemplateField>
                
         <asp:TemplateField HeaderText="Quốc tịch">
            <EditItemTemplate>
               <asp:RadioButtonList ID="rblStatus" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_COUNTRY") %>'>
                     <asp:ListItem Text="Việt Nam" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Nước ngoài" Value="0"></asp:ListItem>
               </asp:RadioButtonList>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:RadioButtonList ID="rblStatus" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_COUNTRY") %>'>
                     <asp:ListItem Text="Việt Nam"  Selected="True" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Nước ngoài" Value="0"></asp:ListItem>
               </asp:RadioButtonList>
            </InsertItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
               <div align="center">
                  <br />
                  <asp:Button ID="btnUpdate" ValidationGroup="vProductG1" runat="server" CommandName="Update" Text="Sửa đổi" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </EditItemTemplate>
            <InsertItemTemplate>
               <div align="center">
                  <br />
                  <asp:Button ID="btnInsert" ValidationGroup="vProductG1" runat="server" CommandName="Insert" Text="Th&#234;m mới" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </InsertItemTemplate>
        </asp:TemplateField>
    </Fields>
</asp:DetailsView> 
<asp:ValidationSummary ID="vsProduct" ValidationGroup="vProductG1" ShowSummary="false" HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="true" />  

    
     
<asp:SqlDataSource ID="ServiceDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT a.PK_SERVICE,a.C_SERVICE_NAME,a.C_TIME,a.C_UNIT,a.C_PRICE,CONVERT(INT,a.C_COUNTRY) AS C_COUNTRY FROM T_SERVICE a  WHERE a.PK_SERVICE=@PK_SERVICE"   
   InsertCommand="INSERT INTO T_SERVICE(C_SERVICE_NAME,C_TIME,C_PRICE,C_UNIT,C_COUNTRY) 
                              VALUES(@C_SERVICE_NAME,@C_TIME,@C_PRICE,@C_UNIT,@C_COUNTRY) " 
   UpdateCommand="UPDATE T_SERVICE SET C_SERVICE_NAME=@C_SERVICE_NAME,C_TIME=@C_TIME,C_PRICE=@C_PRICE,C_UNIT=@C_UNIT,C_COUNTRY=@C_COUNTRY WHERE PK_SERVICE=@PK_SERVICE" 
    >
   <SelectParameters>
     <asp:QueryStringParameter Name="PK_SERVICE" QueryStringField="sID" DefaultValue="0" Type="Int32" />     
    
   </SelectParameters>
   <InsertParameters>
   
     
     <asp:Parameter Name="C_SERVICE_NAME" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_TIME" ConvertEmptyStringToNull="false" Type="String"/>
    
     <asp:Parameter Name="C_UNIT" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_PRICE" Type="Double" DefaultValue="0"/>
     <asp:Parameter Name="C_COUNTRY" Type="Int32" DefaultValue="0" />
  
   </InsertParameters>
   <UpdateParameters>
   
    <asp:Parameter Name="C_SERVICE_NAME" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_TIME" ConvertEmptyStringToNull="false" Type="String"/>
    
     <asp:Parameter Name="C_UNIT" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_PRICE" Type="Double" DefaultValue="0"/>
     <asp:Parameter Name="C_COUNTRY" Type="Int32" DefaultValue="0" />
  
   </UpdateParameters>
</asp:SqlDataSource>
