<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Orders.ascx.cs" Inherits="Admin_Modules_Orders" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 


<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>

<asp:GridView id="gvOrders" runat="server"  DataSourceID="OrdersDataSource" DataKeyNames="PK_ORDER"
    AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" Width="100%" >
    <Columns>
       <asp:TemplateField>
           <ItemTemplate>
             <input name="chkOrders" class="checkbox" type="checkbox" value="<%# Eval("PK_ORDER") %>" />
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Xem" SortExpression="PK_ORDER">
            <ItemTemplate>
                 <a href="Default.aspx?ctl=Order&Page=<%= gvOrders.PageIndex %>&aID=<%# Eval("PK_ORDER") %>"><img src="Images/View.png" style="border:0"  alt="" /></a>
            </ItemTemplate>
            <ItemStyle Width="30px" />
        </asp:TemplateField> 
        <asp:BoundField DataField="C_NAME" HeaderText="Họ và tên" SortExpression="C_NAME"></asp:BoundField>
        <asp:BoundField DataField="C_ADDRESS" HeaderText="Địa chỉ" SortExpression="C_ADDRESS"></asp:BoundField>
        <asp:BoundField DataField="C_TEL" HeaderText="Tel" SortExpression="C_TEL"></asp:BoundField>
        <asp:BoundField DataField="C_EMAIL" HeaderText="Email" SortExpression="C_EMAIL"></asp:BoundField>
        <asp:BoundField HtmlEncode="False" DataFormatString="{0:dd/MM/yyyy}" DataField="C_ENTRY_DATE" SortExpression="C_ENTRY_DATE" HeaderText="Ng&#224;y gửi"></asp:BoundField>
        <asp:TemplateField HeaderText="Tổng tiền" SortExpression="C_TOTAL">
           <ItemTemplate>
                 <%# Eval("C_TOTAL", "{0:#,##0} USD")%>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Trạng th&#225;i" SortExpression="FK_ORDER_STATE">
           <ItemTemplate>
                 <%# GetStatus(Eval("FK_ORDER_STATE")) %>
           </ItemTemplate>
           <ItemStyle Width="100px" />
        </asp:TemplateField>
     </Columns>
</asp:GridView>
<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkOrders" runat="server" />
 
  
<center>
   <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
</center>


<asp:SqlDataSource ID="OrdersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT T_ORDER.*,(SELECT SUM(T_ORDER_DETAIL.C_QUANTITY*T_PRODUCT.C_PRICE) FROM T_ORDER_DETAIL,T_PRODUCT WHERE T_PRODUCT.PK_PRODUCT=T_ORDER_DETAIL.FK_PRODUCT AND T_ORDER_DETAIL.FK_ORDER=T_ORDER.PK_ORDER) AS C_TOTAL FROM [T_ORDER] ORDER BY [PK_ORDER] DESC">
</asp:SqlDataSource>