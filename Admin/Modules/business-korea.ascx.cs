using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

public partial class Admin_Modules_business_korea : System.Web.UI.UserControl
{
    DataTable ds = new DataTable();
    public int total;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("business-korea", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }
        total = CMS.MsSql.ExecuteToInt("select count(*) from T_TUYENDUNG_KR");
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetAVotes("DELETE FROM T_TUYENDUNG_KR", "xóa");
    }
    private void SetAVotes(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkAVotes");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("business-korea", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền " + mess;
                return;
            }
            string strSql = sql + " WHERE ID IN (" + strIDs + ")";
            CMS.MsSql.ExecuteNonQuery(strSql);
            gvList.DataBind();
            lblAlert.Text = "Đã " + mess + " thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn bản ghi cần " + mess;
    }

    protected void btnExportExcel_Click(object sender, EventArgs e)
    {
        string str = "SELECT [C_MATUYENDUNG] [Mã tuyển dụng] " 
	                + ",[C_TENCTY] [Tên công ty] "
                    + ",[C_NGANHNGHE] [Ngành nghề] "
                    + ",[C_MOTA] [Mô tả] "
                    + ",[C_DIACHICTY] + ' - ' + [C_HUYEN] + ' - ' + [C_TINH] [Địa chỉ công ty]      "
                    + ",[C_WEBSITE] [Website] "
                    + ",[C_MR] + [C_NGUOILIENHE] [Người liên hệ]        "
                    + ",[C_CHUCDANH] [Chức danh] "
                    + ",[C_DTLIENHE] [Điện thoại] "
                    + ",[C_EMAIL] [Email]       "
                    + ", convert(varchar, [C_NGAYDK] , 103) [Ngày đăng ký] "
                    + "FROM [dbo].[T_TUYENDUNG_KR] "
                    + "order by ID desc";

        ds = CMS.MsSql.FillDataTable(str);
        //Whatever.ExcelExport.ExportDataSetToExcel(ds, "danh-sach-doanh-nghiep-korea.xls");
        ExportToExcel("danh-sach-doanh-nghiep-korea.xls",ds);
    }

    public void ExportToExcel(string fileName, DataTable dt)
    {
        Response.ContentType = "application/csv";
        Response.Charset = "";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);
        Response.ContentEncoding = Encoding.Unicode;
        Response.BinaryWrite(Encoding.Unicode.GetPreamble());
        DataTable dtb = dt;
        try
        {
            StringBuilder sb = new StringBuilder();
            //Tạo dòng tiêu để cho bảng tính
            for (int count = 0; count < dtb.Columns.Count; count++)
            {
                if (dtb.Columns[count].ColumnName != null)
                    sb.Append(dtb.Columns[count].ColumnName);
                if (count < dtb.Columns.Count - 1)
                {
                    sb.Append("\t");
                }
            }
            Response.Write(sb.ToString() + "\n");
            Response.Flush();
            //Duyệt từng bản ghi 
            int soDem = 0;
            while (dtb.Rows.Count >= soDem + 1)
            {
                sb = new StringBuilder();

                for (int col = 0; col < dtb.Columns.Count - 1; col++)
                {
                    if (dtb.Rows[soDem][col] != null)
                        sb.Append(dtb.Rows[soDem][col].ToString().Replace(",", " "));
                    sb.Append("\t");
                }
                if (dtb.Rows[soDem][dtb.Columns.Count - 1] != null)
                    sb.Append(dtb.Rows[soDem][dtb.Columns.Count - 1].ToString().Replace(",", " "));

                Response.Write(sb.ToString() + "\n");
                Response.Flush();
                soDem = soDem + 1;
            }

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }

        dtb.Dispose();

        Response.End();
    }


    protected void gvList_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0 && e.Row.RowIndex <= gvList.Rows.Count)
        {
            e.Row.Cells[0].Text = "<font face=\"tahoma\" size=\"2\">" + (gvList.PageIndex * gvList.PageSize + e.Row.RowIndex + 1) + "</font>";
        }
    }


}