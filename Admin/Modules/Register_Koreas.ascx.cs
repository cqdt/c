using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class Admin_Modules_Register_Koreas : System.Web.UI.UserControl
{
    DataTable dt = new DataTable();
    DataSet ds = new DataSet();
    public int total;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Register_Koreas", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }       
       
        Binddata();
    }
    protected void gvListRegister_RowCreated(object sender, GridViewRowEventArgs e)
    {        
        if (e.Row.RowIndex >= 0 && e.Row.RowIndex <= gvListRegister.Rows.Count)
        {
            e.Row.Cells[0].Text = "<font face=\"tahoma\" size=\"2\">" + (gvListRegister.PageIndex * gvListRegister.PageSize + e.Row.RowIndex + 1) + "</font>";
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Register_Koreas", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }
        string sql = "";
        for (int i = 0; i < gvListRegister.Rows.Count; i++)
        {
            int ID = CMS.Utils.ToInteger(gvListRegister.DataKeys[i].Value);
           /// string SBD = CMS.Utils.ToString((gvListRegister.Rows[i].Cells[10].FindControl("txtSBD") as TextBox).Text);
           // string diem = CMS.Utils.ToString((gvListRegister.Rows[i].Cells[9].FindControl("txtDiem") as TextBox).Text);
            bool bKho = CMS.Utils.ToBoolean((gvListRegister.Rows[i].Cells[6].FindControl("rblKho") as RadioButtonList).SelectedValue);
            int iKho = bKho ? 1 : 0;
            sql += "UPDATE T_DK SET C_STATUS=" + iKho + " WHERE PK_DK=" + ID + "";
        }
        lblAlert.Text = "Đã cập nhập thành công!";
        if (sql != "") CMS.MsSql.ExecuteNonQuery(sql);
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetAdvs("DELETE FROM T_DK", "xóa");
    }
    private void SetAdvs(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkFAQs");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("Register_Koreas", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền " + mess;
                return;
            }
            string strSql = sql + " WHERE PK_DK IN (" + strIDs + ")";
            CMS.MsSql.ExecuteNonQuery(strSql);
            gvListRegister.DataBind();
            lblAlert.Text = "Đã " + mess + " thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn đối tượng cần " + mess;
    }
    protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvListRegister.PageSize = CMS.Utils.ToInteger(ddlPageSize.SelectedValue);
        Binddata();
    }   
   
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx?ctl=Register_Koreas");
    }
    protected void btnExportExcel_Click(object sender, EventArgs e)
    {           
        Whatever.ExcelExport.ExportDataSetToExcel(ds, "danhsach.xls");
    }
    public void Binddata()
    {
        string str = "SELECT t.C_HO_TEN as [Họ tên],convert(varchar, t.C_NGAY_SINH,103) as [Ngày sinh],t.C_CMND as [CMND],t.C_TINH as [Tỉnh],t.C_HUYEN as [Huyện],t.C_DIA_CHI_HIEN_TAI as [Địa chỉ hiện tại],t.C_THOI_GIAN_HOC as [Thời gian học],t.C_CO_SO_DAO_TAO as [Cơ sở đào tạo],t.C_PHONE as [Điện thoại],t.C_MOBILE as [Di động],t.C_DIA_CHI_BAO_TIN as [Địa chỉ báo tin],T_MENU.C_NAME as [Đơn vị],m.C_NAME as [Ngành],convert(varchar, t.C_NGAY_DK,103) as [Ngày đăng ký] from T_DK as t,T_MENU,T_MENU as m where (t.FK_DON_VI=T_MENU.PK_MENU) and (t.FK_NGANH=m.PK_MENU)";
        if (ddlTinh.SelectedValue != "") str += " and t.C_TINH=N'" + ddlTinh.SelectedValue + "'";
        if (ddlNganh.SelectedValue != "") str += " and m.C_NAME=N'" + ddlNganh.SelectedValue + "'";
        if (ddlDonvi.SelectedValue != "") str += " and T_MENU.C_NAME=N'" + ddlDonvi.SelectedValue + "'";
        if ((CMS.Utils.ToString(raddTungay.SelectedDate) != "") && (CMS.Utils.ToString(raddDenngay.SelectedDate) != "")) str += " and CONVERT(DATETIME,C_NGAY_DK,101) BETWEEN CONVERT(DATETIME,'" + string.Format("{0:MM/dd/yyyy}", raddTungay.SelectedDate) + "',101) AND CONVERT(DATETIME,'" + string.Format("{0:MM/dd/yyyy}", raddDenngay.SelectedDate) + "',101)";
        ds = CMS.MsSql.FillDataSet(str);
        string sql = "SELECT t.*,T_MENU.C_NAME as C_DONVI,m.C_NAME as C_NGANH from T_DK as t,T_MENU,T_MENU as m where (t.FK_DON_VI=T_MENU.PK_MENU) and (t.FK_NGANH=m.PK_MENU)";
        if (ddlTinh.SelectedValue != "") sql += " and t.C_TINH=N'" + ddlTinh.SelectedValue + "'";
        if (ddlNganh.SelectedValue != "") sql += " and m.C_NAME=N'" + ddlNganh.SelectedValue + "'";
        if (ddlDonvi.SelectedValue != "") sql += " and T_MENU.C_NAME=N'" + ddlDonvi.SelectedValue + "'";        
        if ((CMS.Utils.ToString(raddTungay.SelectedDate) != "") && (CMS.Utils.ToString(raddDenngay.SelectedDate) != "")) sql += " and CONVERT(DATETIME,C_NGAY_DK,101) BETWEEN CONVERT(DATETIME,'" + string.Format("{0:MM/dd/yyyy}", raddTungay.SelectedDate) + "',101) AND CONVERT(DATETIME,'" + string.Format("{0:MM/dd/yyyy}", raddDenngay.SelectedDate) + "',101)";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        total = dtNews.Rows.Count;
        this.gvListRegister.DataSource = dtNews;
        gvListRegister.DataBind();
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
