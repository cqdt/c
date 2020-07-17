<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Order.ascx.cs" Inherits="Admin_Modules_Order" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %>


<asp:DetailsView id="dvOrder" runat="server" DataSourceID="OrderDataSource" 
     AutoGenerateRows="False" DataKeyNames="PK_ORDER"  Width="100%" 
     DefaultMode="Edit" HorizontalAlign="Center" HeaderText="Thông tin đặt hàng" OnItemCommand="dvOrder_ItemCommand" OnItemUpdated="dvOrder_ItemUpdated" >
    <Fields>
        <asp:TemplateField HeaderText="Họ v&#224; t&#234;n">
            <ItemTemplate>
               <%# Eval("C_NAME")%>
            </ItemTemplate>
            <HeaderStyle Width="200px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Địa chỉ">
            <ItemTemplate>
               <%# Eval("C_ADDRESS")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Tel">
            <ItemTemplate>
               <%# Eval("C_TEL")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Email">
            <ItemTemplate>
               <%# Eval("C_EMAIL")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ng&#224;y gửi">
            <ItemTemplate>
               <%# Eval("C_ENTRY_DATE", "{0:dd/MM/yyyy}")%>
            </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Sản phẩm">
            <ItemTemplate>
								<asp:GridView ID="gvOrders" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="OrdersDataSource" AllowPaging="True" PageSize="100" AllowSorting="true" OnRowCreated="gvOrders_RowCreated">
									<Columns>
									   <asp:TemplateField HeaderText="STT" >
												 <ItemTemplate>
												 </ItemTemplate>
												 <ItemStyle Width="10px" />
											</asp:TemplateField >
											<asp:TemplateField HeaderText="Sản phẩm" SortExpression="PK_PRODUCT">
												 <ItemTemplate>
														<a href="../Default.aspx?ctl=Product&pID=<%# Eval("FK_MENU") %>&aID=<%# Eval("PK_PRODUCT") %>" target="_blank"><%# CMS.TTV.Web.Utils.CreateLink(Eval("C_IMAGE_FILE_NAME"), 60, 0, 0, "", false)%></a>
												 </ItemTemplate>
											</asp:TemplateField>
											<asp:TemplateField HeaderText="Thông tin" SortExpression="C_TITLE">
												 <ItemTemplate>
														<a href="Default.aspx?ctl=Product&MenuID=<%# Eval("FK_MENU") %>&pID=<%# Eval("PK_PRODUCT") %>" target="_blank"><%# Eval("C_TITLE")%></a>
												 </ItemTemplate>
											</asp:TemplateField>
											<asp:TemplateField HeaderText="Giá" SortExpression="C_PRICE">
												 <ItemTemplate>
														<%# Eval("C_PRICE", "{0:#,##0}")%> USD
												 </ItemTemplate>
											</asp:TemplateField>
											<asp:TemplateField HeaderText="Số lượng" SortExpression="C_QUANTITY">
                        <ItemTemplate>
                           <%# Eval("C_QUANTITY")%>
                        </ItemTemplate>
                        <ItemStyle Width="60px" />
                      </asp:TemplateField>
											<asp:TemplateField HeaderText="Tổng" SortExpression="C_TOTAL">
												 <ItemTemplate>
														<%# Eval("C_TOTAL", "{0:#,##0}")%> USD
												 </ItemTemplate>
											</asp:TemplateField>
											<asp:TemplateField HeaderText="Trong kho" SortExpression="C_KHO">
												 <ItemTemplate>
														<CMS:Status ID="Status1" ActiveText="Còn hàng" InActiveText="Hết hàng" Value='<%# Eval("C_KHO") %>' runat="server"></CMS:Status>
												 </ItemTemplate>
											</asp:TemplateField>
									</Columns>
						    </asp:GridView>
						    <div style="font-size: 12px; font-weight: bold;" align="right">
                   Tổng giá trị đơn hàng&nbsp;:&nbsp;&nbsp; <%# Eval("C_TOTAL", "{0:#,##0}")%>&nbsp;$
                </div>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Trạng th&#225;i">
            <EditItemTemplate>
              <asp:DropDownList ID="ddlState" SelectedValue='<%# Bind("FK_ORDER_STATE") %>' DataSourceID="OrderStateDataSource" DataTextField="C_NAME" DataValueField="PK_ORDER_STATE" runat="server"></asp:DropDownList>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
               <div align="center">
                 <br />
                 <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Sửa đổi" />
                 <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </ItemTemplate>
       </asp:TemplateField>
    </Fields>
</asp:DetailsView> 

     
<asp:SqlDataSource ID="OrderDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT T_ORDER.*,(SELECT SUM(T_ORDER_DETAIL.C_QUANTITY*T_PRODUCT.C_PRICE) FROM T_ORDER_DETAIL,T_PRODUCT WHERE T_PRODUCT.PK_PRODUCT=T_ORDER_DETAIL.FK_PRODUCT AND T_ORDER_DETAIL.FK_ORDER=T_ORDER.PK_ORDER) AS C_TOTAL FROM [T_ORDER] WHERE T_ORDER.PK_ORDER=@PK_ORDER"   
   UpdateCommand="UPDATE T_ORDER SET FK_ORDER_STATE=@FK_ORDER_STATE WHERE PK_ORDER=@PK_ORDER"
    >
   <SelectParameters>
     <asp:QueryStringParameter Name="PK_ORDER" QueryStringField="aID" DefaultValue="0" Type="Int32" />
   </SelectParameters>
   <UpdateParameters>
      <asp:Parameter Name="PK_ORDER" Type="Int32" DefaultValue="0" />
      <asp:Parameter Name="FK_ORDER_STATE" Type="Int32" DefaultValue="1" />
   </UpdateParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="OrdersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT T_PRODUCT.PK_PRODUCT,T_PRODUCT.FK_MENU,T_PRODUCT.C_TITLE,T_PRODUCT.C_IMAGE_FILE_NAME,T_PRODUCT.C_PRICE,T_PRODUCT.C_KHO,T_ORDER_DETAIL.C_QUANTITY,T_ORDER_DETAIL.C_QUANTITY*T_PRODUCT.C_PRICE AS C_TOTAL FROM T_ORDER_DETAIL,T_PRODUCT WHERE T_PRODUCT.PK_PRODUCT=T_ORDER_DETAIL.FK_PRODUCT AND T_ORDER_DETAIL.FK_ORDER=@PK_ORDER"   
    >
   <SelectParameters>
     <asp:QueryStringParameter Name="PK_ORDER" QueryStringField="aID" DefaultValue="0" Type="Int32" />
   </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="OrderStateDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT * FROM T_ORDER_STATE"   
    >
</asp:SqlDataSource>


