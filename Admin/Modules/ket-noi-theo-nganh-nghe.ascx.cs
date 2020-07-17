using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Admin_Modules_ket_noi_theo_nganh_nghe : System.Web.UI.UserControl
{
    DataSet ds = new DataSet();
    public int total;
    public int total2 = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("vitrituyendung", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }

        BindNganhnghe();

        if (CMS.TTV.Web.Utils.GetStringFromQueryString("nganh", "") != "")
        {
            cboNganhngheduocdaotao.SelectedValue = CMS.TTV.Web.Utils.GetStringFromQueryString("nganh", "");
         //   Label1.Text = CMS.TTV.Web.Utils.GetStringFromQueryString("nganh", "");
        }


        BindataCongTy();

    }
    public void BindNganhnghe()
    {
        string sql = "SELECT * from T_DM_NGHE ORDER BY C_MA";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        if (dtNews.Rows.Count > 0)
        {
            cboNganhngheduocdaotao.DataSource = dtNews;
            cboNganhngheduocdaotao.DataTextField = "C_NGHE";
            cboNganhngheduocdaotao.DataValueField = "C_MA";
            cboNganhngheduocdaotao.DataBind();
            cboNganhngheduocdaotao.Items.Insert(0, "--- ---- ---");
        }
    }
    public void BindCongty()
    {
        //string sql = "SELECT T_TUYENDUNG_KR.C_MATUYENDUNG, T_TUYENDUNG_KR.C_TENCTY"
        //          + " FROM T_TUYENDUNG_KR INNER JOIN T_TUYENDUNG_VIECLAM ON T_TUYENDUNG_KR.C_MATUYENDUNG = T_TUYENDUNG_VIECLAM.FK_CTY"
        //          + " WHERE (T_TUYENDUNG_VIECLAM.C_THOIGIANNHANDEN > GETDATE())"
        //          + " GROUP BY T_TUYENDUNG_KR.C_MATUYENDUNG, T_TUYENDUNG_KR.C_TENCTY, T_TUYENDUNG_KR.ID ORDER BY T_TUYENDUNG_KR.ID DESC";

        //DataTable dtPhien = CMS.MsSql.FillDataTable(sql);
        //cboNganhngheduocdaotao.DataSource = dtPhien;
        //cboNganhngheduocdaotao.DataTextField = "C_TENCTY";
        //cboNganhngheduocdaotao.DataValueField = "C_MATUYENDUNG";
        //cboNganhngheduocdaotao.DataBind();
        //cboNganhngheduocdaotao.Items.Insert(0, "");
    }




    public void BindataCongTy()
    {
        string sql = "SELECT T_TUYENDUNG_KR.C_MATUYENDUNG,dbo.T_TUYENDUNG_KR.C_MATUYENDUNG, dbo.T_TUYENDUNG_KR.C_TENCTY, dbo.T_TUYENDUNG_VIECLAM.C_MOTA, "
                      + " dbo.T_TUYENDUNG_VIECLAM.C_THOIGIANTUYEN, dbo.T_TUYENDUNG_VIECLAM.C_NGAY, dbo.T_DM_VITRI.C_VITRI_KR,  dbo.T_TUYENDUNG_VIECLAM.ID "
                      + " FROM  dbo.T_TUYENDUNG_VIECLAM INNER JOIN "
                      + " dbo.T_TUYENDUNG_KR ON dbo.T_TUYENDUNG_VIECLAM.FK_CTY = dbo.T_TUYENDUNG_KR.C_MATUYENDUNG INNER JOIN "
                      + " dbo.T_DM_VITRI ON dbo.T_TUYENDUNG_VIECLAM.C_VITRI = dbo.T_DM_VITRI.C_MAVT "
                      + " WHERE 1=1 ";

        if (CMS.TTV.Web.Utils.GetStringFromQueryString("nganh", "") != "")
        {
            sql += " and dbo.T_TUYENDUNG_VIECLAM.C_NGHELAMVIEC =N'" + CMS.TTV.Web.Utils.GetStringFromQueryString("nganh", "") + "'";
        }
        sql += " ORDER BY T_TUYENDUNG_KR.C_MATUYENDUNG DESC";


        string sql2 = "SELECT     ID, C_MATIMVIEC, C_HODEM, C_TEN, C_DIENTHOAI, C_EMAIL, C_CHUONGTRINH, C_NOICUTRU, C_HUYEN, C_TINH,C_NGAYSINH FROM         dbo.T_NGUOILAODONG  WHERE 1=1 ";
        if (CMS.TTV.Web.Utils.GetStringFromQueryString("nganh", "") != "")
        {
            sql2 += " AND C_NGANHNGHEDUKIENTIM =N'" + CMS.TTV.Web.Utils.GetStringFromQueryString("nganh", "") + "'";
        }

        DataTable dtNews = CMS.MsSql.FillDataTable(sql);
        DataTable dtNews2 = CMS.MsSql.FillDataTable(sql2);
        if (dtNews != null)
        {
            total = dtNews.Rows.Count;
            gvList.DataSource = dtNews;
            gvList.DataBind();
        }
        if (dtNews2 != null)
        {
            total2 = dtNews2.Rows.Count;
            GridView1.DataSource = dtNews2;
            GridView1.DataBind();
        }

    }


    protected void btnTimkiem_Click(object sender, EventArgs e)
    {
        string url = "Default.aspx?ctl=ket-noi-theo-nganh-nghe";
        if (cboNganhngheduocdaotao.SelectedValue != "") url += "&nganh=" + cboNganhngheduocdaotao.SelectedValue;
        Response.Redirect(url);
    }

    protected void gvList_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0 && e.Row.RowIndex <= gvList.Rows.Count)
        {
            e.Row.Cells[0].Text = "<font face=\"tahoma\" size=\"2\">" + (gvList.PageIndex * gvList.PageSize + e.Row.RowIndex + 1) + "</font>";
        }
    }
    protected void gvList_RowCreated1(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0 && e.Row.RowIndex <= GridView1.Rows.Count)
        {
            e.Row.Cells[0].Text = "<font face=\"tahoma\" size=\"2\">" + (GridView1.PageIndex * GridView1.PageSize + e.Row.RowIndex + 1) + "</font>";
        }
    }
    protected void gvList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvList.PageIndex = e.NewPageIndex;
        gvList.DataBind();
    }

    protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        //gvList.PageSize = CMS.Utils.ToInteger(ddlPageSize.SelectedValue);
        //gvList.DataBind();
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetGallerys("DELETE FROM T_TUYENDUNG_VIECLAM", "xóa");
    }

    protected void btnExportExcel_Click(object sender, EventArgs e)
    {
        string sql = "";

        sql += "SELECT dbo.T_TUYENDUNG_KR.C_MATUYENDUNG [Mã tuyển dụng], dbo.T_TUYENDUNG_KR.C_TENCTY [Công ty],dbo.T_DM_VITRI.C_VITRI_KR [Vị trí tuyển],  dbo.T_TUYENDUNG_VIECLAM.C_MOTA [Mô tả], "
                      + " dbo.T_TUYENDUNG_VIECLAM.C_THOIGIANTUYEN [Thời gian tuyển]"
                      + " FROM  dbo.T_TUYENDUNG_VIECLAM INNER JOIN "
                      + " dbo.T_TUYENDUNG_KR ON dbo.T_TUYENDUNG_VIECLAM.FK_CTY = dbo.T_TUYENDUNG_KR.C_MATUYENDUNG INNER JOIN "
                      + " dbo.T_DM_VITRI ON dbo.T_TUYENDUNG_VIECLAM.C_VITRI = dbo.T_DM_VITRI.C_MAVT "
                      + " WHERE 1=1 ";

        if (CMS.TTV.Web.Utils.GetStringFromQueryString("nganh", "") != "") sql += " and dbo.T_TUYENDUNG_KR.C_MATUYENDUNG ='" + CMS.TTV.Web.Utils.GetStringFromQueryString("cty", "") + "'";

        sql += " ORDER BY T_TUYENDUNG_KR.C_MATUYENDUNG DESC";



        ds = CMS.MsSql.FillDataSet(sql);
        Whatever.ExcelExport.ExportDataSetToExcel(ds, "danh-sach-vi-tri-ung-tuyen.xls");
    }

    private void SetGallerys(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkGallerys");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("vitrituyendung", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
                return;
            }
            string strSql = sql + " WHERE ID IN (" + strIDs + ")";
            CMS.MsSql.ExecuteNonQuery(strSql);
            gvList.DataBind();
            lblAlert.Text = "Đã " + mess + " thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn thư viện ảnh liệu cần " + mess;
    }

}
