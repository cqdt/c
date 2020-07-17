<%@ Control Language="C#" AutoEventWireup="true" CodeFile="tra-cuu-thong-tin-nguoi-lao-dong-tai-han-quoc.ascx.cs" Inherits="Modules_tra_cuu_thong_tin_nguoi_lao_dong_tai_han_quoc" %>


<div class="bg_title_cate">
    <div class="title_cate">
        <div class="title_cate_ico">
        </div>
        <a class="a_title_cate">tra cứu thông tin của người lao động làm việc tại Hàn Quốc</a>
    </div>
    <div class="title_cate_right">
    </div>
</div>
<div class="img_24 dangkyhq tracuutt">
    <ul class="dangkytienghan">
        
         <li class="xam"><span class="hokhau">Họ tên (*)</span><asp:TextBox ID="txthotentimkiem" CssClass="txthoten uppercase"
            Width="138" runat="server"></asp:TextBox></li>


        <li><span class="hokhau">Số hộ chiếu (*)</span><asp:TextBox ID="txtsohochieutimkiem"
            CssClass="txthoten" Width="138" runat="server"></asp:TextBox></li>
       
        <li class="xam"><span class="hokhau">Số thẻ người nước ngoài</span><asp:TextBox ID="txtsothetimkiem1"
            onkeyup="sothe2next();" onkeydown="return jsDecimals(event);" MaxLength="6" CssClass="txthoten sothecenter"
            Width="65" runat="server" onfocus="if(this.value=='000000') this.value='';" onblur="if(this.value=='') this.value='000000';"
            value="000000"></asp:TextBox><span style="float: left; margin: 7px 0 0 0">-</span>
            <asp:TextBox ID="txtsothetimkiem2" CssClass="txthoten sothecenter" Width="65" runat="server"
                onkeyup="SearchForcus();" onkeydown="return jsDecimals(event);" MaxLength="7"
                onfocus="if(this.value=='0000000') this.value='';" onblur="if(this.value=='') this.value='0000000';"
                value="0000000"></asp:TextBox>
        </li>
        <li style="height:5px;">            
        </li>
        <li><i>- Mục (*) bắt buộc phải nhập</i></li>
        <li><i>- Nếu muốn xem toàn bộ thông tin của mình thì nhập đủ cả 3 ô trên</i></li>
        <li  class="xam">
            <asp:Button ID="btnSearch" runat="server" Text="XEM THÔNG TIN" OnClientClick="return CheckSearching()"
                CssClass="btnshow" OnClick="btnSearch_Click" />
        </li>
          <li style="height:15px;">            
        </li>
        
            <%= NotsotheNNN%>
            <%= EmtyInfo%>
        <asp:DataList ID="dlKetqua" RepeatColumns="1" runat="server" HorizontalAlign="Left"
                Width="584px" CaptionAlign="Top" CellPadding="0" GridLines="None" 
                 >
                <ItemTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td colspan="2">
                                <b style="font-size: 16px">Thông tin bạn đã khai báo</b>
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr style="background:#ebebeb">
                            <td width="270px" height="30px">
                                Họ và tên
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" ID="txtViewhoten" Text='<%# Eval("C_HOTEN")%>' Width="250px"
                                    runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="background:#ffffff;">
                            <td height="30px" width="270px">
                                Số hộ chiếu
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" ID="TextBox1" Text='<%# Eval("C_HOCHIEU")%>' Width="250px"
                                    runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="background:#ebebeb">
                            <td height="30px" width="270px">
                                Ngày nhập cảnh
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" ID="TextBox2" Text='<%# Eval("C_NGAYNHAPCANH")%>' Width="250px"
                                    runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="background:#ffffff;">
                            <td height="30px" width="270px">
                                Số CMND Việt Nam
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" ID="TextBox3" Text='<%# Eval("C_CMND")%>' Width="250px"
                                    runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="background:#ebebeb">
                            <td height="30px" width="270px">
                                Địa chỉ Email cá nhân
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" ID="TextBox4" Text='<%# Eval("C_EMAIL")%>' Width="250px"
                                    runat="server"></asp:TextBox>
                            </td>
                        </tr>
                      
                        <tr style="background:#ffffff;">
                            <td height="30px" width="270px">
                                Tên công ty nơi làm việc
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" ID="TextBox5" Text='<%# Eval("C_TENDN_HIENTAI")%>' Width="250px"
                                    runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="background:#ebebeb">
                            <td height="30px" width="270px">
                                Địa chỉ nơi làm việc
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" ID="TextBox6" Text='<%# Eval("C_DIACHIDN_HIENTAI")%>' Width="250px"
                                    runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="background:#ffffff;">
                            <td height="30px" width="270px">
                                Số điện thoại của công ty
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" ID="TextBox7" Text='<%# Eval("C_DIENTHOAIDN_HIENTAI")%>' Width="250px"
                                    runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="background:#ebebeb">
                            <td height="30px" width="270px">
                                Ngày bắt đầu làm việc tại công ty
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" ID="TextBox8" Text='<%# Eval("C_NGAYLAMVIECDN_HIENTAI")%>'
                                    Width="250px" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                      
                        <tr style="background:#ffffff;">
                            <td height="30px" width="270px">
                                Số Thẻ người nước ngoài
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" ID="TextBox9" Text='<%# Eval("C_SOTHE")%>' Width="250px"
                                    runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="background:#ebebeb">
                            <td height="30px" width="270px">
                                Số điện thoại của NLĐ
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" ID="TextBox10" Text='<%# Eval("C_DIENTHOAI")%>' Width="250px"
                                    runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="background:#ffffff;">
                            <td height="30px" width="270px">
                                Ngày khai báo/cập nhật
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" ID="TextBox11" Text='<%# Eval("C_NGAYGUI", "{0:dd/MM/yyyy}")%>' Width="250px"
                                    runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="background:#ebebeb">
                            <td height="30px" width="270px">
                                Thời hạn hợp đồng LĐ cuối cùng
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" ID="TextBox12" Text='<%# Eval("C_HOPDONGDEN")%>' Width="250px"
                                    runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="background:#ffffff;">
                            <td height="30px" width="270px">
                                Lý do về nước
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" ID="TextBox13" Text='<%# Eval("C_LYDO")%>' Width="250px"
                                    runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="background:#ebebeb">
                            <td height="30px" width="270px">
                                Ngày hết hạn lưu trú (theo Thẻ người nước ngoài)
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" ID="TextBox14" Text='<%# Eval("C_NGAYHETHAN")%>' Width="250px"
                                    runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="background:#ffffff;">
                            <td height="30px" width="270px">
                                Ngày đăng ký về nước (ngày sẽ xuất cảnh)
                            </td>
                            <td>
                                <asp:TextBox Enabled="false" ID="C_NGAYDANGKYVENUOC" Text='<%# Eval("C_NGAYDANGKYVENUOC")%>'
                                    Width="250px" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        <li id="nutlenh" class="xam" runat="server">
            <asp:Button ID="btnFinish" runat="server" Text="KẾT THÚC" CssClass="btnfinish" 
                onclick="btnFinish_Click" />
            
        </li>
    </ul>
</div>


<script type="text/javascript">

    
    function CheckSearching() {
        var txtsohochieutimkiem = document.getElementById("<%=txtsohochieutimkiem.ClientID %>").value;
        var txthotentimkiem = document.getElementById("<%=txthotentimkiem.ClientID %>").value;

        if (txthotentimkiem == "") {
            alert("Hãy nhập Họ tên");
            return false;
        }
        else if (txtsohochieutimkiem == "") {
            alert("Hãy nhập Số hộ chiếu");
            return false;
        }
        else return true;
    }


    function SearchForcus() {

        if (document.getElementById("<%=txtsothetimkiem2.ClientID %>").value.length >= 7) {
            document.getElementById("<%=btnSearch.ClientID %>").focus();
        }
    }


    function sothe2next() {

        if (document.getElementById("<%=txtsothetimkiem1.ClientID %>").value.length >= 6) {
            document.getElementById("<%=txtsothetimkiem2.ClientID %>").focus();
        }
    }


</script>
