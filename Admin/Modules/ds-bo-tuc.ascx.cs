using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Admin_Modules_ds_bo_tuc : System.Web.UI.UserControl
{
    DataSet ds = new DataSet();
    public int total;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("ds-bo-tuc", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }
        total = CMS.MsSql.ExecuteToInt("select count(*) from T_BOTUC");
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
        string str = "SELECT      C_HOTEN [Họ tên], C_NGAYSINH [Ngày sinh], C_GIOITINH [Giới tính], C_THUONGTRU [Thường trú], C_NGAYVENUOC [Ngày về nước], C_THANGHOC [Đăng ký học tháng], C_DIENTHOAI [Điện thoại], C_NGAYDANGKY [Ngày gửi đăng ký] FROM         T_BOTUC order by PK_BOTUC desc";
        ds = CMS.MsSql.FillDataSet(str);
        Whatever.ExcelExport.ExportDataSetToExcel(ds, "danh-sach-dang-ky-bo-tuc-tieng-han-va-thuc-hanh-bai-thi-tren-may-tinh.xls");
    }


}