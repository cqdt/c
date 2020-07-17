using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_Modules_ds_CHLB_Duc : System.Web.UI.UserControl
{

    DataSet ds = new DataSet();
    public int total;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("ds-CHLB-Duc", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }
        total = CMS.MsSql.ExecuteToInt("select count(*) from T_DIEUDUONG where C_NGAYGUI >  '2020-01-01 00:00:00.000' ");
    }
    
    protected void gvList_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0 && e.Row.RowIndex <= gvList.Rows.Count)
        {
            e.Row.Cells[0].Text = "<font face=\"tahoma\" size=\"2\">" + (gvList.PageIndex * gvList.PageSize + e.Row.RowIndex + 1) + "</font>";
        }
    }
    protected void btnExportExcel_Click(object sender, EventArgs e)
    {
        string str = "select ROW_NUMBER() OVER(ORDER BY PK_DIEUDUONG desc) as [TT], C_HOTEN [Họ và tên], CONVERT(varchar,C_NGAYSINH,103) [Ngày sinh], CONCAT('''',C_CMND) AS [Số CMND/căn cước công dân], C_GIOITINH [Giới tính], C_HKTT [Nơi đăng ký hộ khẩu thường trú (Tỉnh/thành phố)],"
        + " CONCAT('''',C_DIENTHOAI) AS [Số điện thoại],   CONCAT('''',C_DIENTHOAI2) [Số điện thoại 2], C_HEDAOTAO AS [Hệ đào tạo], "
        + " C_TENTRUONGDAOTAO AS [Tên trường đào tạo], C_CHUYENNGANHDAOTAO AS [Chuyên ngành đào tạo], C_SINHVIENNAMTHU AS [Sinh viên năm thứ(nếu chưa tốt nghiệp)], C_CONGVIECHIENTAI AS [Công việc hiện tại(nếu có)], "
        //+ " C_HOCTAP [Tình trạng học tập], C_NAMHOC [Năm thứ], C_XEPLOAI [Xếp loại TN], C_CONGVIECLAM [Công việc đang làm], C_NOILAMVIEC [Nơi làm việc hiện nay], C_TRUONGHOC [Trường đang học hoặc tốt nghiệp], C_HEDAOTAO [Hệ đào tạo],"
        //+ " C_NGUOILIENHE [Tên người liên hệ], C_QUANHE [Quan hệ], C_DC_NGUOITHAN [Địa chỉ người liên hệ], C_TEL_NGUOITHAN [Điện thoại người liên hệ], C_NGAYGUI [Ngày gửi] "
        + " CONVERT(varchar,C_NGAYGUI,103) AS [Thời gian đăng ký trên hệ thống]"
        + " FROM T_DIEUDUONG where C_NGAYGUI >  '2020-01-01 00:00:00.000'  order by PK_DIEUDUONG desc";    
        ds = CMS.MsSql.FillDataSet(str);
        Whatever.ExcelExport.ExportDataSetToExcel(ds, "danh-sach-dang-ky-du-tuyen-chuong-trinh-chlb-duc.xls");
    }


}