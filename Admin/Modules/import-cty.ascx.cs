using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.IO;
public partial class Admin_Modules_import_cty : System.Web.UI.UserControl
{
    DataTable dt = new DataTable();
    DataSet ds = new DataSet();
    public int total;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("import-cty", CMS.TTV.Rules.ONE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền truy cập phần này...", this.Page);
            CMS.Utility.HtmlHelper.Back(-1, this.Page);
            return;
        }

        lblthongbao.Text = "Cập nhật từ file excel";

        if (Request["mess"] != null)
        {
            lblAlert.Text = Request.QueryString["mess"];
        }



    }

    private void SetAVotes(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkAVotes");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("phien-gdvl", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền " + mess;
                return;
            }
            string strSql = sql + " WHERE ID IN (" + strIDs + ")";
            CMS.MsSql.ExecuteNonQuery(strSql);
            gvAVotes.DataBind();
            lblAlert.Text = "Đã " + mess + " thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn bản ghi cần " + mess;
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetAVotes("DELETE FROM T_PHIEN_GDVL_CHITIET", "xóa");
    }





    protected void btnImport_Click(object sender, EventArgs e)
    {
        TextBox txtSheet = dvExcel.FindControl("txtSheet") as TextBox;
        TextBox txtRows = dvExcel.FindControl("txtRows") as TextBox;
        TextBox txtBRows = dvExcel.FindControl("txtBRows") as TextBox;
        Inport(txtSheet.Text.Trim(), CMS.Utils.ToInteger(txtRows.Text.Trim()), CMS.Utils.ToInteger(txtBRows.Text.Trim()));
       
        string urladmin = "Default.aspx?ctl=import-cty";
        if (Request.QueryString["fID"] != null) urladmin += "&fID=" + Request.QueryString["fID"];
        urladmin += "&mess=Bạn đã import thành công";
        Response.Redirect(urladmin);

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
        int iPhien=0;
        if (Request.QueryString["fID"] != null)
         {
             iPhien= CMS.Utils.ToInteger(Request.QueryString["fID"]);
         }

        for (int i = Brows; i < rows; i++)
        {
            TTV.Utils.Import_GDVL(iPhien, dt.Rows[i][0].ToString(), dt.Rows[i][1].ToString(), dt.Rows[i][2].ToString(), dt.Rows[i][3].ToString());
            this.WriteLog(iPhien + " | " + dt.Rows[i][0].ToString() + " | " + dt.Rows[i][1].ToString() + " | " + dt.Rows[i][2].ToString() + " | " + dt.Rows[i][3].ToString() + "--");
        }
       
    }

    private void WriteLog(string pv_sLog)
    {
        File.AppendAllText(HttpContext.Current.Server.MapPath(".") + @"\Log\ImportCty_" + DateTime.Now.ToString("ddMMMyyyy") + ".txt", pv_sLog + "\n");
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx?ctl=phien-gdvl");
    }

}