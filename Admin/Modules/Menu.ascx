<%@ Control Language="C#" AutoEventWireup="true" Inherits="CMS.TTV.Admin.Menu" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 

      
<asp:DetailsView id="dvMenu" runat="server" DataSourceID="MenuDataSource" 
     AutoGenerateRows="False" DataKeyNames="PK_MENU"  Width="100%" 
     DefaultMode="Insert" HorizontalAlign="Center" HeaderText="Thêm mới chuyên mục" OnItemCommand="dvMenu_ItemCommand" OnItemInserted="dvMenu_ItemInserted" OnItemInserting="dvMenu_ItemInserting" OnItemUpdated="dvMenu_ItemUpdated" OnItemUpdating="dvMenu_ItemUpdating">
    <Fields>
        <asp:TemplateField HeaderText="T&#234;n chuy&#234;n mục">
            <EditItemTemplate>
               <asp:TextBox ID="txtName" Width="600px" runat="server" Text='<%# Bind("C_NAME") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="T&#234;n chuyên mục không thể rỗng" ControlToValidate="txtName" SetFocusOnError="True" ValidationGroup="vMenuG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtName" Width="600px" runat="server" Text='<%# Bind("C_NAME") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="T&#234;n chuyên mục không thể rỗng" ControlToValidate="txtName" SetFocusOnError="True" ValidationGroup="vMenuG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </InsertItemTemplate>
        </asp:TemplateField>
   <%--    <asp:TemplateField HeaderText="HIỂN THỊ TRANG CHỦ">
            <EditItemTemplate>
                <asp:RadioButtonList ID="rblRss8" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_HOME") %>'>
                     <asp:ListItem Text="Cho phép" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Không cho phép" Value="0"></asp:ListItem>
                </asp:RadioButtonList>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:RadioButtonList ID="rblRss8" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_HOME") %>'>
                     <asp:ListItem Text="Hiển thị" Selected="True" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Không hiển thị" Value="0"></asp:ListItem>
                </asp:RadioButtonList>
            </InsertItemTemplate>
        </asp:TemplateField>
        --%>
         <asp:TemplateField HeaderText="Link">
            <EditItemTemplate>
               <asp:TextBox ID="txtlink" Width="400px" runat="server" Text='<%# Bind("C_LINK") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtlink" Width="400px" runat="server" Text='<%# Bind("C_LINK") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>
        
         <asp:TemplateField HeaderText="Thứ tự" HeaderStyle-VerticalAlign="Top">
            <EditItemTemplate>
               <asp:TextBox ID="txtthutu" runat="server" Text='<%# Bind("C_ORDER") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtthutu" runat="server" Text='<%# Bind("C_ORDER") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
           
       <asp:TemplateField HeaderText="Dang thể hiện">
            <EditItemTemplate>
                <asp:RadioButtonList ID="rblRss" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_RSS") %>'>
                     <asp:ListItem Text="Nhiều ( đang tiếp nhận hồ sơ đối với đăng ký)" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Một (Không tiếp nhận)" Value="0"></asp:ListItem>
                </asp:RadioButtonList>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:RadioButtonList ID="rblRss" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_RSS") %>'>
                     <asp:ListItem Text="Danh sách" Selected="True" Value="1"></asp:ListItem>
                     <asp:ListItem Text="Chi tiết" Value="0"></asp:ListItem>
                </asp:RadioButtonList>
            </InsertItemTemplate>
        </asp:TemplateField>
        
         <asp:TemplateField HeaderText="Đường dẫn ảnh">
            <EditItemTemplate>
               <asp:TextBox ID="txtImage_file_name" Width="400px" runat="server" Text='<%# Bind("C_IMAGE_FILE_NAME") %>'></asp:TextBox>
               <asp:Button ID="btnShowImage" runat="server" OnClientClick="ShowForm();return false;" Text="Chọn ảnh" />
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtImage_file_name" Width="400px" runat="server" Text='<%# Bind("C_IMAGE_FILE_NAME") %>'></asp:TextBox>
               <asp:Button ID="btnShowImage" runat="server" OnClientClick="ShowForm();return false;" Text="Chọn ảnh" />
            </InsertItemTemplate>
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="Chuy&#234;n mục cha">
            <EditItemTemplate>
               <CMS:DropDownList Width="600px" ID="ddlParent" LText="Root" CssClass="ddlMenu" FieldValue="PK_MENU" TableName="T_MENU" LangValue='<%# Eval("FK_LANG") %>' Value='<%# Eval("PK_MENU") %>' runat="server"></CMS:DropDownList>
            </EditItemTemplate>
            <InsertItemTemplate>
               <CMS:DropDownList Width="600px" ID="ddlParent" LText="Root" CssClass="ddlMenu" FieldValue="PK_MENU" TableName="T_MENU" SelectedValue='<%# Bind("C_PARENT") %>' runat="server"></CMS:DropDownList>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ng&#244;n ngữ hiển thị">
            <EditItemTemplate>
               <CMS:Label ID="lblLang" TableName="T_LANG" PkVColumn='<%# Eval("FK_LANG") %>' Column="C_TITLE" PkColumn="PK_LANG" runat="server"></CMS:Label>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:DropDownList ID="ddlLang" SelectedValue='<%# Bind("FK_LANG") %>' DataSourceID="LangDataSource" DataTextField="C_TITLE" DataValueField="PK_LANG" runat="server" OnSelectedIndexChanged="ddlLang_SelectedIndexChanged" AutoPostBack="true">
                </asp:DropDownList>
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
                  <asp:Button ID="btnUpdate" ValidationGroup="vMenuG1" runat="server" CommandName="Update" Text="Sửa đổi" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </EditItemTemplate>
            <InsertItemTemplate>
               <div align="center">
                  <br />
                  <asp:Button ID="btnInsert" ValidationGroup="vMenuG1" runat="server" CommandName="Insert" Text="Th&#234;m mới" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </InsertItemTemplate>
        </asp:TemplateField>
    </Fields>
