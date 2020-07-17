<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Lang.ascx.cs" Inherits="Admin_Modules_Lang" %>

<div>
        <asp:DropDownList id="ddlLang" runat="server" DataSourceID="LangDataSource" DataTextField="C_TITLE" DataValueField="C_NAME" AutoPostBack="True" OnPreRender="ddlLang_PreRender"></asp:DropDownList> 
        <asp:TextBox id="txtSearch" runat="server"></asp:TextBox> 
        <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" />
            
        <asp:GridView id="gvLocalization" runat="server" DataSourceID="LocalizationDataSource" DataKeyNames="ResourceID" 
            AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" OnRowCreated="gvLocalization_RowCreated" OnRowDeleted="gvLocalization_RowDeleted" OnRowUpdated="gvLocalization_RowUpdated" PageSize="30">
            <Columns>
                <asp:CommandField ShowEditButton="True" CancelText="Hủy" EditText="Sửa" UpdateText="Cập nhập" HeaderText="Sửa" ButtonType="Image" EditImageUrl="~/Admin/Images/Edit.png" CancelImageUrl="~/Admin/Images/recycle.png" UpdateImageUrl="~/Admin/Images/ok.png" >
                        <ItemStyle Width="40px" />
                </asp:CommandField>
                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Admin/Images/Delete.png" DeleteText="X&#243;a"
                    HeaderText="X&#243;a" ShowDeleteButton="True" >
                    <ItemStyle Width="30px" />
                 </asp:CommandField>
                <asp:TemplateField SortExpression="ResourceKey" HeaderText="Key">
                      <ItemTemplate>
                           <asp:Label ID="ResourceKey" Text='<%# Eval("ResourceKey") %>' runat="server"></asp:Label>                   
                      </ItemTemplate>
                      <EditItemTemplate>
                           <asp:TextBox ID="ResourceKey" runat="server" Text='<%# Bind("ResourceKey") %>'>
                           </asp:TextBox>
                           <asp:RequiredFieldValidator ID="rfvResourceKey" runat="server" ErrorMessage="Key không thể rỗng" ControlToValidate="ResourceKey" SetFocusOnError="True" >*</asp:RequiredFieldValidator>
                      </EditItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField SortExpression="ResourceValue" HeaderText="Gi&#225; trị">
                      <ItemTemplate>
                           <asp:Label ID="ResourceValue" Text='<%# Eval("ResourceValue") %>' runat="server"></asp:Label>                   
                      </ItemTemplate>
                      <EditItemTemplate>
                           <asp:TextBox ID="ResourceValue" TextMode="MultiLine" Columns="20" Height="100px"  runat="server" Text='<%# Bind("ResourceValue") %>'>
                           </asp:TextBox>
                           <asp:RequiredFieldValidator ID="rfvResourceValue" runat="server" ErrorMessage="Giá trị không thể rỗng" ControlToValidate="ResourceValue" SetFocusOnError="True" >*</asp:RequiredFieldValidator>
                      </EditItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField SortExpression="VirtualPath" HeaderText="T&#234;n file">
                      <ItemTemplate>
                           <asp:Label ID="VirtualPath" Text='<%# Eval("VirtualPath") %>' runat="server"></asp:Label>                   
                      </ItemTemplate>
                      <EditItemTemplate>
                           <asp:TextBox ID="VirtualPath" runat="server" Text='<%# Bind("VirtualPath") %>'>
                           </asp:TextBox>
                           <asp:RequiredFieldValidator ID="rfvVirtualPath" runat="server" ErrorMessage="Tên file không thể rỗng" ControlToValidate="VirtualPath" SetFocusOnError="True" >*</asp:RequiredFieldValidator>
                      </EditItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField SortExpression="LocaleID" HeaderText="Ng&#244;n ngữ">
                      <ItemTemplate>
                           <asp:Label ID="LocaleID" Text='<%# Eval("LocaleID") %>' runat="server"></asp:Label>                   
                      </ItemTemplate>
                      <EditItemTemplate>
                           <asp:DropDownList ID="LocaleID" DataSourceID="LangDataSource" DataTextField="C_TITLE" DataValueField="C_NAME" runat="server" SelectedValue='<%# Bind("LocaleID") %>'>
                           </asp:DropDownList> 
                      </EditItemTemplate>
                 </asp:TemplateField>
            </Columns>
        </asp:GridView> 
        <asp:ValidationSummary ID="vsLangs" ShowSummary="false" HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="True"/>   

        <br />

        <asp:DetailsView id="dvLocalization" runat="server" DataSourceID="LocalizationDataSource" 
             AutoGenerateRows="False" DataKeyNames="ResourceID" 
              DefaultMode="Insert" HorizontalAlign="Center" HeaderText="Thêm"  
              OnItemInserted="dvLocalization_ItemInserted" OnItemInserting="dvLocalization_ItemInserting" >
            <Fields>
                <asp:TemplateField HeaderText="Key">
                    <InsertItemTemplate>
                      <asp:TextBox ID="ResourceKey" Width="300px" runat="server" Text='<%# Bind("ResourceKey") %>'></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rfvResourceKey" runat="server" ErrorMessage="Key không thể rỗng" ControlToValidate="ResourceKey" SetFocusOnError="True" ValidationGroup="G1">*</asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Gi&#225; trị">
                   <InsertItemTemplate>
                      <asp:TextBox ID="ResourceValue" TextMode="MultiLine" Columns="50" Height="100px" runat="server" Text='<%# Bind("ResourceValue") %>'></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rfvResourceValue" runat="server" ErrorMessage="Giá trị không thể rỗng" ControlToValidate="ResourceValue" SetFocusOnError="True" ValidationGroup="G1">*</asp:RequiredFieldValidator>
                   </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="T&#234;n file">
                   <InsertItemTemplate>
                      <asp:TextBox ID="VirtualPath" runat="server" Text='<%# Bind("VirtualPath") %>'></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rfvVirtualPath" runat="server" ErrorMessage="Tên file không thể rỗng" ControlToValidate="VirtualPath" SetFocusOnError="True" ValidationGroup="G1">*</asp:RequiredFieldValidator>
                   </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ng&#244;n ngữ">
                   <InsertItemTemplate>
                      <asp:DropDownList ID="LocaleID" DataSourceID="LangDataSource" DataTextField="C_TITLE" DataValueField="C_NAME" runat="server" SelectedValue='<%# Bind("LocaleID") %>'></asp:DropDownList> 
                   </InsertItemTemplate>
                </asp:TemplateField>
                <asp:CommandField NewText="Th&#234;m" ShowCancelButton="False" CancelText="Hủy" InsertText="Th&#234;m" ValidationGroup="G1" ShowInsertButton="True" ButtonType="Button">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:CommandField>
            </Fields>
         </asp:DetailsView> 
        <asp:ValidationSummary ID="vsLocalization" ValidationGroup="G1" ShowSummary="false" HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="True"/>   
           
            
        <asp:SqlDataSource ID="LocalizationDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
           SelectCommand="SELECT * FROM [T_ResourceString]  WHERE ((@LocaleID='-1') OR (LocaleID=@LocaleID)) AND ([ResourceKey] LIKE '%' + @txtSearch + '%') ORDER BY [VirtualPath],[ResourceKey]" 
           DeleteCommand="DELETE FROM [T_ResourceString] WHERE ResourceID=@ResourceID"
           InsertCommand="INSERT INTO [T_ResourceString]([ResourceKey],[LocaleID],[ResourceValue],[VirtualPath]) VALUES(@ResourceKey,@LocaleID,@ResourceValue,@VirtualPath)"
           UpdateCommand="UPDATE [T_ResourceString] SET [ResourceKey]=@ResourceKey,[LocaleID]=@LocaleID,[ResourceValue]=@ResourceValue,[VirtualPath]=@VirtualPath WHERE [ResourceID]=@ResourceID"
           >
            <DeleteParameters>
               <asp:Parameter Name="ResourceID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                    <asp:ControlParameter Name="LocaleID" ControlID="ddlLang" DefaultValue="-1" />
                    <asp:ControlParameter Name="txtSearch" Type="String" ControlID="txtSearch" PropertyName="Text" ConvertEmptyStringToNull="False" />
            </SelectParameters>
            <InsertParameters>
               <asp:Parameter Name="ResourceKey" />
               <asp:Parameter Name="LocaleID" />
               <asp:Parameter Name="ResourceValue" />
               <asp:Parameter Name="VirtualPath" />
            </InsertParameters>
            <UpdateParameters>
               <asp:Parameter Name="ResourceID" Type="Int32" />
               <asp:Parameter Name="ResourceKey" />
               <asp:Parameter Name="LocaleID" />
               <asp:Parameter Name="ResourceValue" />
               <asp:Parameter Name="VirtualPath" />
            </UpdateParameters>
        </asp:SqlDataSource>
             
             
        <asp:SqlDataSource ID="LangDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [C_NAME],[C_TITLE] FROM [T_LANG]" >
        </asp:SqlDataSource>
    </div>