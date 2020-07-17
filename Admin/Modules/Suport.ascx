<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Suport.ascx.cs" Inherits="Admin_Modules_Suport" %>
<%@ Register Assembly="CMS" Namespace="CMS.Web.Controls" TagPrefix="CMS" %>

    <asp:DetailsView ID="dvSuports" runat="server" AutoGenerateRows="False" DataKeyNames="PK_SUPORT"
    DataSourceID="SuportDataSource" DefaultMode="Insert" HeaderText="Thêm mới hỗ trợ trực tuyến"
    HorizontalAlign="Center" OnItemCommand="dvSuports_ItemCommand" OnItemInserted="dvSuports_ItemInserted"
    OnItemInserting="dvSuports_ItemInserting" OnItemUpdated="dvSuports_ItemUpdated" OnItemUpdating="dvSuports_ItemUpdating"
    Width="100%">
    <Fields>
       
        <asp:TemplateField HeaderText="Yahoooooo">
            <EditItemTemplate>
                <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("C_YAHOO") %>' Width="400px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtName"
                    Display="Dynamic" ErrorMessage="T&#234;n không thể rỗng" SetFocusOnError="True"
                    ValidationGroup="vADVG1">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("C_YAHOO") %>' Width="400px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtName"
                    Display="Dynamic" ErrorMessage="T&#234;n không thể rỗng" SetFocusOnError="True"
                    ValidationGroup="vADVG1">*</asp:RequiredFieldValidator>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Phụ trách">
            <EditItemTemplate>
                <asp:TextBox ID="txtUrl" runat="server" Text='<%# Bind("C_NAME") %>' Width="400px"></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtUrl" runat="server" Text='<%# Bind("C_NAME") %>' Width="400px"></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Điện thoại">
            <EditItemTemplate>
                <asp:TextBox ID="txtTel" runat="server" Text='<%# Bind("C_TEL") %>' Width="400px"></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtTel" runat="server" Text='<%# Bind("C_TEL") %>' Width="400px"></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
     
        <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
                <div align="center">
                    <br />
                    <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Sửa đổi" ValidationGroup="vADVG1" />
                    <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
                </div>
            </EditItemTemplate>
            <InsertItemTemplate>
                <div align="center">
                    <br />
                    <asp:Button ID="btnInsert" runat="server" CommandName="Insert" Text="Th&#234;m mới"
                        ValidationGroup="vADVG1" />
                    <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
                </div>
            </InsertItemTemplate>
        </asp:TemplateField>
    </Fields>
</asp:DetailsView>
<asp:ValidationSummary ID="vsADV" runat="server" HeaderText="Vui lòng kiểm tra lại :"
    ShowMessageBox="true" ShowSummary="false" ValidationGroup="vADVG1" />


<asp:SqlDataSource ID="SuportDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    InsertCommand="INSERT INTO T_SUPORT(C_NAME,C_YAHOO,C_TEL) 
                             VALUES(@C_NAME,@C_YAHOO,@C_TEL)"
    SelectCommand="SELECT * FROM T_SUPORT WHERE PK_SUPORT=@PK_SUPORT"
    UpdateCommand="UPDATE T_SUPORT SET C_NAME=@C_NAME,C_YAHOO=@C_YAHOO,C_TEL=@C_TEL WHERE PK_SUPORT=@PK_SUPORT">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="PK_SUPORT" QueryStringField="sID" Type="Int32" />
    </SelectParameters>
    <InsertParameters>
       <asp:Parameter ConvertEmptyStringToNull="false" Name="C_TEL" Type="String" />
        <asp:Parameter ConvertEmptyStringToNull="false" Name="C_NAME" Type="String" />
        <asp:Parameter ConvertEmptyStringToNull="false" Name="C_LINK" Type="String" />
       
    </InsertParameters>
    <UpdateParameters>      
       <asp:Parameter ConvertEmptyStringToNull="false" Name="C_TEL" Type="String" />
        <asp:Parameter ConvertEmptyStringToNull="false" Name="C_NAME" Type="String" />
        <asp:Parameter ConvertEmptyStringToNull="false" Name="C_LINK" Type="String" />
       
              
    </UpdateParameters>
</asp:SqlDataSource>
