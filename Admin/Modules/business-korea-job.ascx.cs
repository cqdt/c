using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_Modules_business_korea_job : System.Web.UI.UserControl
{
    DataSet ds = new DataSet();
    public int total;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("business-korea-job", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }
        total = CMS.MsSql.ExecuteToInt("select count(*) from T_TUYENDUNG_VIECLAM");
    }
    protected void btnExportExcel_Click(object sender, EventArgs e)
    {
        string str = "SELECT "
                     + "[FK_CTY] [Mã tuyển dụng] "
                     + ",[C_VITRI] [Vị trí] "
                     + " ,[C_MOTA] [Mô tả] "
                     + " ,[C_SOLUONGTUYEN] [Số lượng tuyển] "
                     + " ,[C_KYNANGGIAOTIEPTIENGHAN] [Kỹ năng giao tiếp tiếng Hàn] "
                     + " ,[C_NGHELAMVIEC] [Nghề làm việc] "
                     + " ,[C_NAMLAMVIEC] [Năm làm việc] "
                     + " ,[C_BANGCAP] [Bằng cấp] "
                     + " ,[C_CHITIETBANGCAP] [Chi tiết bằng cấp] "
                     + " ,[C_TUOITU] [Tuổi từ] "
                     + " ,[C_TUOIDEN] [Tuổi đến] "
                     + " ,[C_GIOITINH] [Giới tính] "
                     + " ,[C_NOICUTRU] [Nơi cư trú] "
                     + " ,[C_MUCLUONGTOITHIEU] [Mức lương tối thiểu] "
                     + " ,[C_THUONG] [Thưởng] "
                     + " ,[C_THANGQUYNAM] [Tháng/quý/năm] "
                     + " ,[C_CHEDOKHAC] [Chế độ khác] "
                     + " ,[C_HOSO] [Hồ sơ dự tuyển] "
                     + " ,[C_THOIGIANNHANTU] [Nhận hồ sơ từ] "
                     + " ,[C_THOIGIANNHANDEN] [Nhận hồ sơ đến] "
                     + " ,[C_THOIGIANTUYEN] [Thời gian tuyển] "
                     + " ,convert(varchar, [C_NGAY] , 103) [Ngày đăng ký] "
                     + "   FROM [dbo].[T_TUYENDUNG_VIECLAM] "
                     + "   order by id desc";
        ds = CMS.MsSql.FillDataSet(str);
        Whatever.ExcelExport.ExportDataSetToExcel(ds, "danh-sach-viec-lam-korea.xls");
    }

    protected void gvList_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0 && e.Row.RowIndex <= gvList.Rows.Count)
        {
            e.Row.Cells[0].Text = "<font face=\"tahoma\" size=\"2\">" + (gvList.PageIndex * gvList.PageSize + e.Row.RowIndex + 1) + "</font>";
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetAVotes("DELETE FROM T_TUYENDUNG_VIECLAM", "xóa");
    }
    private void SetAVotes(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkAVotes");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("dm-vi-tri", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền " + mess;
                return;
            }
            string strSql = sql + " WHERE ID IN (" + strIDs + ")";
            CMS.MsSql.ExecuteNonQuery(strSql);
            gvList.DataBind();
            lblAlert.Text = "Đã " + mess + " thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn câu trả lời cần " + mess;
    }

}