using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class Admin_Modules_Tuyendungs : System.Web.UI.UserControl
{
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Tuyendungs", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }
        Binddata();
    }

    public void Binddata()
    {     
        string sql = "select * from T_TUYEN_DUNG where 1=1";
        if (txtTitle.Text != "") sql += " and C_TITLE LIKE N'%" + txtTitle.Text + "%'";
        if (txtNganhnghe.Text != "") sql += " and C_LINH_VUC LIKE N'%" + txtNganhnghe.Text + "%'";
        if (txtDiadiem.Text != "") sql += " and C_DIA_DIEM_LAM_VIEC LIKE N'%" + txtDiadiem.Text + "%'";
        DataTable dtNews = CMS.MsSql.FillDataTable(sql);
        this.gvListRegister.DataSource = dtNews;
        gvListRegister.DataBind();
    }

    protected void gvListRegister_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0 && e.Row.RowIndex <= gvListRegister.Rows.Count)
        {
            e.Row.Cells[0].Text = "<font face=\"tahoma\" size=\"2\">" + (gvListRegister.PageIndex * gvListRegister.PageSize + e.Row.RowIndex + 1) + "</font>";
        }
    }
    
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetAdvs("DELETE FROM T_TUYEN_DUNG", "xóa");
    }
    private void SetAdvs(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkFAQs");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("Tuyendungs", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền " + mess;
                return;
            }
            string strSql = sql + " WHERE PK_TUYEN_DUNG IN (" + strIDs + ")";
            CMS.MsSql.ExecuteNonQuery(strSql);
            gvListRegister.DataBind();
            lblAlert.Text = "Đã " + mess + " thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn đối tượng cần " + mess;
    }
    protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvListRegister.PageSize = CMS.Utils.ToInteger(ddlPageSize.SelectedValue);
    }
    protected void btnThemmoi_Click(object sender, EventArgs e)
    {
        string url = "Default.aspx?ctl=Tuyendung";
        if (gvListRegister.PageIndex > 0) url += "&Page=" + gvListRegister.PageIndex;
        url += "&PageSize=" + ddlPageSize.SelectedValue;
        Response.Redirect(url);
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Binddata();
    }
    protected void btnExportExcel_Click(object sender, EventArgs e)
    {
        string str = "select PK_TUYEN_DUNG as [ID],C_TITLE as [Tiêu đề], C_TEN_CONG_TY as [Tên công ty], C_DIA_CHI as [Địa chỉ], C_MO_TA as [Mô tả], C_PHONE as [Điện thoại], C_QUY_MO as [Quy mô], C_TIEU_CHI as [Tiêu chí], C_WEBSITE as [Website], ";
        str += "C_VI_TRI as [Vị trí], C_SL_TUYEN as [Số lượng tuyển], C_LINH_VUC as [Lĩnh vực], C_DIA_DIEM_LAM_VIEC as [Địa điểm làm việc], C_MO_TA_VIEC_LAM as [Mô tả việc làm], C_KY_NANG as [Kỹ năng], C_TRINH_DO_TOI_THIEU as [Trình độ tối thiểu], ";
        str += "C_KINH_NGHIEM as [Kinh nghiệm], C_YC_GIOI_TINH as [Yêu cầu giới tính], C_HINH_THUC_LAM_VIEC as [Hình thức làm việc], C_MUC_LUONG [Mức lương], C_THOI_GIAN_THU_VIEC as [Thời gian thử việc], C_CAC_CHE_DO_KHAC as [Các chế độ khác], ";
        str += "C_YEU_CAU_HO_SO as [Yêu cầu hồ sơ], C_NGAY_DANG as [Ngày đăng], C_HAN_NOP_HS as [Hạn nộp hồ sơ], C_NGUOI_LIEN_HE as [Người liên hệ], C_DIA_CHI_LIEN_HE as [Địa chỉ liên hệ], C_EMAIL_LIEN_HE as [Email liên hệ], ";
        str += "C_DIEN_THOAI_LIEN_HE as [Điện thoại liên hệ], C_DI_DONG as [Di động], C_HINH_THUC_LIEN_HE as [Hình thức liên hệ] from T_TUYEN_DUNG where 1=1";
        if (txtTitle.Text != "") str += " and C_TITLE LIKE N'%" + txtTitle.Text + "%'";
        if (txtNganhnghe.Text != "") str += " and C_LINH_VUC LIKE N'%" + txtNganhnghe.Text + "%'";
        if (txtDiadiem.Text != "") str += " and C_DIA_DIEM_LAM_VIEC LIKE N'%" + txtDiadiem.Text + "%'";
        ds = CMS.MsSql.FillDataSet(str);
        Whatever.ExcelExport.ExportDataSetToExcel(ds, "danhsach.xls");
    }
}
