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

public partial class Modules_Base_Tim_viecs : System.Web.UI.UserControl
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
    private string _bangcap = "";
    public string Bangcap
    {
        set { _bangcap = value; }
        get { return _bangcap; }
    }


    private bool IsBindData = false;
    int hID;
    protected void Page_Load(object sender, EventArgs e)
    {
        hID = CMS.TTV.Web.Utils.GetIntFromQueryString("hID", -1);
        if (!IsBindData) this.Binddata();
    }
    public void Binddata()
    {
        string sql = "select * from T_TIM_VIEC where C_STATUS=1 ";
        if (hID > 0) sql += " and PK_TIM_VIEC <> " + hID;

        if (_hoso != "") sql += " AND (C_TITLE LIKE N'%" + _hoso + "%')";
        if (_bangcap != "") sql += " AND (C_BANG_CAP LIKE N'%" + _bangcap + "%')";
        if (_nganhnghe != "") sql += " AND (C_NGANH_NGHE_MONG_MUON LIKE N'%" + _nganhnghe + "%')";


        sql += " order by PK_TIM_VIEC desc";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        this.gvArticles.DataSource = dtNews;
        this.gvArticles.DataKeyNames = new string[] { "PK_TIM_VIEC" };
        this.gvArticles.DataBind();
        IsBindData = true;
    }
}
