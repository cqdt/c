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

public partial class Admin_Modules_Tinh_trang_ho_sos : System.Web.UI.UserControl
{
    public int total;
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Tinh-trang-ho-sos", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }
        string str = "SELECT * from T_HOSO";
        DataSet ds = new DataSet();
        ds = CMS.MsSql.FillDataSet(str);
        total = ds.Tables[0].Rows.Count;
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
    }
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        TextBox txtSheet = dvExcel.FindControl("txtSheet") as TextBox;
        TextBox txtRows = dvExcel.FindControl("txtRows") as TextBox;
        TextBox txtBRows = dvExcel.FindControl("txtBRows") as TextBox;
        Inport(txtSheet.Text.Trim(), CMS.Utils.ToInteger(txtRows.Text.Trim()), CMS.Utils.ToInteger(txtBRows.Text.Trim()));
    }

    private void Inport(string sheet, int row, int BRow)
    {
        TextBox txt = dvExcel.FindControl("txtFileName") as TextBox;
        string url = txt.Text;
        if (url != "") url = url.Substring(2);
        string map = Server.MapPath("");
        string dir = "";
        char[] splitter = { '\\' };
        string[] arInfo = new string[10];
        arInfo = map.Split(splitter);
        for (int x = 0; x < arInfo.Length - 1; x++)
        {
            dir += arInfo[x] + "\\";
        }
        url = url.Replace('/', '\\');
        string dirfull = dir + url;
        OleDbConnection Cnn = new OleDbConnection("provider=Microsoft.Jet.OLEDB.4.0;data source=" + dirfull + "; Extended Properties=\"Excel 8.0;HDR=NO;IMEX=1;\"");

        try
        {
            Cnn.Open();
        }
        catch (Exception ex)
        {
            CMS.Utility.HtmlHelper.Alert("Có lỗi xảy ra!", this.Page);
            return;
        }

        if (sheet == "") sheet = "Sheet1";
        OleDbDataAdapter da = new OleDbDataAdapter("SELECT * FROM [" + sheet + "$]", Cnn);
        try
        {
            da.Fill(dt);
        }
        catch
        {
            CMS.Utility.HtmlHelper.Alert("Tên Sheet không đúng !", this.Page);

            return;

        }
        Cnn.Close();
        int rows;
        int Brows;
        if (BRow > 0) Brows = BRow - 1;
        else Brows = 1;
        if (row > 0) rows = row;
        else rows = dt.Rows.Count;
        for (int i = Brows; i < rows; i++)
        {
            string sql = "INSERT INTO T_HOSO(C_MASO,C_HOTEN, C_NGAYSINH, C_DONVI, C_TINHTRANG, C_GHICHU)";
            sql += "VALUES(N'" + dt.Rows[i][0] + "',N'" + dt.Rows[i][1] + "','" + String.Format("{0:g}", dt.Rows[i][2]) + "',N'" + dt.Rows[i][3] + "',N'" + dt.Rows[i][4] + "',N'" + dt.Rows[i][5] + "')";
            CMS.MsSql.ExecuteNonQuery(sql);
        }
        string urladmin = "Default.aspx?ctl=Tinh-trang-ho-sos&mess=Bạn đã thêm mới thành công";
        if (Request.QueryString["Page"] != null) urladmin += "&Page=" + Request.QueryString["Page"];
        Response.Redirect(urladmin);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx?ctl=Tinh-trang-ho-sos");
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetAdvs("DELETE FROM T_HOSO", "xóa");
    }
    private void SetAdvs(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkFAQs");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("Tinh-trang-ho-sos", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền " + mess;
                return;
            }
            string strSql = sql + " WHERE PK_HOSO IN (" + strIDs + ")";
            CMS.MsSql.ExecuteNonQuery(strSql);
            gvListRegister.DataBind();
            lblAlert.Text = "Đã " + mess + " thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn đối tượng cần " + mess;
    }

}