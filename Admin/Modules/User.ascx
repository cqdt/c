<%@ Control Language="C#" AutoEventWireup="true" Inherits="CMS.TTV.Admin.User" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>


      
<asp:DetailsView id="dvUser" runat="server" DataSourceID="UserDataSource" 
     AutoGenerateRows="False" DataKeyNames="PK_User"  Width="100%" 
     DefaultMode="Insert" HorizontalAlign="Center" HeaderText="Thêm mới người sử dụng" OnItemCommand="dvUser_ItemCommand" OnItemInserted="dvUser_ItemInserted" OnItemInserting="dvUser_ItemInserting" OnItemUpdated="dvUser_ItemUpdated" OnItemUpdating="dvUser_ItemUpdating">
    <Fields>
       <asp:TemplateField HeaderText="Tên đăng nhập">
            <EditItemTemplate>
               <asp:TextBox ID="txtLogin_name" Width="200px" runat="server" Text='<%# Bind("C_LOGIN_NAME") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvLogin_name" runat="server" ErrorMessage="Tên đăng nhập không thể rỗng" ControlToValidate="txtLogin_name" SetFocusOnError="True" ValidationGroup="vUserG1" Display="Dynamic">*</asp:RequiredFieldValidator>
               <asp:CustomValidator ID="cvLogin_name" ControlToValidate="txtLogin_name" OnServerValidate="CheckLoginName" runat="server" ErrorMessage="Tên đăng nhập đã tồn tại" ValidationGroup="vUserG1" Display="Dynamic">Tên đăng nhập đã tồn tại</asp:CustomValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtLogin_name" Width="200px" runat="server" Text='<%# Bind("C_LOGIN_NAME") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvLogin_name" runat="server" ErrorMessage="Tên đăng nhập không thể rỗng" ControlToValidate="txtLogin_name" SetFocusOnError="True" ValidationGroup="vUserG1" Display="Dynamic">*</asp:RequiredFieldValidator>
               <asp:CustomValidator ID="cvLogin_name" ControlToValidate="txtLogin_name" OnServerValidate="CheckLoginName" runat="server" ErrorMessage="Tên đăng nhập đã tồn tại" ValidationGroup="vUserG1" Display="Dynamic">Tên đăng nhập đã tồn tại</asp:CustomValidator>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Mật khẩu">
            <EditItemTemplate>
               <asp:TextBox ID="txtPassword" Width="200px" TextMode="Password" runat="server" ></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtPassword" Width="200px" TextMode="Password" runat="server" ></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Mật khẩu không thể rỗng" ControlToValidate="txtPassword" SetFocusOnError="True" ValidationGroup="vUserG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Xác nhận mật khẩu">
            <EditItemTemplate>
               <asp:TextBox ID="txtCPassword" Width="200px" TextMode="Password" runat="server" ></asp:TextBox>
               <asp:CompareValidator ID="cvCPassword" runat="server" ErrorMessage="Xác nhận mật khẩu không trùng nhau" ControlToCompare="txtPassword" ControlToValidate="txtCPassword" SetFocusOnError="True" ValidationGroup="vUserG1" Display="Dynamic">*</asp:CompareValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtCPassword" Width="200px" TextMode="Password" runat="server" ></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvCPassword" runat="server" ErrorMessage="Xác nhận mật khẩu không thể rỗng" ControlToValidate="txtCPassword" SetFocusOnError="True" ValidationGroup="vUserG1" Display="Dynamic">*</asp:RequiredFieldValidator>
               <asp:CompareValidator ID="cvCPassword" runat="server" ErrorMessage="Xác nhận mật khẩu không trùng nhau" ControlToCompare="txtPassword" ControlToValidate="txtCPassword" SetFocusOnError="True" ValidationGroup="vUserG1" Display="Dynamic">*</asp:CompareValidator>
            </InsertItemTemplate>
        </asp:TemplateField>    
        <asp:TemplateField HeaderText="Họ và tên">
            <EditItemTemplate>
               <asp:TextBox ID="txtName" Width="200px" Text='<%# Bind("C_NAME") %>' runat="server" ></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Họ và tên không thể rỗng" ControlToValidate="txtName" SetFocusOnError="True" ValidationGroup="vUserG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtName" Width="200px" Text='<%# Bind("C_NAME") %>' runat="server" ></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Họ và tên không thể rỗng" ControlToValidate="txtName" SetFocusOnError="True" ValidationGroup="vUserG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </InsertItemTemplate>
        </asp:TemplateField>  
        <asp:TemplateField HeaderText="Số điện thoại">
            <EditItemTemplate>
               <asp:TextBox ID="txtTel" Width="200px" Text='<%# Bind("C_TEL") %>' runat="server" ></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtTel" Width="200px" Text='<%# Bind("C_TEL") %>' runat="server" ></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField> 
        <asp:TemplateField HeaderText="Email">
            <EditItemTemplate>
               <asp:TextBox ID="txtEmail" Width="200px" Text='<%# Bind("C_EMAIL") %>' runat="server" ></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email không thể rỗng" ControlToValidate="txtEmail" SetFocusOnError="True" ValidationGroup="vUserG1" Display="Dynamic">*</asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Sai định dạng Email" ControlToValidate="txtEmail" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="vUserG1" Display="Dynamic">*</asp:RegularExpressionValidator>
               <asp:CustomValidator ID="cvEmail" ControlToValidate="txtEmail" OnServerValidate="CheckEmail" runat="server" ErrorMessage="Email đã tồn tại" ValidationGroup="vUserG1" Display="Dynamic">Email đã tồn tại</asp:CustomValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtEmail" Width="200px" Text='<%# Bind("C_EMAIL") %>' runat="server" ></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email không thể rỗng" ControlToValidate="txtEmail" SetFocusOnError="True" ValidationGroup="vUserG1" Display="Dynamic">*</asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Sai định dạng Email" ControlToValidate="txtEmail" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="vUserG1" Display="Dynamic">*</asp:RegularExpressionValidator>
               <asp:CustomValidator ID="cvEmail" ControlToValidate="txtEmail" OnServerValidate="CheckEmail" runat="server" ErrorMessage="Email đã tồn tại" ValidationGroup="vUserG1" Display="Dynamic">Email đã tồn tại</asp:CustomValidator>
            </InsertItemTemplate>
        </asp:TemplateField> 
        <asp:TemplateField HeaderText="Ng&#224;y bắt đầu">
            <EditItemTemplate>
               <radCln:RadDatePicker MinDate="1900-01-01" ID="raddBegin_date" SelectedDate='<%# Bind("C_BEGIN_DATE") %>' Culture="vi-VN" runat="server"></radCln:RadDatePicker>
            </EditItemTemplate>
            <InsertItemTemplate>
               <radCln:RadDatePicker MinDate="1900-01-01" ID="raddBegin_date" SelectedDate='<%# Bind("C_BEGIN_DATE") %>' Culture="vi-VN" runat="server" OnLoad="raddBegin_date_Load"></radCln:RadDatePicker>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ng&#224;y kết th&#250;c">
            <EditItemTemplate>
               <radCln:RadDatePicker MinDate="1900-01-01" ID="raddEnd_date" SelectedDate='<%# Bind("C_END_DATE") %>' Culture="vi-VN" runat="server"></radCln:RadDatePicker>
            </EditItemTemplate>
            <InsertItemTemplate>
               <radCln:RadDatePicker MinDate="1900-01-01" ID="raddEnd_date" SelectedDate='<%# Bind("C_END_DATE") %>' Culture="vi-VN" runat="server" OnLoad="raddEnd_date_Load"></radCln:RadDatePicker>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Là người quản trị">
            <EditItemTemplate>
                <asp:RadioButtonList ID="rblIs_admin" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_IS_ADMIN") %>'>
                     <asp:ListItem Text="Cho phép" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Không cho phép" Value="0"></asp:ListItem>
                </asp:RadioButtonList>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:RadioButtonList ID="rblIs_admin" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_IS_ADMIN") %>'>
                     <asp:ListItem Text="Cho phép" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Không cho phép" Selected="True" Value="0"></asp:ListItem>
                </asp:RadioButtonList>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Quyền trên chuyên mục">
            <EditItemTemplate>
                <asp:GridView ID="gvMenu" DataKeyNames="PK_MENU" GridLines="None" AutoGenerateColumns="False" DataSourceID="MenuDataSource" OnInit="gvMenu_Init" runat="server" PageSize="100" Width="100%">
                    <Columns>
                       <asp:TemplateField HeaderText="Sửa tin">
                           <ItemTemplate>
                              <input name="chkMenuEdit" type="checkbox" value="<%# Eval("PK_MENU") %>" <%# CheckUserMenu(Eval("PK_MENU"),1) %> />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Duyệt tin">
                           <ItemTemplate>
                              <input name="chkMenuApprove" type="checkbox" value="<%# Eval("PK_MENU") %>" <%# CheckUserMenu(Eval("PK_MENU"),2) %> />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Nhập tin">
                           <ItemTemplate>
                              <input name="chkMenuView" type="checkbox" value="<%# Eval("PK_MENU") %>" <%# CheckUserMenu(Eval("PK_MENU"),3) %> />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Tên chuyên mục">
                           <ItemTemplate>
                              <CMS:Map ID="cmsMapMenus" CssClass="Link" runat="server" ModuleName="menus" Value='<%# Eval("PK_MENU") %>' ModuleText='<%# Eval("C_LANG_NAME") %>' FieldValue="PK_MENU" TableName="T_MENU" /> 
                           </ItemTemplate>
                           <ItemStyle HorizontalAlign="Left" />
                       </asp:TemplateField>
                   </Columns>
               </asp:GridView>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:GridView ID="gvMenu" DataKeyNames="PK_MENU" GridLines="None" AutoGenerateColumns="False" DataSourceID="MenuDataSource" runat="server" PageSize="100" Width="100%">
                    <Columns>
                       <asp:TemplateField HeaderText="Sửa tin">
                           <ItemTemplate>
                              <input name="chkMenuEdit" type="checkbox" value="<%# Eval("PK_MENU") %>" />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Duyệt tin">
                           <ItemTemplate>
                              <input name="chkMenuApprove" type="checkbox" value="<%# Eval("PK_MENU") %>" />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Nhập tin">
                           <ItemTemplate>
                              <input name="chkMenuView" type="checkbox" value="<%# Eval("PK_MENU") %>" />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Tên chuyên mục">
                           <ItemTemplate>
                              <CMS:Map ID="cmsMapMenus" CssClass="Link" runat="server" ModuleName="menus" Value='<%# Eval("PK_MENU") %>' ModuleText='<%# Eval("C_LANG_NAME") %>' FieldValue="PK_MENU" TableName="T_MENU" /> 
                           </ItemTemplate>
                           <ItemStyle HorizontalAlign="Left" />
                       </asp:TemplateField>
                   </Columns>
               </asp:GridView>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Quyền trên Module">
            <EditItemTemplate>
                <asp:GridView ID="gvModule" DataKeyNames="PK_MODULE" GridLines="None" AutoGenerateColumns="False" DataSourceID="ModuleDataSource" OnInit="gvModule_Init" runat="server" PageSize="100" Width="100%">
                    <Columns>
                       <asp:TemplateField HeaderText="Nhập liệu">
                           <ItemTemplate>
                              <input name="chkModuleEdit" type="checkbox" value="<%# Eval("PK_MODULE") %>" <%# CheckUserModule(Eval("PK_MODULE"),1) %> />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Sửa, Xóa">
                           <ItemTemplate>
                              <input name="chkModuleApprove" type="checkbox" value="<%# Eval("PK_MODULE") %>" <%# CheckUserModule(Eval("PK_MODULE"),2) %> />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Xem">
                           <ItemTemplate>
                              <input name="chkModuleView" type="checkbox" value="<%# Eval("PK_MODULE") %>" <%# CheckUserModule(Eval("PK_MODULE"),3) %> />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Tên Module">
                           <ItemTemplate>
                              <%# Eval("C_NAME")%>
                           </ItemTemplate>
                       </asp:TemplateField>
                   </Columns>
               </asp:GridView>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:GridView ID="gvModule" DataKeyNames="PK_MODULE" GridLines="None" AutoGenerateColumns="False" DataSourceID="ModuleDataSource" runat="server" PageSize="100" Width="100%">
                    <Columns>
                       <asp:TemplateField HeaderText="Nhập liệu">
                           <ItemTemplate>
                              <input name="chkModuleEdit" type="checkbox" value="<%# Eval("PK_MODULE") %>" />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Sửa, Xóa">
                           <ItemTemplate>
                              <input name="chkModuleApprove" type="checkbox" value="<%# Eval("PK_MODULE") %>" />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Xem">
                           <ItemTemplate>
                              <input name="chkModuleView" type="checkbox" value="<%# Eval("PK_MODULE") %>" />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Tên Module">
                           <ItemTemplate>
                              <%# Eval("C_NAME")%>
                           </ItemTemplate>
                       </asp:TemplateField>
                   </Columns>
               </asp:GridView>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Trạng th&#225;i">
            <EditItemTemplate>
               <asp:RadioButtonList ID="rblStatus" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_STATUS") %>'>
                     <asp:ListItem Text="Hoạt động" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Không hoạt động" Value="0"></asp:ListItem>
               </asp:RadioButtonList>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:RadioButtonList ID="rblStatus" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_STATUS") %>'>
                     <asp:ListItem Text="Hoạt động" Selected="True" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Không hoạt động" Value="0"></asp:ListItem>
               </asp:RadioButtonList>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
               <div align="center">
                  <br />
                  <asp:Button ID="btnUpdate" ValidationGroup="vUserG1" runat="server" CommandName="Update" Text="Sửa đổi" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </EditItemTemplate>
            <InsertItemTemplate>
               <div align="center">
                  <br />
                  <asp:Button ID="btnInsert" ValidationGroup="vUserG1" runat="server" CommandName="Insert" Text="Th&#234;m mới" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </InsertItemTemplate>
        </asp:TemplateField>
    </Fields>
