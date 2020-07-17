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

public partial class Admin_Modules_Tu_nghiep_sinhs : System.Web.UI.UserControl
{
    DataTable dt = new DataTable();
    DataSet ds = new DataSet();
    public int total;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Tu-nghiep-sinhs", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }
        string str = "SELECT * from T_TNS order by PK_TNS desc";
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

    
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetAdvs("DELETE FROM T_TNS", "xóa");
    }
    private void SetAdvs(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkFAQs");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("Tu-nghiep-sinhs", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền " + mess;
                return;
            }
            string strSql = sql + " WHERE PK_TNS IN (" + strIDs + ")";
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
        string url = "Default.aspx?ctl=Tu-nghiep-sinh";
        if (gvListRegister.PageIndex > 0) url += "&Page=" + gvListRegister.PageIndex;
        url += "&PageSize=" + ddlPageSize.SelectedValue;
        Response.Redirect(url);
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
            CMS.Utility.HtmlHelper.Alert("Bạn đang mở file này. Đề nghị bạn đóng lại !", this.Page);

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
            string sql = "INSERT INTO T_TNS(C_HO_TEN, C_NGAY_SINH, C_GIOI_TINH, C_DIA_CHI, C_NGHE_NGHIEP, C_KINH_NGHIEM, C_BANG_CAP, C_TRINH_DO_NN, C_NGUYEN_VONG, C_THOI_GIAN_LV, C_MUC_LUONG_YC,C_STATUS) ";
            sql += "VALUES(N'" + dt.Rows[i][0] + "','" + dt.Rows[i][1] + "','" + dt.Rows[i][2] + "',N'" + dt.Rows[i][3] + "',N'" + dt.Rows[i][4] + "',N'" + dt.Rows[i][5] + "',N'" + dt.Rows[i][6] + "',N'" + dt.Rows[i][7] + "',N'" + dt.Rows[i][8] + "',N'" + dt.Rows[i][9] + "',N'" + dt.Rows[i][10] + "',1)";
            CMS.MsSql.ExecuteNonQuery(sql);
        }
        string urladmin = "Default.aspx?ctl=Tu-nghiep-sinhs&mess=Bạn đã thêm mới thành công";
        if (Request.QueryString["Page"] != null) urladmin += "&Page=" + Request.QueryString["Page"];
        Response.Redirect(urladmin);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx?ctl=Tu-nghiep-sinhs");
    }
}
