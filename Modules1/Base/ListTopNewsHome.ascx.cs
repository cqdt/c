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

public partial class Modules_Base_ListTopNewsHome : System.Web.UI.UserControl
{
    private string _Type = "";
    public string Type
    {
        set { _Type = value; }
        get { return _Type; }
    }
    private int _MenuID = -1;
    public int MenuID
    {
        set { _MenuID = value; }
        get { return _MenuID; }
    }

    private int _Count = 5;
    public int Count
    {
        set { _Count = value; }
        get { return _Count; }
    }
    public string Title = "";
    public string Module_Detail = "Article";     
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Binddata(); 
    }

    public void Binddata()
    {

        string sql = "SELECT * FROM [T_ARTICLE] WHERE C_STATUS=1";
        if (_MenuID >= 0) sql += " AND T_ARTICLE.FK_MENU=" + _MenuID;
        if (_Type == "") sql += " AND PK_ARTICLE not in (select top 2 PK_ARTICLE from T_ARTICLE WHERE C_STATUS=1 AND T_ARTICLE.FK_MENU=" + _MenuID + " ORDER BY PK_ARTICLE DESC)";
        sql += " ORDER BY PK_ARTICLE DESC";
        this.gvLinks.DataSource = CMS.SqlCache.FillDataTable(sql);       
        this.gvLinks.DataKeyNames = new string[] { "PK_ARTICLE" };
        if (_Type == "THONGBAO") gvLinks.PageSize = 4;
        this.gvLinks.DataBind();        
    }
    protected void gvLinks_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        this.Binddata();
        this.gvLinks.PageIndex = e.NewPageIndex;
        this.gvLinks.DataBind();
    }
}
