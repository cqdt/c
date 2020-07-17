<%@ Control Language="C#" AutoEventWireup="true" CodeFile="phien-gdvl-detail.ascx.cs"
    Inherits="Admin_Modules_phien_gdvl_detail" %>
<asp:DetailsView ID="dvAVote" runat="server" DataSourceID="AVoteDataSource" AutoGenerateRows="False"
    DataKeyNames="ID" Width="100%" DefaultMode="Insert" HorizontalAlign="Center"
    HeaderText="Thêm mới" OnItemCommand="dvAVote_ItemCommand" OnItemInserted="dvAVote_ItemInserted"
    OnItemInserting="dvAVote_ItemInserting" OnItemUpdated="dvAVote_ItemUpdated" OnItemUpdating="dvAVote_ItemUpdating">
    <Fields>
        <asp:TemplateField HeaderText="Phiên GDVL">
            <EditItemTemplate>
                <asp:TextBox ID="txtName" Width="400px" Text='<%# Bind("C_PHIEN") %>' runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="T&#234;n không thể rỗng"
                    ControlToValidate="txtName" SetFocusOnError="True" ValidationGroup="vAVOTEG1"
                    Display="Dynamic">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtName" Width="400px" Text='<%# Bind("C_PHIEN") %>' runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="T&#234;n không thể rỗng"
                    ControlToValidate="txtName" SetFocusOnError="True" ValidationGroup="vAVOTEG1"
                    Display="Dynamic">*</asp:RequiredFieldValidator>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
                <div align="center">
                    <br />
                    <asp:Button ID="btnUpdate" ValidationGroup="vAVOTEG1" runat="server" CommandName="Update"
                        Text="Sửa đổi" />
                    <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
                </div>
            </EditItemTemplate>
            <InsertItemTemplate>
                <div align="center">
                    <br />
                    <asp:Button ID="btnInsert" ValidationGroup="vAVOTEG1" runat="server" CommandName="Insert"
                        Text="Th&#234;m mới" />
                    <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
                </div>
            </InsertItemTemplate>
        </asp:TemplateField>
    </Fields>
</asp:DetailsView>
<asp:ValidationSummary ID="vsAVOTE" ValidationGroup="vAVOTEG1" ShowSummary="false"
    HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="true" />

<asp:SqlDataSource ID="AVoteDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT * FROM T_PHIEN_GDVL WHERE ID=@ID" 
    InsertCommand="INSERT INTO T_PHIEN_GDVL(C_PHIEN,C_NGAY) 
                              VALUES(@C_PHIEN,GETDATE())" 
    UpdateCommand="UPDATE T_PHIEN_GDVL SET C_PHIEN=@C_PHIEN WHERE ID=@ID">
    <SelectParameters>
        <asp:QueryStringParameter Name="ID" QueryStringField="fID" DefaultValue="0" Type="Int32" />
    </SelectParameters>
    <InsertParameters>
        <asp:Parameter Name="C_NAME" ConvertEmptyStringToNull="false" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="ID" Type="Int32" />
        <asp:Parameter Name="C_NAME" ConvertEmptyStringToNull="false" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
