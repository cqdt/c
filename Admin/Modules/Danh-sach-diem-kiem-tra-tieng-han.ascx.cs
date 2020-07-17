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

public partial class Admin_Modules_Danh_sach_diem_kiem_tra_tieng_han : System.Web.UI.UserControl
{
    public int total;
    DataTable dt = new DataTable();
    public double Totalss = 0;
    public double GetTotal(double value)
    {
        Totalss += value;
        return value;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Danh-sach-diem-kiem-tra-tieng-han", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }
        string str = "SELECT * from T_DIEM_DANG_KY_KIEM_TRA_TIENG_HAN";
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
        catch
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
            string sql = "INSERT INTO T_DIEM_DANG_KY_KIEM_TRA_TIENG_HAN(C_HO_TEN,C_NGAY_SINH,C_CMND,C_TINH,C_HUYEN,C_DIA_CHI_HIEN_TAI,C_THOI_GIAN_HOC,C_CO_SO_DAO_TAO,C_PHONE,C_MOBILE,C_DIA_CHI_BAO_TIN,C_DON_VI,C_NGANH,C_NGAY_DK,C_SBD,C_DIEM_DOC,C_DIEM_NGHE,C_TRANGTHAI,C_STATUS) ";
            sql += "VALUES(N'" + dt.Rows[i][0] + "','" + String.Format("{0:g}", dt.Rows[i][1]) + "',N'" + dt.Rows[i][2] + "',N'" + dt.Rows[i][3] + "',N'" + dt.Rows[i][4] + "',N'" + dt.Rows[i][5] + "',N'" + dt.Rows[i][6] + "',N'" + dt.Rows[i][7] + "',N'" + dt.Rows[i][8] + "',N'" + dt.Rows[i][9] + "',N'" + dt.Rows[i][10] + "',N'" + dt.Rows[i][11] + "',N'" + dt.Rows[i][12] + "','" + String.Format("{0:g}", dt.Rows[i][13]) + "',N'" + dt.Rows[i][14] + "',N'" + dt.Rows[i][15] + "',N'" + dt.Rows[i][16] + "',N'" + dt.Rows[i][17] + "',1)";
            CMS.MsSql.ExecuteNonQuery(sql);
        }
        string urladmin = "Default.aspx?ctl=Danh-sach-diem-kiem-tra-tieng-han&mess=Bạn đã thêm mới thành công";
        if (Request.QueryString["Page"] != null) urladmin += "&Page=" + Request.QueryString["Page"];
        Response.Redirect(urladmin);
    }
     protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx?ctl=Danh-sach-diem-kiem-tra-tieng-han");
    }
     protected void btnDelete_Click(object sender, EventArgs e)
     {
         SetAdvs("DELETE FROM T_DIEM_DANG_KY_KIEM_TRA_TIENG_HAN", "xóa");
     }
     private void SetAdvs(string sql, string mess)
     {
         string[] arrID = Request.Form.GetValues("chkFAQs");
         if (arrID != null)
         {
             string strIDs = String.Join(",", arrID);
             if (!CMS.TTV.Rule.IsModuleRule("Danh-sach-diem-kiem-tra-tieng-han", CMS.TTV.Rules.APPROVE))
             {
                 lblAlert.Text = "Bạn không có quyền " + mess;
                 return;
             }
             string strSql = sql + " WHERE PK_DANG_KY IN (" + strIDs + ")";
             CMS.MsSql.ExecuteNonQuery(strSql);
             gvListRegister.DataBind();
             lblAlert.Text = "Đã " + mess + " thành công";
         }
         else lblAlert.Text = "Bạn chưa chọn đối tượng cần " + mess;
     }
}
