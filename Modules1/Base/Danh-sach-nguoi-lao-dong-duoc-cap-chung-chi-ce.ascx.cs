using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class Modules_Base_Danh_sach_nguoi_lao_dong_duoc_cap_chung_chi_ce : System.Web.UI.UserControl
{

    private string _Hoten = "";
    public string Hoten
    {
        set { _Hoten = value; }
        get { return _Hoten; }
    }
    private string _SoHC = "";
    public string SoHC
    {
        set { _SoHC = value; }
        get { return _SoHC; }
    }
    private string _MaTTDT = "";
    public string MaTTDT
    {
        set { _MaTTDT = value; }
        get { return _MaTTDT; }
    }

    private string _Tn = "";
    public string Tn
    {
        set { _Tn = value; }
        get { return _Tn; }
    }
    private string _Dn = "";
    public string Dn
    {
        set { _Dn = value; }
        get { return _Dn; }
    }
    private bool IsBindData = false;
    //private int iPage;  
    DataTable dtNews = new DataTable();   
   
    protected void Page_Load(object sender, EventArgs e)
    {
        btnExportExcel.Enabled = false;
        if ((_Hoten != "") || (_SoHC != "") || (_MaTTDT != "") || (_Tn != ""))
        {
            if (!IsBindData) this.Binddata();
        }
    }   

    public void Binddata()
    {        
        string sql = "select * from T_CAP_CE where 1=1";
        if (_Hoten != "") sql += " AND (T_CAP_CE.C_HO_TEN LIKE N'%" + _Hoten + "%')";
        if (_SoHC != "") sql += " AND T_CAP_CE.C_SO_HO_CHIEU LIKE N'%" + _SoHC + "%'";
        if (_MaTTDT != "") sql += " AND T_CAP_CE.C_MA_TRUNG_TAM ='" + _MaTTDT + "'";      
        if (_Tn != "") sql += " AND CONVERT(DATETIME,C_NGAY_CAP,103) BETWEEN CONVERT(DATETIME,'" + _Tn + "',103) AND CONVERT(DATETIME,'" + _Dn + "',103)";//CONVERT(DATETIME,'" + _Tn + "',103)<= CONVERT(DATETIME,C_NGAY_CAP,103)<=CONVERT(DATETIME,'" + _Dn + "',103)";
        dtNews = CMS.MsSql.FillDataTable(sql);
        if (dtNews.Rows.Count > 0) btnExportExcel.Enabled = true;
        else btnExportExcel.Enabled = false;
        this.gvArticles.DataSource = dtNews;
        this.gvArticles.DataKeyNames = new string[] { "PK_CE" };
        this.gvArticles.DataBind();
        IsBindData = true;
    }
    protected void gvArticles_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0 && e.Row.RowIndex <= gvArticles.Rows.Count)
        {
            e.Row.Cells[0].Text = "<font face=\"tahoma\" size=\"2\">" + (gvArticles.PageIndex * gvArticles.PageSize + e.Row.RowIndex + 1) + "</font>";
        }
    }  
    protected void btnExportExcel_Click(object sender, EventArgs e)
    {        
        string str = "SELECT t.C_MA_SO_LAO_DONG as [Số báo danh],t.C_HO_TEN as [Họ tên],convert(datetime, t.C_NGAY_SINH,103) as [Ngày sinh],t.C_DIA_CHI as [Địa chỉ],t.C_SO_HO_CHIEU as [Số hộ chiếu],t.C_TRUNG_TAM_DT as [Trung tâm đào tạo],t.C_MA_TRUNG_TAM as [Mã trung tâm đào tạo],t.C_SO_CHUNG_CHI as [Số chứng chỉ],convert(datetime,t.C_NGAY_CAP,103) as [Ngày cấp] from T_CAP_CE as t where 1=1";
        if (_Hoten != "") str += " AND (t.C_HO_TEN LIKE N'%" + _Hoten + "%')";
        if (_SoHC != "") str += " AND t.C_SO_HO_CHIEU LIKE N'%" + _SoHC + "%'";
        if (_MaTTDT != "") str += " AND t.C_MA_TRUNG_TAM ='" + _MaTTDT + "'"; 
        if (_Tn != "") str += " AND CONVERT(DATETIME,t.C_NGAY_CAP,103) BETWEEN CONVERT(DATETIME,'" + _Tn + "',103) AND CONVERT(DATETIME,'" + _Dn + "',103)";
        //str += " order by t.PK_CE desc";
        DataSet ds = new DataSet();     
        ds = CMS.MsSql.FillDataSet(str);        
        Whatever.ExcelExport.ExportDataSetToExcel(ds, "danhsach.xls");
    }        
}
