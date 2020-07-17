<%@ Control Language="C#" AutoEventWireup="true" CodeFile="phien-giao-dich-viec-lam.ascx.cs"
    Inherits="Modules_phien_giao_dich_viec_lam" %>
<div class="bg_title_cate">
    <div class="title_cate">
        <div class="title_cate_ico">
        </div>
        <a class="a_title_cate">TÌM CÔNG TY TUYỂN DỤNG</a>
    </div>
    <div class="title_cate_right">
    </div>
</div>
<div class="img_24">
    <ul class="thongtintdld">
        <li><span class="tencongty_phien">1- Ngành nghề</span>
            <asp:DropDownList ID="cboNganhngheduocdaotao" runat="server" CssClass="danhmucnghe"
                Style="width: 340px; height: 36px;">
            </asp:DropDownList>
        </li>
        <li><span class="tencongty_phien">2- Vị trí tuyển dụng</span>
            <asp:DropDownList ID="cbovitri" runat="server" CssClass="danhmucnghe" Style="width: 340px;
                height: 36px;">
            </asp:DropDownList>
        </li>
        <li><span class="tencongty_phien">3- Mức lương</span>
            <select id="choMucluongmongmuon" runat="server" class="danhmucnghe" style="width: 340px;height:36px">
                <option value="">--- --- ---</option>
                <option value="< 5000000">< 5,000,000 VNĐ</option>
                <option value="6000000">6,000,000 VNĐ</option>
                <option value="7000000">7,000,000 VNĐ</option>
                <option value="8000000">8,000,000 VNĐ</option>
                <option value="9000000">9,000,000 VNĐ</option>
                <option value="10000000">10,000,000 VNĐ</option>
                <option value="11000000">11,000,000 VNĐ</option>
                <option value="12000000">12,000,000 VNĐ</option>
                <option value="13000000">13,000,000 VNĐ</option>
                <option value="14000000">14,000,000 VNĐ</option>
                <option value="15000000">15,000,000 VNĐ</option>
                <option value="Thỏa thuận">Thỏa thuận</option>
            </select>
        </li>
        <li><span class="tencongty_phien">4- Nơi làm việc</span>
            <select class="danhmucnghe" style="width: 340px; height: 36px;" id="cboTinh" runat="server">
                <option value="">--- --- ---</option>
                <option value="Hà Nội">Hà Nội</option>
                <option value="TP HCM">TP HCM</option>
                <option value="An Giang">An Giang</option>
                <option value="Bà Rịa - Vũng Tàu">Bà Rịa - Vũng Tàu</option>
                <option value="Bắc Giang">Bắc Giang</option>
                <option value="Bắc Kạn">Bắc Kạn</option>
                <option value="Bạc Liêu">Bạc Liêu</option>
                <option value="Bắc Ninh">Bắc Ninh</option>
                <option value="Bến Tre">Bến Tre</option>
                <option value="Bình Định">Bình Định</option>
                <option value="Bình Dương">Bình Dương</option>
                <option value="Bình Phước">Bình Phước</option>
                <option value="Bình Thuận">Bình Thuận</option>
                <option value="Cà Mau">Cà Mau</option>
                <option value="Cần Thơ">Cần Thơ</option>
                <option value="Cao Bằng">Cao Bằng</option>
                <option value="Đà Nẵng">Đà Nẵng</option>
                <option value="Đắk Lắk">Đắk Lắk</option>
                <option value="Đắk Nông">Đắk Nông</option>
                <option value="Điện Biên">Điện Biên</option>
                <option value="Đồng Nai">Đồng Nai</option>
                <option value="Đồng Tháp">Đồng Tháp</option>
                <option value="Gia Lai">Gia Lai</option>
                <option value="Hà Giang">Hà Giang</option>
                <option value="Hà Nam">Hà Nam</option>
                <option value="Hà Tĩnh">Hà Tĩnh</option>
                <option value="Hải Phòng">Hải Phòng</option>
                <option value="Hải Dương">Hải Dương</option>
                <option value="Hậu Giang">Hậu Giang</option>
                <option value="Hòa Bình">Hòa Bình</option>
                <option value="Hưng Yên">Hưng Yên</option>
                <option value="Khánh Hòa">Khánh Hòa</option>
                <option value="Kiên Giang">Kiên Giang</option>
                <option value="Kon Tum">Kon Tum</option>
                <option value="Lai Châu">Lai Châu</option>
                <option value="Lâm Đồng">Lâm Đồng</option>
                <option value="Lạng Sơn">Lạng Sơn</option>
                <option value="Lào Cai">Lào Cai</option>
                <option value="Long An">Long An</option>
                <option value="Nam Định">Nam Định</option>
                <option value="Nghệ An">Nghệ An</option>
                <option value="Ninh Bình">Ninh Bình</option>
                <option value="Ninh Thuận">Ninh Thuận</option>
                <option value="Phú Thọ">Phú Thọ</option>
                <option value="Quảng Bình">Quảng Bình</option>
                <option value="Quảng Nam">Quảng Nam</option>
                <option value="Quảng Ngãi">Quảng Ngãi</option>
                <option value="Quảng Ninh">Quảng Ninh</option>
                <option value="Quảng Trị">Quảng Trị</option>
                <option value="Sóc Trăng">Sóc Trăng</option>
                <option value="Sơn La">Sơn La</option>
                <option value="Tây Ninh">Tây Ninh</option>
                <option value="Thái Bình">Thái Bình</option>
                <option value="Thái Nguyên">Thái Nguyên</option>
                <option value="Thanh Hóa">Thanh Hóa</option>
                <option value="Thừa Thiên Huế">Thừa Thiên Huế</option>
                <option value="Tiền Giang">Tiền Giang</option>
                <option value="Trà Vinh">Trà Vinh</option>
                <option value="Tuyên Quang">Tuyên Quang</option>
                <option value="Vĩnh Long">Vĩnh Long</option>
                <option value="Vĩnh Phúc">Vĩnh Phúc</option>
                <option value="Yên Bái">Yên Bái</option>
                <option value="Phú Yên">Phú Yên</option>
            </select>
        </li>
        <li><span class="tencongty_phien">5- Khả năng tiếng Hàn/Nhật</span>
            <select class="danhmucnghe" style="width: 340px; height: 36px;" id="cboChungchi"
                runat="server">
                <option value="">--- --- ---</option>
                <option value="TOPIK1">TOPIK 1</option>
                <option value="TOPIK2">TOPIK 2</option>
                <option value="TOPIK3">TOPIK 3</option>
                <option value="TOPIK4">TOPIK 4</option>
                <option value="TOPIK5">TOPIK 5</option>
                <option value="N1">N1</option>
                <option value="N2">N2</option>
                <option value="N3">N3</option>
                <option value="N4">N4</option>
                <option value="N5">N5</option>
                <option value="Khác">Khác</option>
            </select>
        </li>
       
        <li>
            <asp:Button ID="btntimkiem" CssClass="btndangky" runat="server" Text=" TÌM KIẾM "
                OnClick="btntimkiem_Click" />
        </li>
        
        
            <table cellpadding="1" cellspacing="1" width="565px" style="background: #ccc">
               
              
                <tr>
                    <td style="background: #fff;padding-left:5px">
                        STT
                    </td>
                    <td style="background: #fff;padding-left:5px">
                        Tên công ty
                    </td>
                    <td style="background: #fff;padding-left:5px">
                        Địa chỉ
                    </td>
                    <td style="background: #fff;padding-left:5px">
                        Xem
                    </td>
                    <td style="background: #fff;padding-left:5px">
                        Chọn
                    </td>
                </tr>
                 <%= listdata %>
            </table>
        
      
      
    </ul>
</div>
