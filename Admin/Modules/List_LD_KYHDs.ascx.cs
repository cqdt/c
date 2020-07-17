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


public partial class Admin_Modules_List_LD_KYHDs : System.Web.UI.UserControl
{
    public DataTable dt = new DataTable();
    DataSet ds = new DataSet();
    public int total;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("List_LD_KYHDs", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }
        string str = "SELECT * FROM T_LD_KYHD";
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
            CMS.Utility.HtmlHelper.Alert("Bạn đang mở file này. Đề nghị bạn đóng lại !", this.Page);

            return;
        }
        
        if (sheet == "") sheet = "Sheet1";
        OleDbDataAdapter da = new OleDbDataAdapter("SELECT * FROM [" + sheet + "$]", Cnn);
        try
        {
            da.Fill(dt);
        }
        catch {
            CMS.Utility.HtmlHelper.Alert("Tên Sheet không đúng !", this.Page);
            
            return;

        }
        
        Cnn.Close();
        int rows;
        int Brows;
        if (BRow > 0) Brows = BRow-1;
        else Brows = 1;
        if (row > 0) rows = row;
        else rows=dt.Rows.Count;
        for (int i = Brows; i < rows; i++)
        {
            string sql = "INSERT INTO T_LD_KYHD(C_HO_TEN,C_NAME,C_NGAY_SINH,C_CMND,C_DON_VI,C_KHOA_HOC,C_NGAY_TAP_TRUNG,C_DIA_DIEM,C_STATUS,C_SBD) ";
            sql += "VALUES(N'" + dt.Rows[i][0] + "','" + Newwind.VN.Remove(dt.Rows[i][0].ToString()) + "',N'" + dt.Rows[i][1] + "',N'" + dt.Rows[i][2] + "',N'" + dt.Rows[i][3] + "',N'" + dt.Rows[i][4] + "',N'" + dt.Rows[i][5] + "',N'" + dt.Rows[i][6] + "',1,N'" + dt.Rows[i][7] + "')";
            CMS.MsSql.ExecuteNonQuery(sql);
        }
        
        string urladmin = "Default.aspx?ctl=List_LD_KYHDs&mess=Bạn đã thêm mới thành công";
        if (Request.QueryString["Page"] != null) urladmin += "&Page=" + Request.QueryString["Page"];
        Response.Redirect(urladmin);
    }

    protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvListLD.PageSize = CMS.Utils.ToInteger(ddlPageSize.SelectedValue);
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx?ctl=List_LD_KYHDs");
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetAdvs("DELETE FROM T_LD_KYHD", "xóa");
    }
    private void SetAdvs(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkFAQs");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("List_LD_KYHDs", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền " + mess;
                return;
            }
            string strSql = sql + " WHERE PK_LD IN (" + strIDs + ")";
            CMS.MsSql.ExecuteNonQuery(strSql);
            gvListLD.DataBind();
            lblAlert.Text = "Đã " + mess + " thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn đối tượng cần " + mess;
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("List_LD_KYHDs", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }
        string sql = "";
        for (int i = 0; i < gvListLD.Rows.Count; i++)
        {
            int ID = CMS.Utils.ToInteger(gvListLD.DataKeys[i].Value);
            string SBD = CMS.Utils.ToString((gvListLD.Rows[i].Cells[10].FindControl("txtSBD") as TextBox).Text);
            string txtName = CMS.Utils.ToString((gvListLD.Rows[i].Cells[3].FindControl("txtName") as TextBox).Text);
            string txtNGaysinh = CMS.Utils.ToString((gvListLD.Rows[i].Cells[4].FindControl("txtNGaysinh") as TextBox).Text);
            string txtCMND = CMS.Utils.ToString((gvListLD.Rows[i].Cells[5].FindControl("txtCMND") as TextBox).Text);
            string txtDonvi = CMS.Utils.ToString((gvListLD.Rows[i].Cells[6].FindControl("txtDonvi") as TextBox).Text);
            string txtKhoahoc = CMS.Utils.ToString((gvListLD.Rows[i].Cells[7].FindControl("txtKhoahoc") as TextBox).Text);
            string txtNGaytaptrung = CMS.Utils.ToString((gvListLD.Rows[i].Cells[8].FindControl("txtNGaytaptrung") as TextBox).Text);
            string txtDiadiem = CMS.Utils.ToString((gvListLD.Rows[i].Cells[9].FindControl("txtDiadiem") as TextBox).Text);
            bool bKho = CMS.Utils.ToBoolean((gvListLD.Rows[i].Cells[6].FindControl("rblKho") as RadioButtonList).SelectedValue);
            int iKho = bKho ? 1 : 0;
            sql += "UPDATE T_LD_KYHD SET C_SBD='" + SBD + "',C_HO_TEN=N'" + txtName + "',C_NAME='" + Newwind.VN.Remove(txtName) + "',C_NGAY_SINH='" + txtNGaysinh + "',C_CMND='" + txtCMND + "',C_DON_VI=N'" + txtDonvi + "',C_KHOA_HOC=N'" + txtKhoahoc + "',C_NGAY_TAP_TRUNG='" + txtNGaytaptrung + "',C_DIA_DIEM=N'" + txtDiadiem + "',C_STATUS=" + iKho + " WHERE PK_LD=" + ID + "";
        }        
        lblAlert.Text = "Đã cập nhập thành công!";
        if (sql != "") CMS.MsSql.ExecuteNonQuery(sql);
    }
    protected void gvListLD_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0 && e.Row.RowIndex <= gvListLD.Rows.Count)
        {
            e.Row.Cells[0].Text = "<font face=\"tahoma\" size=\"2\">" + (gvListLD.PageIndex * gvListLD.PageSize + e.Row.RowIndex + 1) + "</font>";
        }
    }
}
