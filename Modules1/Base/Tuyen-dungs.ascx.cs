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

public partial class Modules_Base_Tuyen_dungs : System.Web.UI.UserControl
{

    private string _hoso = "";
    public string Hoso
    {
        set { _hoso = value; }
        get { return _hoso; }
    }
    private string _nganhnghe = "";
    public string Nganhnghe
    {
        set { _nganhnghe = value; }
        get { return _nganhnghe; }
    }
    private string _diadiem = "";
    public string Diadiem
    {
        set { _diadiem = value; }
        get { return _diadiem; }
    }


    private bool IsBindData = false;
    int tID;
    protected void Page_Load(object sender, EventArgs e)
    {
        tID = CMS.TTV.Web.Utils.GetIntFromQueryString("tID", -1);
        if (!IsBindData) this.Binddata();
    }
    public void Binddata()
    {
        string sql = "select * from T_TUYEN_DUNG where C_STATUS=1 ";
         if (tID > 0) sql += " and PK_TUYEN_DUNG <> " + tID;
         if (_hoso != "") sql += " AND (C_TITLE LIKE N'%" + _hoso + "%')";
         if (_diadiem != "") sql += " AND (C_DIA_DIEM_LAM_VIEC LIKE N'%" + _diadiem + "%')";
         if (_nganhnghe != "") sql += " AND (C_LINH_VUC LIKE N'%" + _nganhnghe + "%')";
       sql+=" order by PK_TUYEN_DUNG desc";       
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);

        this.gvArticles.DataSource = dtNews;
        this.gvArticles.DataKeyNames = new string[] { "PK_TUYEN_DUNG" };
        this.gvArticles.DataBind();
        IsBindData = true;
    }
}
