using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Modules_Base_FAQ : System.Web.UI.UserControl
{
    private string _Type = "";
    public string Type
    {
        set { _Type = value; }
        get { return _Type; }
    }
    private string _Search = "";
    public string Search
    {
        set { _Search = value; }
        get { return _Search; }
    }

    private int _LV = 0;
    public int LV
    {
        set { _LV = value; }
        get { return _LV; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Binddata();
    }

    public void Binddata()
    {
        //int iLangID = CMS.Lang.LangValue;
        string sql = "SELECT * FROM T_FAQ WHERE FK_LANG=1";// +iLangID;
        sql += " AND C_STATUS=1";
        if (_Type != "") sql += " AND C_TYPE='" + _Type + "'";
        if (_Search != "") sql += " AND C_TITLE LIKE N'%" + _Search + "%'";
        if (_LV > 0) sql += " AND FK_MENU=" + _LV;
        sql += " ORDER BY C_ORDER DESC";
        this.gvFAQ.DataSource = CMS.SqlCache.FillDataTable(sql);
        this.gvFAQ.DataKeyNames = new string[] { "PK_FAQ" };
        this.gvFAQ.DataBind();
    }

    protected void gvFAQ_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        this.Binddata();
        gvFAQ.PageIndex = e.NewPageIndex;
        gvFAQ.DataBind();
    }
}
