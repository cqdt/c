using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Text.RegularExpressions;

public partial class Admin_Modules_ds_khai_bao_thong_tin : System.Web.UI.UserControl
{

    DataSet ds = new DataSet();
    public int total;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("ds-khai-bao-thong-tin", CMS.TTV.Rules.APPROVE))
        {
            //lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            //return;
        }
        total = CMS.MsSql.ExecuteToInt("select count(*) from T_KHAIBAO_THONGTIN");
        Binddata();
    }



    protected void btnInsert_Click(object sender, EventArgs e)
    {
        string url = "Default.aspx?ctl=chi-tiet-khai-bao-thong-tin";     
        Response.Redirect(url);
    }


    private string GetCheckbox()
    {
        string[] arrID = Request.Form.GetValues("chkGallerys");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("ds-khai-bao-thong-tin", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            }
            return strIDs;
        }
        else return "";
    }

    public void Binddata()
    {
        string sql = "";
        sql += "select *," +
            "case when C_TENDN5 is not null then C_TENDN5 when C_TENDN4 is not null then C_TENDN4 else C_TENDN3 end C_TENDNTD, " +
            "dbo.getdiachi_hanquoc(C_DIACHIDN1,null,null,null,null) AS C_DIACHIDOANHNGHIEP, " +
            "dbo.getdiachi_hanquoc(C_DIACHIDN2,null,null,null,null) AS C_DIACHIDOANHNGHIEP1, " +
            "dbo.getdiachi_hanquoc(C_DIACHIDN5,C_DIACHIDN4,C_DIACHIDN3,null,null) AS C_DIACHIDOANHNGHIEPTD, " +
            "case when C_DIENTHOAIDN5 is not null then C_DIENTHOAIDN5 when C_DIENTHOAIDN4 is not null then C_DIENTHOAIDN4 else C_DIENTHOAIDN3 end C_DIENTHOAIDNTD " +
            " from T_KHAIBAO_THONGTIN where 1=1";
        if (txtsohochieu.Text != "") sql += " and C_HOCHIEU like '%" + txtsohochieu.Text + "%'";
        if ((raddNhapcanhden.SelectedDate.ToString() != "") && (raddNhapcanhtu.SelectedDate.ToString() != "")) sql += " and CONVERT(DATETIME,C_NGAYNHAPCANH,103) BETWEEN CONVERT(DATETIME,'" + string.Format("{0:dd/MM/yyyy}", raddNhapcanhtu.SelectedDate) + "',103) AND CONVERT(DATETIME,'" + string.Format("{0:dd/MM/yyyy}", raddNhapcanhden.SelectedDate) + "',103)";
        if ((khaibaotu.SelectedDate.ToString() != "") && (khaibaoden.SelectedDate.ToString() != "")) sql += " and CONVERT(DATETIME,C_NGAYKHAIBAODAU,103) BETWEEN CONVERT(DATETIME,'" + string.Format("{0:dd/MM/yyyy}", khaibaotu.SelectedDate) + "',103) AND CONVERT(DATETIME,'" + string.Format("{0:dd/MM/yyyy}", khaibaoden.SelectedDate) + "',103)";
        if ((khaibaocuoitu.SelectedDate.ToString() != "") && (khaibaocuoiden.SelectedDate.ToString() != "")) sql += " and CONVERT(DATETIME,C_NGAYKHAIBAOCUOI,103) BETWEEN CONVERT(DATETIME,'" + string.Format("{0:dd/MM/yyyy}", khaibaocuoitu.SelectedDate) + "',103) AND CONVERT(DATETIME,'" + string.Format("{0:dd/MM/yyyy}", khaibaocuoiden.SelectedDate) + "',103)";
        sql += " order by PK_KHAIBAO desc";
        DataTable dtNews = CMS.MsSql.FillDataTable(sql);
        this.gvList.DataSource = dtNews;
        gvList.DataBind();

    }
        
    protected void btnExportExcel_Click(object sender, EventArgs e)
    {

        string str = "SELECT ROW_NUMBER() OVER(ORDER BY C_NGAYGUI desc) as [TT],C_HOTEN AS [Họ và tên], CONCAT('''',C_HOCHIEU) AS [Số hộ chiếu], C_NGAYNHAPCANH AS [Ngày nhập cảnh lần đầu], CONCAT('''',C_SOTHE) AS [Số CMT nước ngoài], CONCAT('''',C_DIENTHOAI) AS [Số điện thoại cá nhân], CONCAT('''',C_DIENTHOAI1) AS [Số điện thoại cá nhân thay đổi(nếu có)], " +
                        " C_TENDN1 as [Tên công ty khai báo lần đầu],  C_TENDN2 as [Thay đổi tên công ty lần 1(nếu có)], case when C_TENDN5 is not null then C_TENDN5 when C_TENDN4 is not null then C_TENDN4 else C_TENDN3 end as [Thay đổi tên công ty lần 2(nếu có)], " +
                        " CONCAT('''',C_DIENTHOAIDN1) AS [Số điện thoại công ty khai báo lần đầu], CONCAT('''',C_DIENTHOAIDN2) AS [Số điện thoại công ty thay đổi lần 1(nếu có)], CONCAT('''',case when C_DIENTHOAIDN5 is not null then C_DIENTHOAIDN5 when C_DIENTHOAIDN4 is not null then C_DIENTHOAIDN4 else C_DIENTHOAIDN3 end) AS [Số điện thoại công ty thay đổi lần 2(nếu có)], " +
                        " dbo.getdiachi_hanquoc(C_DIACHIDN1,null,null,null,null) AS [Địa chỉ công ty khai báo lần đầu], dbo.getdiachi_hanquoc(C_DIACHIDN2,null,null,null,null) AS [Địa chỉ công ty thay đổi lần 1(nếu có)],  dbo.getdiachi_hanquoc(C_DIACHIDN5,C_DIACHIDN4,C_DIACHIDN3,null,null) AS [Địa chỉ công ty thay đổi lần 2(nếu có)]," +
                        //" C_EMAIL AS [Email cá nhân], C_TENDN1 AS [Tên công ty nơi làm việc (1)], C_NGUOISUDUNGLAODONG1 AS [Tên chủ sử dụng lao động (1)], C_DIENTHOAIDN1 AS [Số điện thoại của công ty (1)], " +
                        //" C_DIACHIDN1 AS [Địa chỉ nơi làm việc (1)], C_NGAYLAMVIECDN1 AS [Ngày bắt đầu làm việc tại C.TY (1)], C_TENDN2 AS [Tên công ty nơi làm việc (2)], C_NGUOISUDUNGLAODONG2 AS [Tên chủ sử dụng lao động (2)], " +
                        //" C_DIENTHOAIDN2 AS [Số điện thoại của công ty (2)], C_DIACHIDN2 AS [Địa chỉ nơi làm việc (2)], C_NGAYLAMVIECDN2 AS [Ngày bắt đầu làm việc tại C.TY (2)], C_TENDN3 AS [Tên công ty nơi làm việc (3)], " +
                        //" C_NGUOISUDUNGLAODONG3 AS [Tên chủ sử dụng (3)], C_DIENTHOAIDN3 AS [Số điện thoại của công ty (3)], C_DIACHIDN3 AS [Địa chỉ nơi làm việc (3)], C_NGAYLAMVIECDN3 AS [Ngày bắt đầu làm việc tại C.TY (3)], " +
                        //" C_TENDN4 AS [ Tên công ty nơi làm việc (4)], C_NGUOISUDUNGLAODONG4 AS [Tên chủ sử dụng lao động (4)], C_DIENTHOAIDN4 AS [Số điện thoại của công ty (4)], C_DIACHIDN4 AS [Địa chỉ nơi làm việc (4)], " +
                        //" C_NGAYLAMVIECDN4 AS [Ngày bắt đầu làm việc tại C.TY (4)], " +
                        //" C_TENDN5 AS [Tên công ty nơi làm việc (5)], C_NGUOISUDUNGLAODONG5 AS [Tên chủ sử dụng lao động (5)], C_DIENTHOAIDN5 AS [Số điện thoại của công ty (5)], C_DIACHIDN5 AS [Địa chỉ nơi làm việc (5)], C_NGAYLAMVIECDN5 AS [Ngày bắt đầu làm việc tại C.TY (5)], " +
                        //"C_NGUOISUDUNGLAODONG_HIENTAI AS [Tên chủ sử dụng lao động hiện tại], C_DIACHIDN_HIENTAI AS [Địa chỉ nơi làm việc hiện tại], " +
                        " C_HOPDONGDEN AS [Thời hạn hợp đồng], C_LYDO AS [Lý do về nước], C_NGAYHETHAN AS [Ngày hết hạn lưu trú], C_NGAYDANGKYVENUOC AS [Ngày dự định về nước], C_DOITUCACHLUUTRU AS [Đổi tư cách lưu trú]," +
                        "CONVERT(varchar,C_NGAYKHAIBAODAU,103) AS [Ngày khai báo lần đầu] ,CONVERT(varchar,C_NGAYKHAIBAOCUOI,103) AS [Ngày khai báo bổ sung]" +
                        " FROM T_KHAIBAO_THONGTIN WHERE 1=1 and C_NGAYGUI > '2020-01-01 00:00:00.000'";

        if (GetCheckbox() != "")
        {
            str += " and PK_KHAIBAO IN (" + GetCheckbox() + ")";
        }

        str += " ORDER BY C_NGAYGUI DESC";
        ds = CMS.MsSql.FillDataSet(str);
        Whatever.ExcelExport.ExportDataSetToExcel(ds, ds.Tables[0].Columns[2].Caption + "danh-sach-khai-bao-thong-tin-nguoi-lao-dong-tai-han-quoc.xls");
    }

    protected void gvList_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0 && e.Row.RowIndex <= gvList.Rows.Count)
        {
            e.Row.Cells[0].Text = "<font face=\"tahoma\" size=\"2\">" + (gvList.PageIndex * gvList.PageSize + e.Row.RowIndex + 1) + "</font>";
        }
    }

    protected void gvList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Word")
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvList.Rows[rowIndex];
            string sohochieu = row.Cells[5].Text;
            Whatever.WordExport.ExportForm(gvList.DataKeys[rowIndex].Value.ToString());
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Binddata();
    }
    protected void tbnXoa_Click(object sender, EventArgs e)
    {
        SetGallerys("DELETE FROM T_KHAIBAO_THONGTIN", "xóa");
    }

    private void SetGallerys(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkGallerys");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("ds-khai-bao-thong-tin", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
                return;
            }
            string strSql = sql + " WHERE PK_KHAIBAO IN (" + strIDs + ")";
            CMS.MsSql.ExecuteNonQuery(strSql);
            Binddata();
            lblAlert.Text = "Đã " + mess + " thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn bản ghi cần " + mess;
    }
    protected void tbnImport_Click(object sender, EventArgs e)
    {
        string url = "Default.aspx?ctl=Import";
        Response.Redirect(url);
    }
    protected void gvList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvList.PageIndex = e.NewPageIndex;
        Binddata();
    }
}