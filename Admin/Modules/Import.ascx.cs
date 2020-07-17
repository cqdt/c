using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

public partial class Admin_Modules_Import : System.Web.UI.UserControl
{
    DataTable dt = new DataTable();
    DataSet ds = new DataSet();
    public int total;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Import", CMS.TTV.Rules.ONE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền truy cập phần này...", this.Page);
            CMS.Utility.HtmlHelper.Back(-1, this.Page);
            return;
        }

        lblthongbao.Text = "Cập nhật từ file excel";

        

    }


    

    protected void btnImport_Click(object sender, EventArgs e)
    {
        TextBox txtSheet = dvExcel.FindControl("txtSheet") as TextBox;
        TextBox txtRows = dvExcel.FindControl("txtRows") as TextBox;
        TextBox txtBRows = dvExcel.FindControl("txtBRows") as TextBox;

        Inport(txtSheet.Text.Trim(), CMS.Utils.ToInteger(txtRows.Text.Trim()), CMS.Utils.ToInteger(txtBRows.Text.Trim()));

        
    }

    private void Inport(string sheet, int row, int BRow)
    {
        Random rnd = new Random();
        string strFile1 = TTV.Utils.UploadImage2(dvExcel, "fuFile1", "Import", rnd);
        if (strFile1 == "ERR_TYPE")
        {
            CMS.Utility.HtmlHelper.Alert("File không đúng định dạng.Vui lòng Upload file .xls, .xlsx", this.Page);
            return;
        }
        if (strFile1 == "NO_FILE" || strFile1 == "ERR_SAVE") strFile1 = "";


        string url = strFile1;
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

            TTV.Utils.Import_khaibaothongtin(dt.Rows[i][0].ToString(), dt.Rows[i][1].ToString(), dt.Rows[i][2].ToString(), dt.Rows[i][3].ToString(), dt.Rows[i][4].ToString(), dt.Rows[i][5].ToString(), dt.Rows[i][6].ToString(), dt.Rows[i][7].ToString()
                , dt.Rows[i][8].ToString(), dt.Rows[i][9].ToString(), dt.Rows[i][10].ToString(), dt.Rows[i][11].ToString(), dt.Rows[i][12].ToString(), dt.Rows[i][13].ToString(), dt.Rows[i][14].ToString(), dt.Rows[i][15].ToString(), dt.Rows[i][16].ToString()
                , dt.Rows[i][17].ToString(), dt.Rows[i][18].ToString(), dt.Rows[i][19].ToString(), dt.Rows[i][20].ToString(), dt.Rows[i][21].ToString(), dt.Rows[i][22].ToString(), dt.Rows[i][23].ToString(), dt.Rows[i][24].ToString(), dt.Rows[i][25].ToString()
                , dt.Rows[i][26].ToString(), dt.Rows[i][27].ToString(), dt.Rows[i][28].ToString(), dt.Rows[i][29].ToString(), dt.Rows[i][30].ToString(), dt.Rows[i][31].ToString(), dt.Rows[i][32].ToString(), dt.Rows[i][33].ToString(), dt.Rows[i][34].ToString()
                , dt.Rows[i][35].ToString(), dt.Rows[i][36].ToString());
           
        }
        string urladmin = "Default.aspx?ctl=ds-khai-bao-thong-tin&mess=Bạn đã thêm mới thành công";        
        Response.Redirect(urladmin);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx?ctl=ds-khai-bao-thong-tin");
    }

   
}