using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;


public partial class Admin_Modules_danh_sach_bao_hiem : System.Web.UI.UserControl
{
    public int total;
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("danh-sach-bao-hiem", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }
        string str = "SELECT * from T_BAOHIEM";
        DataSet ds = new DataSet();
        ds = CMS.MsSql.FillDataSet(str);
        total = ds.Tables[0].Rows.Count;
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
            string sql = "INSERT INTO T_BAOHIEM([C_ORDER],[C_CMNDNN],[C_HOTEN],[C_NGAYSINH],[C_HOCHIEU],[C_LOAIBH],[C_SOXACNHAN],[C_THOIGIANTHAMGIA],[C_THOIHANKETTHUC],[C_SOTIEN],[C_NGAYVENUOC],[C_DIACHI]) ";
            sql += "VALUES(N'" + dt.Rows[i][0] + "','" + dt.Rows[i][1] + "',N'" + dt.Rows[i][2] + "',N'" + dt.Rows[i][3] + "',N'" + dt.Rows[i][4] + "',N'" + dt.Rows[i][5] + "',N'" + dt.Rows[i][6] + "',N'" + dt.Rows[i][7] + "',N'" + dt.Rows[i][8] + "',N'" + dt.Rows[i][9] + "',N'" + dt.Rows[i][10] + "',N'" + dt.Rows[i][11] + "')";
            CMS.MsSql.ExecuteNonQuery(sql);
        }
        string urladmin = "Default.aspx?ctl=danh-sach-bao-hiem&mess=Thao tác thành công";
        if (Request.QueryString["Page"] != null) urladmin += "&Page=" + Request.QueryString["Page"];
        Response.Redirect(urladmin);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx?ctl=danh-sach-bao-hiem");
    }
    protected void btnXoa_Click(object sender, EventArgs e)
    {
        string sqldel = "delete from T_BAOHIEM";
        CMS.MsSql.ExecuteNonQuery(sqldel);

    }


   


}