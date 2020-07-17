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


public partial class Admin_Modules_Danh_sach_dang_ky_kiem_tra_tieng_han : System.Web.UI.UserControl
{
    public int total;
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Danh-sach-dang-ky-kiem-tra-tieng-han", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }
        //BindDS();
        //total = ds.Tables[0].Rows.Count;
        //DataTable dt = new DataTable();
      //  dt = CMS.MsSql.FillDataTable("select * from T_DIEM_DANG_KY_KIEM_TRA_TIENG_HAN");
      
        Binddata();
    }

    public void BindDS()
    {
        string str = "SELECT t.C_HO_TEN as [Họ tên],convert(varchar, t.C_NGAY_SINH,103) as [Ngày sinh],t.C_CMND as [CMND],t.C_TINH as [Tỉnh],t.C_HUYEN as [Huyện],t.C_DIA_CHI_HIEN_TAI as [Địa chỉ hiện tại],t.C_THOI_GIAN_HOC as [Thời gian học],t.C_CO_SO_DAO_TAO as [Cơ sở đào tạo],t.C_PHONE as [Điện thoại],t.C_MOBILE as [Di động],t.C_DIA_CHI_BAO_TIN as [Địa chỉ báo tin],t.C_DON_VI as [Đơn vị],t.C_NGANH as [Ngành],convert(varchar, t.C_NGAY_DK,103) as [Ngày đăng ký],t.C_SBD as [Số báo danh],t.C_DIEM_DOC as [Điểm đọc],t.C_DIEM_NGHE as [Điểm nghe],(t.C_DIEM_DOC+t.C_DIEM_NGHE) as [Tổng điểm] from T_DIEM_DANG_KY_KIEM_TRA_TIENG_HAN as t where 1=1";
        if (CMS.Utils.ToInteger(ddlStatus.SelectedValue) >= 0) str += " and t.C_STATUS=" + ddlStatus.SelectedValue;
        if (ddlTinh.SelectedValue != "") str += " and t.C_TINH=N'" + ddlTinh.SelectedValue + "'";
        if (ddlNganh.SelectedValue != "") str += " and t.C_NGANH=N'" + ddlNganh.SelectedValue + "'";
        if (ddlDonvi.SelectedValue != "") str += " and t.C_DON_VI=N'" + ddlDonvi.SelectedValue + "'";
        if (ddlColumn.SelectedValue != "") str += " and " + ddlColumn.SelectedValue + " " + ddlCompare.SelectedValue + "'" + txtDK.Text.Trim() + "'";
        ds = CMS.MsSql.FillDataSet(str);
        
    }

    public void Binddata()
    {
        string sql = "SELECT *,(T_DIEM_DANG_KY_KIEM_TRA_TIENG_HAN.C_DIEM_DOC+T_DIEM_DANG_KY_KIEM_TRA_TIENG_HAN.C_DIEM_NGHE) as C_TONG from T_DIEM_DANG_KY_KIEM_TRA_TIENG_HAN  where 1=1";
        if (CMS.Utils.ToInteger(ddlStatus.SelectedValue) >= 0) sql += " and T_DIEM_DANG_KY_KIEM_TRA_TIENG_HAN.C_STATUS=" + ddlStatus.SelectedValue;
        if (ddlTinh.SelectedValue!="") sql += " and T_DIEM_DANG_KY_KIEM_TRA_TIENG_HAN.C_TINH=N'" + ddlTinh.SelectedValue + "'";
        if (ddlNganh.SelectedValue != "") sql += " and T_DIEM_DANG_KY_KIEM_TRA_TIENG_HAN.C_NGANH=N'" + ddlNganh.SelectedValue + "'";
        if (ddlDonvi.SelectedValue != "") sql += " and T_DIEM_DANG_KY_KIEM_TRA_TIENG_HAN.C_DON_VI=N'" + ddlDonvi.SelectedValue + "'";
        if (ddlColumn.SelectedValue != "") sql += " and " + ddlColumn.SelectedValue  + " " + ddlCompare.SelectedValue +"'" + txtDK.Text.Trim() + "'";

        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        total = dtNews.Rows.Count;
        this.gvListRegister.DataSource = dtNews;
        gvListRegister.DataBind();
    }
    protected void gvListRegister_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        this.gvListRegister.PageIndex = e.NewPageIndex;
        this.gvListRegister.DataBind();       
    }
    protected void gvListRegister_RowCreated(object sender, GridViewRowEventArgs e)
    {
       
        if (e.Row.RowIndex >= 0 && e.Row.RowIndex <= gvListRegister.Rows.Count)
        {
            e.Row.Cells[0].Text = "<font face=\"tahoma\" size=\"2\">" + (gvListRegister.PageIndex * gvListRegister.PageSize + e.Row.RowIndex + 1) + "</font>";
        }
    }
    protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvListRegister.PageSize = CMS.Utils.ToInteger(ddlPageSize.SelectedValue);
        Binddata();
    }
    protected void btnExportExcel_Click(object sender, EventArgs e)
    {
        BindDS();
        Whatever.ExcelExport.ExportDataSetToExcel(ds, "danhsach.xls");
    }
    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        Binddata();
    }
    protected void ddlTinh_SelectedIndexChanged(object sender, EventArgs e)
    {
        Binddata();
    }
    protected void ddlNganh_SelectedIndexChanged(object sender, EventArgs e)
    {
        Binddata();
    }
    protected void ddlNganh_DataBound(object sender, EventArgs e)
    {
        ddlNganh.Items.Insert(0, new ListItem("--- Tất cả ---", ""));
    }
    protected void ddlDonvi_SelectedIndexChanged(object sender, EventArgs e)
    {
        Binddata();
    }
    protected void ddlDonvi_DataBound(object sender, EventArgs e)
    {
        ddlDonvi.Items.Insert(0, new ListItem("--- Tất cả ---", ""));
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Binddata();
    }
}
