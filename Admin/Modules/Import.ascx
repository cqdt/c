<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Import.ascx.cs" Inherits="Admin_Modules_Import" %>
<center>
   <br /><br />
   <h1>
       
   <asp:Label ID="lblthongbao" runat="server" Text=""></asp:Label>

   </h1>
   <h2>
   Tải file mẫu <a href="<%= Newwind.VQS.URL %>/admin/temp/import_khaibao.xls"> tại đây</a></h2>
     <br />
   </center>


<asp:DetailsView id="dvExcel" runat="server"
     AutoGenerateRows="False" Width="40%" 
     DefaultMode="Insert" HorizontalAlign="Center" 
    HeaderText="Bạn chọn file Excel">
    <Fields>       
    
               
          
        <asp:TemplateField HeaderText="File Excel">
            <InsertItemTemplate>
                <asp:FileUpload ID="fuFile1" Width="350px" runat="server" />
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Tên Sheet">
            <InsertItemTemplate>
               <asp:TextBox ID="txtSheet" Width="400px" runat="server"></asp:TextBox>               
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Import từ dòng">
            <InsertItemTemplate>
               <asp:TextBox ID="txtBRows" Width="400px" runat="server"></asp:TextBox>               
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Import đến dòng">
            <InsertItemTemplate>
               <asp:TextBox ID="txtRows" Width="400px" runat="server"></asp:TextBox>               
            </InsertItemTemplate>
        </asp:TemplateField>
       
    </Fields>
</asp:DetailsView>
 <br />
<center>
<asp:Button ID="btnImport" runat="server" Text="Cập nhật" 
    onclick="btnImport_Click"/>
<asp:Button ID="btnCancel" runat="server" Text="Huỷ bỏ" 
    onclick="btnCancel_Click" />  
    </center> 



