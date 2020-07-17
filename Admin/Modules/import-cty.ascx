<%@ Control Language="C#" AutoEventWireup="true" CodeFile="import-cty.ascx.cs" Inherits="Admin_Modules_import_cty" %>

<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 

<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>

<asp:GridView ID="gvAVotes"  Width="100%" runat="server" DataKeyNames="ID" AutoGenerateColumns="False" 
DataSourceID="AVotesDataSource" AllowPaging="True" PageSize="20" AllowSorting="false">
    <Columns>
        <asp:TemplateField>
           <ItemTemplate>
             <input name="chkAVotes" class="checkbox" type="checkbox" value="<%# Eval("ID") %>" />
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField>
           <ItemTemplate>
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
       

        <asp:TemplateField HeaderText="Phiên GDVL">
           <ItemTemplate>
              <%# Eval("FK_PHIEN_NAME")%>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Công ty">
           <ItemTemplate>              
               <%# Eval("C_CTY")%>
           </ItemTemplate>
        </asp:TemplateField>   
        <asp:TemplateField HeaderText="Vị trí tuyển dụng">
           <ItemTemplate>              
               <%# Eval("C_VITRI")%>
           </ItemTemplate>
        </asp:TemplateField> 
        <asp:TemplateField HeaderText="Địa chỉ">
           <ItemTemplate>              
               <%# Eval("C_DIACHI")%>
           </ItemTemplate>
        </asp:TemplateField> 
        <asp:TemplateField HeaderText="Điện thoại">
           <ItemTemplate>              
               <%# Eval("C_TEL")%>
           </ItemTemplate>
        </asp:TemplateField> 
        
             
        
    </Columns>
</asp:GridView>
<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkAVotes" runat="server" />

<center>
  
   <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
  
</center>

<br />

<asp:SqlDataSource ID="AVotesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT pct.*,p.C_PHIEN as [FK_PHIEN_NAME] FROM T_PHIEN_GDVL_CHITIET pct,T_PHIEN_GDVL p where p.ID=pct.FK_PHIEN and  p.ID=@ID ORDER BY ID">  
     <SelectParameters>
     <asp:QueryStringParameter Name="ID" QueryStringField="fID" DefaultValue="0" Type="Int32" />
   </SelectParameters>
</asp:SqlDataSource>







<center>
   <br /><br />
   <h1>
       
   <asp:Label ID="lblthongbao" runat="server" Text=""></asp:Label>

   </h1>
   <h2>
   Tải file mẫu <a href="<%= Newwind.VQS.URL %>/admin/temp/phien-gdvl.xls"> tại đây</a></h2>
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