</asp:DetailsView> 
<asp:ValidationSummary ID="vsMenu" ValidationGroup="vMenuG1" ShowSummary="false" HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="true" />  
 <script type="text/javascript">
function ShowForm(ctlID)
{
   window.open("Article_Image.aspx?Dir=Menu_Image","","width=550, height=400, top=80, left=200,scrollbars=yes");
   return false;
}

function refreshPage(arg)
{
  document.getElementById("ctl00_cphCMS_ctl00_dvMenu_txtImage_file_name").value = arg;
}
</script>
     
<asp:SqlDataSource ID="MenuDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_MENU,FK_LANG,C_NAME,CONVERT(INT,C_RSS) AS 'C_RSS',C_PARENT,C_ORDER,CONVERT(INT,C_STATUS) AS 'C_STATUS',CONVERT(INT,C_HOME) AS 'C_HOME',C_LINK,C_IMAGE_FILE_NAME FROM T_MENU WHERE PK_MENU=@PK_MENU"   
   InsertCommand="INSERT INTO T_MENU(FK_LANG,C_TYPE,C_NAME,C_RSS,C_PARENT,C_ORDER,C_STATUS,C_LINK,C_IMAGE_FILE_NAME) VALUES(@FK_LANG,@C_TYPE,@C_NAME,@C_RSS,@C_PARENT,@C_ORDER,@C_STATUS,@C_LINK,@C_IMAGE_FILE_NAME)" 
   UpdateCommand="UPDATE T_MENU SET C_TYPE=ISNULL(@C_TYPE,C_TYPE),C_NAME=@C_NAME,C_RSS=@C_RSS,C_PARENT=@C_PARENT,C_ORDER=ISNULL(@C_ORDER,C_ORDER),C_STATUS=@C_STATUS,C_LINK=@C_LINK,C_IMAGE_FILE_NAME=@C_IMAGE_FILE_NAME,C_HOME=@C_HOME WHERE PK_MENU=@PK_MENU" 
    >
   <SelectParameters>
     <asp:QueryStringParameter Name="PK_MENU" QueryStringField="mID" DefaultValue="0" Type="Int32" />
   </SelectParameters>
   <InsertParameters>
     <asp:Parameter Name="FK_LANG" Type="Int32" DefaultValue="1"/>
     <asp:Parameter Name="C_TYPE" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_LINK" ConvertEmptyStringToNull="false" Type="String"/>     
     <asp:Parameter Name="C_NAME" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_IMAGE_FILE_NAME" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_RSS" Type="Int32" DefaultValue="0"/>
     <asp:Parameter Name="C_PARENT" Type="Int32" DefaultValue="0"/>
     <asp:Parameter Name="C_ORDER" Type="Int32" />
     
     <asp:Parameter Name="C_STATUS" Type="Int32" DefaultValue="0"/>
     <asp:Parameter Name="C_HOME" Type="Int32" DefaultValue="0"/>
   </InsertParameters>
   <UpdateParameters>
     <asp:Parameter Name="PK_MENU" Type="Int32" />
     <asp:Parameter Name="C_TYPE" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_LINK" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NAME" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_IMAGE_FILE_NAME" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_RSS" Type="Int32" DefaultValue="0"/>
     <asp:Parameter Name="C_PARENT" Type="Int32" />
     <asp:Parameter Name="C_ORDER" Type="Int32" />
     <asp:Parameter Name="C_STATUS" Type="Int32" DefaultValue="0"/>
      <asp:Parameter Name="C_HOME" Type="Int32" DefaultValue="0"/>
   </UpdateParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="LangDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_LANG,C_TITLE FROM T_LANG">
</asp:SqlDataSource>