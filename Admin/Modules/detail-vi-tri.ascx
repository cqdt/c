<%@ Control Language="C#" AutoEventWireup="true" CodeFile="detail-vi-tri.ascx.cs" Inherits="Admin_Modules_detail_vi_tri" %>


<asp:DetailsView id="dvAVote" runat="server" DataSourceID="AVoteDataSource" 
     AutoGenerateRows="False" DataKeyNames="ID"  Width="100%" 
     DefaultMode="Insert" HorizontalAlign="Center" HeaderText="Thêm mới" OnItemCommand="dvAVote_ItemCommand" 
     OnItemInserted="dvAVote_ItemInserted" OnItemInserting="dvAVote_ItemInserting" OnItemUpdated="dvAVote_ItemUpdated" OnItemUpdating="dvAVote_ItemUpdating">
    <Fields>
        <asp:TemplateField HeaderText="Mã">
            <EditItemTemplate>
                <asp:TextBox ID="txtName" Width="400px" Text='<%# Bind("C_MAVT") %>' runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="Mã không thể rỗng" ControlToValidate="txtName" SetFocusOnError="True" ValidationGroup="vAVOTEG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
				<asp:TextBox ID="txtName" Width="400px" Text='<%# Bind("C_MAVT") %>' runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="Mã không thể rỗng" ControlToValidate="txtName" SetFocusOnError="True" ValidationGroup="vAVOTEG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </InsertItemTemplate>
        </asp:TemplateField>


         <asp:TemplateField HeaderText="Vị trí">
            <EditItemTemplate>
                <asp:TextBox ID="C_VITRI_KR" Width="400px" Text='<%# Bind("C_VITRI_KR") %>' runat="server"></asp:TextBox>               
            </EditItemTemplate>
            <InsertItemTemplate>
				<asp:TextBox ID="C_VITRI_KR" Width="400px" Text='<%# Bind("C_VITRI_KR") %>' runat="server"></asp:TextBox>               
            </InsertItemTemplate>
        </asp:TemplateField>
       




         <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
               <div align="center">
                  <br />
                  <asp:Button ID="btnUpdate" ValidationGroup="vAVOTEG1" runat="server" CommandName="Update" Text="Sửa đổi" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </EditItemTemplate>
            <InsertItemTemplate>
               <div align="center">
                  <br />
                  <asp:Button ID="btnInsert" ValidationGroup="vAVOTEG1" runat="server" CommandName="Insert" Text="Th&#234;m mới" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </InsertItemTemplate>
        </asp:TemplateField>
    </Fields>
</asp:DetailsView> 
<asp:ValidationSummary ID="vsAVOTE" ValidationGroup="vAVOTEG1" ShowSummary="false" HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="true" />  

     
<asp:SqlDataSource ID="AVoteDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT * FROM T_DM_VITRI WHERE ID=@ID"   
   InsertCommand="INSERT INTO T_DM_VITRI(C_MAVT,C_NGHE_KR) 
                              VALUES(@C_MAVT,@C_NGHE_KR)" 
   UpdateCommand="UPDATE T_DM_VITRI SET C_MAVT=@C_MAVT,C_VITRI_KR=@C_VITRI_KR WHERE ID=@ID">
   <SelectParameters>
     <asp:QueryStringParameter Name="ID" QueryStringField="fID" DefaultValue="0" Type="Int32" />
   </SelectParameters>
   <InsertParameters>
     
     <asp:Parameter Name="C_MAVT" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_VITRI_KR" ConvertEmptyStringToNull="false" Type="String"/>
   </InsertParameters>
   <UpdateParameters>
     
     <asp:Parameter Name="C_MAVT" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_VITRI_KR" ConvertEmptyStringToNull="false" Type="String"/>
   </UpdateParameters>
</asp:SqlDataSource>


