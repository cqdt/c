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

public partial class Admin_Modules_Thong_ke_ky_hop_dong : System.Web.UI.UserControl
{
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Thong-ke-ky-hop-dong", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }
        Binddata();
    }
    public void Binddata()
    {
        string sql = "SELECT * FROM T_LD_KYHD where 1=1";
        if ((CMS.Utils.ToString(raddTungay.SelectedDate) != "") && (CMS.Utils.ToString(raddDenngay.SelectedDate) != "")) sql += " and CONVERT(DATETIME,C_NGAY_TAP_TRUNG,101) BETWEEN CONVERT(DATETIME,'" + string.Format("{0:MM/dd/yyyy}", raddTungay.SelectedDate) + "',101) AND CONVERT(DATETIME,'" + string.Format("{0:MM/dd/yyyy}", raddDenngay.SelectedDate) + "',101)";
        sql += " order by PK_LD desc";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        this.gvListLD.DataSource = dtNews;
        gvListLD.DataBind();
    }
    protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvListLD.PageSize = CMS.Utils.ToInteger(ddlPageSize.SelectedValue);
        Binddata();
    }
    protected void gvListLD_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0 && e.Row.RowIndex <= gvListLD.Rows.Count)
        {
            e.Row.Cells[0].Text = "<font face=\"tahoma\" size=\"2\">" + (gvListLD.PageIndex * gvListLD.PageSize + e.Row.RowIndex + 1) + "</font>";
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Binddata();
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetProducts("DELETE FROM T_LD_KYHD", "xóa");
    }
    private void SetProducts(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkFAQs");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("Thong-ke-ky-hop-dong", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
                return;
            }
            string strSql = sql + " WHERE PK_LD IN (" + strIDs + ")";
            CMS.MsSql.ExecuteNonQuery(strSql);
            gvListLD.DataBind();
            lblAlert.Text = "Đã " + mess + " thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn bản ghi cần " + mess;
    }
    protected void btnExportExcel_Click(object sender, EventArgs e)
    {
        string str = "SELECT C_HO_TEN as [Họ tên], C_NGAY_SINH as [Ngày sinh], C_CMND as [CMND], C_DON_VI as [Đơn vị], C_KHOA_HOC as [Khóa học], C_NGAY_TAP_TRUNG as [Ngày tập trung], C_DIA_DIEM as [Địa điểm],C_SBD as [Mã] FROM T_LD_KYHD where 1=1";
        if ((CMS.Utils.ToString(raddTungay.SelectedDate) != "") && (CMS.Utils.ToString(raddDenngay.SelectedDate) != "")) str += " and CONVERT(DATETIME,C_NGAY_TAP_TRUNG,101) BETWEEN CONVERT(DATETIME,'" + string.Format("{0:MM/dd/yyyy}", raddTungay.SelectedDate) + "',101) AND CONVERT(DATETIME,'" + string.Format("{0:MM/dd/yyyy}", raddDenngay.SelectedDate) + "',101)";
        str += " order by PK_LD desc";
        ds = CMS.MsSql.FillDataSet(str);
        Whatever.ExcelExport.ExportDataSetToExcel(ds, "danhsach.xls");
    }
    protected void gvListLD_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        this.gvListLD.PageIndex = e.NewPageIndex;
        this.gvListLD.DataBind();
    }   
}
