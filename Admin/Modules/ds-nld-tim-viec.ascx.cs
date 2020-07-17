using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_Modules_ds_nld_tim_viec : System.Web.UI.UserControl
{
    DataSet ds = new DataSet();
    public int total;
    protected void Page_Load(object sender, EventArgs e)
    {
         

        if (!CMS.TTV.Rule.IsModuleRule("ds-nld-tim-viec", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }
       // total = CMS.MsSql.ExecuteToInt("select count(*) from T_NGUOILAODONG");

        if (CMS.TTV.Web.Utils.GetStringFromQueryString("ht", "") == "")
        {
            tdphien.Visible = false;
            tdcty.Visible = false;
            dangkytu.Visible = false;
            dangkyden.Visible = false;
        }
        else if (CMS.TTV.Web.Utils.GetStringFromQueryString("ht", "") == "0")
        {
            BindPhienGDVL();
            ddlHinhthuc.SelectedValue = Request.QueryString["ht"];
            tdphien.Visible = true;
            tdcty.Visible = false;
            dangkytu.Visible = true;
            dangkyden.Visible = true;
            
        }
        else if (CMS.TTV.Web.Utils.GetStringFromQueryString("ht", "") == "1")
        {
            BindCongty();
            tdcty.Visible = true;
            tdphien.Visible = false;
            ddlHinhthuc.SelectedValue = Request.QueryString["ht"];
            dangkytu.Visible = true;
            dangkyden.Visible = true;
        }

        if (CMS.TTV.Web.Utils.GetStringFromQueryString("phien", "") != "")
        {
            ddlPhien.SelectedValue = CMS.TTV.Web.Utils.GetStringFromQueryString("phien", "");
            BinddataPhien();            
        }

        else if (CMS.TTV.Web.Utils.GetStringFromQueryString("cty", "") != "")
        {
            ddlCongty.SelectedValue = CMS.TTV.Web.Utils.GetStringFromQueryString("cty", "");
            BindataCongTy();
        }
        else
        {
            BinddataAll();
        }


           if (CMS.TTV.Web.Utils.GetStringFromQueryString("st", "") != "") raddStart_date.SelectedDate= DateTime.Parse(CMS.TTV.Web.Utils.GetStringFromQueryString("st", ""));
           if (CMS.TTV.Web.Utils.GetStringFromQueryString("ed", "") != "") raddEnd_date.SelectedDate = DateTime.Parse(CMS.TTV.Web.Utils.GetStringFromQueryString("ed", ""));
    }

   

    public void BindCongty()
    {
        string sql = "SELECT T_TUYENDUNG_KR.C_MATUYENDUNG, T_TUYENDUNG_KR.C_TENCTY"
                  + " FROM T_TUYENDUNG_KR INNER JOIN T_TUYENDUNG_VIECLAM ON T_TUYENDUNG_KR.C_MATUYENDUNG = T_TUYENDUNG_VIECLAM.FK_CTY"
               //   + " WHERE (T_TUYENDUNG_VIECLAM.C_THOIGIANNHANDEN > GETDATE())"
                  + " GROUP BY T_TUYENDUNG_KR.C_MATUYENDUNG, T_TUYENDUNG_KR.C_TENCTY, T_TUYENDUNG_KR.ID ORDER BY T_TUYENDUNG_KR.ID DESC";

        DataTable dtPhien = CMS.MsSql.FillDataTable(sql);
        ddlCongty.DataSource = dtPhien;
        ddlCongty.DataTextField = "C_TENCTY";
        ddlCongty.DataValueField = "C_MATUYENDUNG";
        ddlCongty.DataBind();
        ddlCongty.Items.Insert(0, "Chọn");
    }


    public void BindPhienGDVL()
    {
        string sql = "SELECT * from T_PHIEN_GDVL order by ID desc";
        DataTable dtPhien = CMS.MsSql.FillDataTable(sql);
        ddlPhien.DataSource = dtPhien;
        ddlPhien.DataTextField = "C_PHIEN";
        ddlPhien.DataValueField = "ID";
        ddlPhien.DataBind();
        ddlPhien.Items.Insert(0, "Chọn");
    }

    public void BinddataAll()
    {
        string sql = "SELECT [C_HODEM],[C_TEN],[C_NGAYSINH],[C_GIOITINH],[C_CMND],[C_NOICUTRU],[C_HUYEN],[C_TINH],[C_CHUONGTRINH],[C_SOID],[C_NGAYXUATCANH],[C_NGAYVENUOC],[C_DIENTHOAI],[C_EMAIL],[C_NGOAINGU],[C_CHUNGCHI],[C_DAOTAONGHE1],[C_DAOTAOTU1],[C_DAOTAODEN1],[C_BANGCAP1],[C_BANGCAPKHAC1],[C_NGHELAMVIEC1],[C_CVCUTHE1],[C_CVCUTHETU1],[C_CVCUTHEDEN1] ,[C_NGHELAMVIEC2],[C_CVCUTHE2],[C_CVCUTHETU2],[C_CVCUTHEDEN2] ,[C_NGHELAMVIEC3]  ,[C_CVCUTHE3]  ,[C_CVCUTHETU3]  ,[C_CVCUTHEDEN3] ,[C_NGANHNGHEDUKIENTIM] ,[C_VITRIMONGMUON]   ,[C_MUCLUONGMONGMUON]     ,[C_DIADIEMMONGMUON]     ,[C_MATIMVIEC],[C_NGAYDK] ,ID  FROM [dbo].[T_NGUOILAODONG]";
        sql += "where 1=1";
        sql += " order by ID desc";

        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        total = dtNews.Rows.Count;
        this.gvList.DataSource = dtNews;
        gvList.DataBind();
    }


   

    protected void gvList_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0 && e.Row.RowIndex <= gvList.Rows.Count)
        {
            e.Row.Cells[1].Text = "<font face=\"tahoma\" size=\"2\">" + (gvList.PageIndex * gvList.PageSize + e.Row.RowIndex + 1) + "</font>";
        }
    }


    private void SetGallerys(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkGallerys");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("ds-nld-tim-viec", CMS.TTV.Rules.APPROVE))
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

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetGallerys("DELETE FROM T_NGUOILAODONG", "xóa");
    }

    protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvList.PageSize = CMS.Utils.ToInteger(ddlPageSize.SelectedValue);
    }
    protected void ddlHinhthuc_SelectedIndexChanged(object sender, EventArgs e)
    {
        string url = "Default.aspx?ctl=ds-nld-tim-viec";
        if (ddlHinhthuc.SelectedValue != "")
        {
            url += "&ht=" + ddlHinhthuc.SelectedValue;
        }
        Response.Redirect(url);
    }
    //protected void ddlPhien_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    string url = "Default.aspx?ctl=ds-nld-tim-viec";
    //    if (Request.QueryString["ht"] != null) url += "&ht=" + Request.QueryString["ht"];
    //    if (ddlPhien.SelectedValue !="") url += "&phien=" + ddlPhien.SelectedValue;
    //    Response.Redirect(url);
    //}
    protected void btnTimkiem_Click(object sender, EventArgs e)
    {
        string url = "Default.aspx?ctl=ds-nld-tim-viec";
        if (Request.QueryString["ht"] != null) url += "&ht=" + Request.QueryString["ht"];
        if (ddlPhien.SelectedValue != "") url += "&phien=" + ddlPhien.SelectedValue;
        if (ddlCongty.SelectedValue != "") url += "&cty=" + ddlCongty.SelectedValue;
        if (raddStart_date.SelectedDate != null) url += "&st=" + String.Format("{0:dd-MM-yyyy}", raddStart_date.SelectedDate);
        if (raddEnd_date.SelectedDate != null) url += "&ed=" + String.Format("{0:dd-MM-yyyy}", raddEnd_date.SelectedDate);
        Response.Redirect(url);        
    }


    public void BinddataPhien()
    {
        string sqlphien = "SELECT dbo.T_NGUOILAODONG.C_MATIMVIEC, dbo.T_NGUOILAODONG.C_HODEM, dbo.T_NGUOILAODONG.C_TEN,  "
                     + " dbo.T_NGUOILAODONG.C_NGAYSINH, dbo.T_NGUOILAODONG.C_NOICUTRU, dbo.T_NGUOILAODONG.C_HUYEN, dbo.T_NGUOILAODONG.C_TINH, "
                     + " dbo.T_NGUOILAODONG.C_DIENTHOAI, dbo.T_NGUOILAODONG.ID, dbo.T_PHIEN_GDVL_CHITIET.ID AS ChitietPhien_ID, dbo.T_PHIEN_GDVL.ID AS Phien_ID,  "
                     + " dbo.T_PHIEN_GDVL.C_PHIEN, dbo.T_PHIEN_GDVL_CHITIET.C_VITRI,dbo.T_PHIEN_GDVL_CHITIET.C_CTY "
                     + " FROM  dbo.T_NGUOILAODONG INNER JOIN "
                     + " dbo.T_NGUOILAODONG_TV ON dbo.T_NGUOILAODONG.C_MATIMVIEC = dbo.T_NGUOILAODONG_TV.FK_MATV INNER JOIN "
                     + " dbo.T_PHIEN_GDVL_CHITIET ON dbo.T_NGUOILAODONG_TV.FK_PHIEN = dbo.T_PHIEN_GDVL_CHITIET.ID INNER JOIN "
                     + " dbo.T_PHIEN_GDVL ON dbo.T_PHIEN_GDVL_CHITIET.FK_PHIEN = dbo.T_PHIEN_GDVL.ID where 1=1";

        if (CMS.TTV.Web.Utils.GetStringFromQueryString("phien", "") != "") sqlphien += " and dbo.T_PHIEN_GDVL.ID=" + CMS.TTV.Web.Utils.GetStringFromQueryString("phien", "");
        if (CMS.TTV.Web.Utils.GetStringFromQueryString("st", "") != "") sqlphien += " and convert(datetime,T_NGUOILAODONG_TV.C_NGAYGUI,103) > convert(datetime," + CMS.TTV.Web.Utils.GetStringFromQueryString("st", "") + ",103)";
        if (CMS.TTV.Web.Utils.GetStringFromQueryString("ed", "") != "") sqlphien += " and convert(datetime,T_NGUOILAODONG_TV.C_NGAYGUI,103) < convert(datetime," + CMS.TTV.Web.Utils.GetStringFromQueryString("ed", "") + ",103)";      
                     sqlphien += " ORDER BY dbo.T_NGUOILAODONG.ID desc";

                     DataTable dtNews = CMS.MsSql.FillDataTable(sqlphien);
        total = dtNews.Rows.Count;
        this.gvList.DataSource = dtNews;
        gvList.DataBind();

    }

    public void BindataCongTy()
    {
        string sql = "SELECT dbo.T_NGUOILAODONG.C_MATIMVIEC, dbo.T_NGUOILAODONG.C_HODEM, dbo.T_NGUOILAODONG.C_TEN, "
                      + " dbo.T_NGUOILAODONG.C_NGAYSINH, dbo.T_NGUOILAODONG.C_DIENTHOAI, dbo.T_NGUOILAODONG.C_NOICUTRU, dbo.T_NGUOILAODONG.C_HUYEN,  "
                      + " dbo.T_NGUOILAODONG.C_TINH, dbo.T_TUYENDUNG_KR.ID, dbo.T_TUYENDUNG_KR.C_TENCTY, dbo.T_TUYENDUNG_VIECLAM.C_VITRI, "
                      + " dbo.T_TUYENDUNG_VIECLAM.C_MOTA, dbo.T_TUYENDUNG_KR.C_MATUYENDUNG "
                      + " FROM dbo.T_TUYENDUNG_VIECLAM INNER JOIN "
                      + " dbo.T_TUYENDUNG_KR ON dbo.T_TUYENDUNG_VIECLAM.FK_CTY = dbo.T_TUYENDUNG_KR.C_MATUYENDUNG INNER JOIN dbo.T_NGUOILAODONG INNER JOIN"
                      + " dbo.T_NGUOILAODONG_TV ON dbo.T_NGUOILAODONG.C_MATIMVIEC = dbo.T_NGUOILAODONG_TV.FK_MATV ON  "
                      + " dbo.T_TUYENDUNG_VIECLAM.ID = dbo.T_NGUOILAODONG_TV.FK_TUYENDUNGVL where 1=1";

                      if (CMS.TTV.Web.Utils.GetStringFromQueryString("cty", "") != "") sql += " and dbo.T_TUYENDUNG_KR.C_MATUYENDUNG='" + CMS.TTV.Web.Utils.GetStringFromQueryString("cty", "") + "'";
                      if (CMS.TTV.Web.Utils.GetStringFromQueryString("st", "") != "") sql += " and convert(datetime,T_NGUOILAODONG_TV.C_NGAYGUI,103) >= convert(datetime,'" + CMS.TTV.Web.Utils.GetStringFromQueryString("st", "") + "',103)";
                      if (CMS.TTV.Web.Utils.GetStringFromQueryString("ed", "") != "") sql += " and convert(datetime,T_NGUOILAODONG_TV.C_NGAYGUI,103) <= convert(datetime,'" + CMS.TTV.Web.Utils.GetStringFromQueryString("ed", "") + "',103)";
                      sql += " ORDER BY dbo.T_NGUOILAODONG.ID DESC";





        DataTable dtNews = CMS.MsSql.FillDataTable(sql);
        if (dtNews != null)
        {
            total = dtNews.Rows.Count;
            this.gvList.DataSource = dtNews;
            gvList.DataBind();
        }
    }

    protected void btnExportExcel_Click(object sender, EventArgs e)
    {
        string sql = "";
        if (CMS.TTV.Web.Utils.GetStringFromQueryString("phien", "") != "")
        {
            sql += "SELECT dbo.T_NGUOILAODONG.C_MATIMVIEC [Mã TV], dbo.T_NGUOILAODONG.C_HODEM + ' ' +  dbo.T_NGUOILAODONG.C_TEN [Họ tên],  "
                       + " dbo.T_NGUOILAODONG.C_NGAYSINH [Ngày sinh], dbo.T_NGUOILAODONG.C_NOICUTRU + ' - ' + dbo.T_NGUOILAODONG.C_HUYEN + ' - ' + dbo.T_NGUOILAODONG.C_TINH [Địa chỉ], dbo.T_NGUOILAODONG.C_TINH [Tỉnh],"
                       + " dbo.T_NGUOILAODONG.C_DIENTHOAI [Điện thoại], "
                       + " dbo.T_PHIEN_GDVL_CHITIET.C_VITRI [Vị trí ứng tuyển],dbo.T_PHIEN_GDVL_CHITIET.C_CTY [Công ty ứng tuyển], dbo.T_PHIEN_GDVL.C_PHIEN [Phiên GDVL]"
                       + " FROM dbo.T_NGUOILAODONG INNER JOIN "
                       + " dbo.T_NGUOILAODONG_TV ON dbo.T_NGUOILAODONG.C_MATIMVIEC = dbo.T_NGUOILAODONG_TV.FK_MATV INNER JOIN "
                       + " dbo.T_PHIEN_GDVL INNER JOIN "
                       + " dbo.T_PHIEN_GDVL_CHITIET ON dbo.T_PHIEN_GDVL.ID = dbo.T_PHIEN_GDVL_CHITIET.FK_PHIEN ON  dbo.T_NGUOILAODONG_TV.FK_PHIEN = dbo.T_PHIEN_GDVL_CHITIET.ID where 1=1"
                       + " and dbo.T_PHIEN_GDVL.ID=" + CMS.TTV.Web.Utils.GetStringFromQueryString("phien", "") + ""
                       + " ORDER BY dbo.T_NGUOILAODONG.ID desc ";

        }
        else if (CMS.TTV.Web.Utils.GetStringFromQueryString("cty", "") != "")
        {
            sql += "SELECT dbo.T_NGUOILAODONG.C_MATIMVIEC [Mã TV], dbo.T_NGUOILAODONG.C_HODEM + ' ' + dbo.T_NGUOILAODONG.C_TEN [Họ tên], "
                      + " dbo.T_NGUOILAODONG.C_NGAYSINH [Ngày sinh], dbo.T_NGUOILAODONG.C_NOICUTRU + ' - ' + dbo.T_NGUOILAODONG.C_HUYEN +  "
                      + " ' - ' + dbo.T_NGUOILAODONG.C_TINH [Địa chỉ],dbo.T_NGUOILAODONG.C_TINH [Tỉnh], dbo.T_NGUOILAODONG.C_DIENTHOAI [Điện thoại], dbo.T_TUYENDUNG_VIECLAM.C_VITRI [Vị trí ứng tuyển], "
                      + " dbo.T_TUYENDUNG_VIECLAM.C_MOTA [Mô tả], dbo.T_TUYENDUNG_KR.C_TENCTY [Công ty ứng tuyển]"
                      + " FROM dbo.T_TUYENDUNG_VIECLAM INNER JOIN "
                      + " dbo.T_TUYENDUNG_KR ON dbo.T_TUYENDUNG_VIECLAM.FK_CTY = dbo.T_TUYENDUNG_KR.C_MATUYENDUNG INNER JOIN dbo.T_NGUOILAODONG INNER JOIN "
                      + " dbo.T_NGUOILAODONG_TV ON dbo.T_NGUOILAODONG.C_MATIMVIEC = dbo.T_NGUOILAODONG_TV.FK_MATV ON "
                      + " dbo.T_TUYENDUNG_VIECLAM.ID = dbo.T_NGUOILAODONG_TV.FK_TUYENDUNGVL where 1=1"
                      + " and dbo.T_TUYENDUNG_KR.C_MATUYENDUNG='" + CMS.TTV.Web.Utils.GetStringFromQueryString("cty", "") + "'"
                      + " ORDER BY dbo.T_NGUOILAODONG.ID DESC";
        }
        else
        {
            sql += "SELECT  dbo.T_NGUOILAODONG.C_MATIMVIEC AS [Mã tìm việc], dbo.T_NGUOILAODONG.C_HODEM + ' ' + dbo.T_NGUOILAODONG.C_TEN AS [Họ tên], "
                    +"  dbo.T_NGUOILAODONG.C_NGAYSINH AS [Ngày sinh], "
                    + "  dbo.T_NGUOILAODONG.C_NOICUTRU + ' - ' + dbo.T_NGUOILAODONG.C_HUYEN + ' - ' + dbo.T_NGUOILAODONG.C_TINH AS [Địa chỉ], dbo.T_NGUOILAODONG.C_TINH [Tỉnh],"
                    +"  dbo.T_NGUOILAODONG.C_DIENTHOAI AS [Điện thoại], dbo.T_DM_VITRI.C_VITRI_KR AS [Chi tiết vị trí], dbo.T_NGUOILAODONG.C_GIOITINH AS [Giới tính], "
                    +"  dbo.T_NGUOILAODONG.C_CMND AS CMND, dbo.T_NGUOILAODONG.C_CHUONGTRINH AS [Chương trình tham gia], dbo.T_NGUOILAODONG.C_SOID AS [Số ID], "
                    +"  dbo.T_NGUOILAODONG.C_NGAYXUATCANH AS [Ngày xuất cảnh], dbo.T_NGUOILAODONG.C_NGAYVENUOC AS [Ngày về nước], "
                    +"  dbo.T_NGUOILAODONG.C_EMAIL AS Email, dbo.T_NGUOILAODONG.C_NGOAINGU AS [Ngoại ngữ], dbo.T_NGUOILAODONG.C_CHUNGCHI AS [Chứng chỉ], "
                    +"  dbo.T_DM_NGHE.C_NGHE_KR AS [Đào tạo nghề 1], dbo.T_NGUOILAODONG.C_DAOTAOTU1 AS [Đào tạo từ 1], dbo.T_NGUOILAODONG.C_DAOTAODEN1 AS [Đào tạo đến 1], "
                    +" dbo.T_NGUOILAODONG.C_BANGCAP1 AS [Bằng cấp 1], dbo.T_NGUOILAODONG.C_BANGCAPKHAC1 AS [Bằng cấp khác 1], "
                    +" T_DM_NGHE_1.C_NGHE_KR AS [Nghề làm vịệc 1], dbo.T_NGUOILAODONG.C_CVCUTHE1 AS [Công việc cụ thể 1], "
                    +"  dbo.T_NGUOILAODONG.C_CVCUTHETU1 AS [Công việc cụ thể 1 từ], dbo.T_NGUOILAODONG.C_CVCUTHEDEN1 AS [Công việc cụ thể 1 đến], "
                    +"  dbo.T_NGUOILAODONG.C_DAOTAOTU2 AS [Đào tạo từ 2], dbo.T_NGUOILAODONG.C_DAOTAODEN2 AS [Đào tạo đến 2], "
                    +"  dbo.T_NGUOILAODONG.C_BANGCAP2 AS [Bằng cấp 2], dbo.T_NGUOILAODONG.C_BANGCAPKHAC2 AS [Bằng cấp khác 2], "
                    +"  dbo.T_NGUOILAODONG.C_CVCUTHE2 AS [Công việc cụ thể 2], dbo.T_NGUOILAODONG.C_CVCUTHETU2 AS [Công việc cụ thể từ 2], "
                    +"  dbo.T_NGUOILAODONG.C_CVCUTHEDEN2 AS [Công việc cụ thể đến 2], dbo.T_NGUOILAODONG.C_MUCLUONGMONGMUON AS [Mức lương mong muốn], "
                    +"  dbo.T_NGUOILAODONG.C_DIADIEMMONGMUON AS [Địa điểm mong muốn], dbo.T_NGUOILAODONG.C_NGAYDK AS [Ngày đăng ký] "
                    +" FROM         dbo.T_DM_VITRI INNER JOIN "
                    +"  dbo.T_NGUOILAODONG ON dbo.T_DM_VITRI.C_MAVT = dbo.T_NGUOILAODONG.C_VITRIMONGMUON INNER JOIN "
                    +"  dbo.T_DM_NGHE ON dbo.T_NGUOILAODONG.C_DAOTAONGHE1 = dbo.T_DM_NGHE.C_MA INNER JOIN "
                    +"  dbo.T_DM_NGHE AS T_DM_NGHE_1 ON dbo.T_NGUOILAODONG.C_NGHELAMVIEC1 = T_DM_NGHE_1.C_MA "
                    +" ORDER BY dbo.T_DM_VITRI.ID DESC";
        }
        


        ds = CMS.MsSql.FillDataSet(sql);
        Whatever.ExcelExport.ExportDataSetToExcel(ds, "danh-sach-nguoi-lao-dong-dang-ky-tim-viec-trong-nuoc.xls");


    }

    protected void gvList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvList.PageIndex = e.NewPageIndex;
        gvList.DataBind();
    }
}