<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Dang-ky-cap-chung-chi-CE.ascx.cs" Inherits="Modules_Base_Dang_ky_cap_chung_chi_CE" %>
 <%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
  
  <asp:Panel ID="pnRegister" runat="server">
  <asp:DetailsView ID="dvRegister" runat="server" DataSourceID="DataSourceRegister"
        DataKeyNames="PK_CE" SkinID="FeedBack"
        AutoGenerateRows="False" DefaultMode="Insert" OnItemCommand="dvRegister_ItemCommand"
        Width="100%" CaptionAlign="Top" 
        HorizontalAlign="Center" OnItemInserted="dvRegister_ItemInserted" 
        OnItemInserting="dvRegister_ItemInserting" GridLines="None">
        <Fields>
            <asp:TemplateField  HeaderText="Họ và tên (*)">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_HO_TEN" Width="250px" Text='<%# Bind("C_HO_TEN") %>' runat="server"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="Tên không thể rỗng" ControlToValidate="txtC_HO_TEN" SetFocusOnError="True" ValidationGroup="vPOST_FAQG1" Display="Dynamic">*</asp:RequiredFieldValidator>                   
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="Ngày sinh (*)">
                <InsertItemTemplate>                    
                    <radCln:RadDatePicker MinDate="1900-01-01" ID="raddNgaysinh"  Width="89"  SelectedDate='<%# Bind("C_NGAY_SINH") %>' OnLoad="raddNgaysinh_Load" runat="server"></radCln:RadDatePicker>
                         
                    <asp:RequiredFieldValidator ID="rfvngaysinh" runat="server" ErrorMessage="Ngày sinh không thể rỗng" ControlToValidate="raddNgaysinh" SetFocusOnError="True" ValidationGroup="vPOST_FAQG1" Display="Dynamic">*</asp:RequiredFieldValidator> 
                    
                      
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
             <asp:TemplateField  HeaderText="Địa chỉ (*)">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_DIA_CHI" Width="250px" Text='<%# Bind("C_DIA_CHI") %>' runat="server"></asp:TextBox>  
                    <asp:RequiredFieldValidator ID="rfvC_DIA_CHI" runat="server" ErrorMessage="Địa chỉ không thể rỗng" ControlToValidate="txtC_DIA_CHI" SetFocusOnError="True" ValidationGroup="vPOST_FAQG1" Display="Dynamic">*</asp:RequiredFieldValidator>                                     
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>                        
            
             <asp:TemplateField  HeaderText="Số hộ chiếu (*)">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_SO_HO_CHIEU" MaxLength="9" Width="250px" Text='<%# Bind("C_SO_HO_CHIEU") %>' runat="server"></asp:TextBox>  
                    <asp:RequiredFieldValidator ID="rfvC_SO_HO_CHIEU" runat="server" ErrorMessage="Số hộ chiếu không thể rỗng" ControlToValidate="txtC_SO_HO_CHIEU" SetFocusOnError="True" ValidationGroup="vPOST_FAQG1" Display="Dynamic">*</asp:RequiredFieldValidator>                                                       
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
                                     
             <asp:TemplateField HeaderText="Trung tâm đào tạo (*)">
                <InsertItemTemplate>
                 <asp:DropDownList ID="ddlMenus" Width="255px" DataSourceID="FAQDataSource" DataTextField="C_TEN" SelectedValue='<%# Bind("FK_TT") %>' DataValueField="PK_TT" runat="server" >
                </asp:DropDownList>                                                                                       
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>                    
                        
           
            <asp:CommandField  ButtonType="Button" ValidationGroup="vPOST_FAQG1" ShowInsertButton="True">
                <ItemStyle HorizontalAlign="Center" />
            </asp:CommandField>
            
        </Fields>
    </asp:DetailsView>    
    </asp:Panel>   
    
    <asp:Panel ID="PnThank" runat="server" CssClass="caution" Height="50px" Width="100%"
        Visible="false">
        <%= CMS.Lang.GetKey("Dang-ky-kiem-tra-tieng-han.ascx", "Register")%>
  </asp:Panel>
    <asp:ValidationSummary ID="vsPOST_FAQ" ValidationGroup="vPOST_FAQG1" ShowSummary="false"   HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="true" />  

<asp:SqlDataSource ID="DataSourceRegister" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    InsertCommand="INSERT INTO T_CE(C_HO_TEN,C_NGAY_SINH,C_DIA_CHI,C_SO_HO_CHIEU,FK_TT,C_STATUS) 
                             VALUES(@C_HO_TEN,@C_NGAY_SINH,@C_DIA_CHI,@C_SO_HO_CHIEU,@FK_TT,0)">
    <InsertParameters>        
        <asp:Parameter Name="C_HO_TEN" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_NGAY_SINH" />
        <asp:Parameter Name="C_DIA_CHI" />
        <asp:Parameter Name="C_SO_HO_CHIEU" />
  
        <asp:Parameter Name="FK_TT" />                
        <asp:Parameter Name="C_STATUS" />   
    </InsertParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="FAQDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT * FROM T_TT where C_STATUS=1"   
    >
</asp:SqlDataSource>