</asp:DetailsView> 
<asp:ValidationSummary ID="vsUser" ValidationGroup="vUserG1" ShowSummary="false" HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="true" />  




<asp:SqlDataSource ID="UserDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_USER,C_LOGIN_NAME,C_NAME,C_TEL,C_EMAIL,C_BEGIN_DATE,C_END_DATE,CONVERT(INT,C_IS_ADMIN) AS 'C_IS_ADMIN',CONVERT(INT,C_STATUS) AS 'C_STATUS' FROM T_USER WHERE PK_USER=@PK_USER"   
   InsertCommand="INSERT INTO T_USER(C_LOGIN_NAME,C_PASSWORD,C_NAME,C_TEL,C_EMAIL,C_BEGIN_DATE,C_END_DATE,C_IS_ADMIN,C_STATUS) 
                                 VALUES(@C_LOGIN_NAME,@C_PASSWORD,@C_NAME,@C_TEL,@C_EMAIL,@C_BEGIN_DATE,@C_END_DATE,@C_IS_ADMIN,@C_STATUS)" 
   UpdateCommand="UPDATE T_USER SET C_LOGIN_NAME=@C_LOGIN_NAME,C_PASSWORD=ISNULL(@C_PASSWORD,C_PASSWORD),C_NAME=@C_NAME,C_TEL=@C_TEL,C_EMAIL=@C_EMAIL,C_BEGIN_DATE=@C_BEGIN_DATE,C_END_DATE=@C_END_DATE,C_IS_ADMIN=@C_IS_ADMIN,C_STATUS=@C_STATUS WHERE PK_USER=@PK_USER" 
    >
   <SelectParameters>
     <asp:QueryStringParameter Name="PK_USER" QueryStringField="uID" DefaultValue="0" Type="Int32" />
   </SelectParameters>
   <InsertParameters>
     <asp:Parameter Name="C_LOGIN_NAME" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_PASSWORD" ConvertEmptyStringToNull="false" Type="String" />
     <asp:Parameter Name="C_NAME" ConvertEmptyStringToNull="false" Type="String"  />
     <asp:Parameter Name="C_TEL" ConvertEmptyStringToNull="false" Type="String"  />
     <asp:Parameter Name="C_EMAIL" ConvertEmptyStringToNull="false" Type="String"  />
     <asp:Parameter Name="C_BEGIN_DATE" Type="dateTime"  />
     <asp:Parameter Name="C_END_DATE" Type="dateTime"  />
     <asp:Parameter Name="C_IS_ADMIN" Type="Int32"  />
     <asp:Parameter Name="C_STATUS" Type="Int32" DefaultValue="0"/>
   </InsertParameters>
   <UpdateParameters>
     <asp:Parameter Name="PK_USER" Type="Int32" />
     <asp:Parameter Name="C_LOGIN_NAME" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_PASSWORD" ConvertEmptyStringToNull="false" Type="String" />
     <asp:Parameter Name="C_NAME" ConvertEmptyStringToNull="false" Type="String"  />
     <asp:Parameter Name="C_TEL" ConvertEmptyStringToNull="false" Type="String"  />
     <asp:Parameter Name="C_EMAIL" ConvertEmptyStringToNull="false" Type="String"  />
     <asp:Parameter Name="C_BEGIN_DATE" Type="dateTime"  />
     <asp:Parameter Name="C_END_DATE" Type="dateTime"  />
     <asp:Parameter Name="C_IS_ADMIN" Type="Int32"  />
     <asp:Parameter Name="C_STATUS" Type="Int32" DefaultValue="0"/>
   </UpdateParameters>
</asp:SqlDataSource>


<asp:SqlDataSource ID="MenuDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT T_MENU.*,T_LANG.C_TITLE AS 'C_LANG_NAME' FROM T_MENU,T_LANG WHERE T_MENU.C_TYPE='ARTICLE' AND T_MENU.FK_LANG=T_LANG.PK_LANG ORDER BY T_MENU.FK_LANG,T_MENU.C_PARENT"
    >
</asp:SqlDataSource>


<asp:SqlDataSource ID="ModuleDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT * FROM T_MODULE"
    >
</asp:SqlDataSource>