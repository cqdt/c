using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Admin_Modules_ds_im_japan : System.Web.UI.UserControl
{
    DataSet ds = new DataSet();
    public int total;
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!CMS.TTV.Rule.IsModuleRule("ds-im-japan", CMS.TTV.Rules.APPROVE))
        //{
        //    lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
        //    return;
        //}
        total = CMS.MsSql.ExecuteToInt("select count(*) from T_IM where C_NGAYDANGKY >  '2020-01-01 00:00:00.000'");
    }
    protected void btnExportExcel_Click(object sender, EventArgs e)
    {
        //string str = "SELECT     C_HOTEN AS [Họ và tên], C_NGAYSINH AS [Ngày tháng năm sinh], C_CMND AS [Số CMND], C_TRINHDO AS [Trình độ học vấn], C_HONNHAN AS [Tình trạng hôn nhân], "
        //             + " C_HOKHAU AS [Nơi đăng ký hộ khẩu thường trú], C_SONHA AS [Số nhà/thôn/xóm], C_PHUONGXA AS [Phường/xã], C_QUANHUYEN AS [Quân/huyện], "
        //             + " C_THANHPHO AS [Thành phố/tỉnh], C_DIENTHOAI1 AS [Số điện thoại thứ nhất], C_DIENTHOAI2 AS [Số điện thoại thứ hai], C_NGUOILIENHE AS [Họ và tên người liên hệ], "
        //             + " C_QUANHE AS [Quan hệ với người đăng ký tham gia chương trình], C_DIACHI AS [Địa chỉ thường trú], C_DIENTHOAI AS [Điện thoại liên hệ], "
        //             + " C_NGAYDANGKY AS [Ngày đăng ký]"
        //             + " FROM         T_IM ORDER BY PK_IM DESC";

        string str = "SELECT  ROW_NUMBER() OVER(ORDER BY PK_IM desc) as [TT],   C_HOTEN AS [Họ và tên], CONVERT(varchar,C_NGAYSINH,103) AS [Ngày tháng năm sinh], C_CMND AS [Số CMND/căn cước công dân],C_GIOITINH AS [Giới tính], C_CHIEUCAO AS [Chiều cao],"
                     + " C_HOKHAU AS [Nơi đăng ký hộ khẩu thường trú (Tỉnh/thành phố)],  "
                     + "  concat(C_DIENTHOAI1,'aaa') AS [Số điện thoại], C_DIENTHOAI2 AS [Số điện thoại 2],  C_TRINHDO AS [Trình độ học vấn],  "
                     + " CONVERT(varchar,C_NGAYDANGKY,103) AS [Thời gian đăng ký trên hệ thống]"
                     + " FROM         T_IM  where C_NGAYDANGKY >  '2020-01-01 00:00:00.000' ORDER BY PK_IM DESC";

        ds = CMS.MsSql.FillDataSet(str);
        Whatever.ExcelExport.ExportDataSetToExcel(ds, "danh-sach-dang-ky-du-tuyen-chuong-trinh-im-japan.xls");
    }
    protected void gvList_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0 && e.Row.RowIndex <= gvList.Rows.Count)
        {
            e.Row.Cells[0].Text = "<font face=\"tahoma\" size=\"2\">" + (gvList.PageIndex * gvList.PageSize + e.Row.RowIndex + 1) + "</font>";
        }
    }
}