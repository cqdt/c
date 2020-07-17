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

public partial class Modules_Base_Top1News : System.Web.UI.UserControl
{
    private string _Type = "";
    public string Type
    {
        set { _Type = value; }
        get { return _Type; }
    }

    private int _ArticleID = -1;
    public int ArticleID
    {
        get { return _ArticleID; }
    }

    private int _MenuID = -1;
    public int MenuID
    {
        set { _MenuID = value; }
        get { return _MenuID; }
    }

    private bool _IsSetTitle = false;
    public bool IsSetTitle
    {
        set { _IsSetTitle = value; }
        get { return _IsSetTitle; }
    }

    private bool _IsHot = false;
    public bool IsHot
    {
        set { _IsHot = value; }
        get { return _IsHot; }
    }

    private bool _IsNHot = false;
    public bool IsNHot
    {
        set { _IsNHot = value; }
        get { return _IsNHot; }
    }

    private bool _SortASC = false;
    public bool SortASC
    {
        set { _SortASC = value; }
        get { return _SortASC; }
    }

    private int _ImageWidth = 90;
    public int ImageWidth
    {
        set { _ImageWidth = value; }
        get { return _ImageWidth; }
    }

    private int _ImageHeight = 0;
    public int ImageHeight
    {
        set { _ImageHeight = value; }
        get { return _ImageHeight; }
    }

    private bool _IsParent = false;
    public bool IsParent
    {
        set { _IsParent = value; }
        get { return _IsParent; }
    }
    

    public int MenuChange = -1;
    public string Title = "";
    public string Module_Detail = "Article";
    private bool IsBindData = false;
    public int _iMenuID;
    public string imgnew = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsBindData) this.Binddata();
    }

    public void Binddata()
    {
       _iMenuID = _MenuID;
        
        MenuChange = _iMenuID;

        string sql = "SELECT TOP 1 T_ARTICLE.*,T_MENU.C_NAME AS C_NAME_MENU FROM [T_ARTICLE],T_MENU WHERE T_MENU.PK_MENU=T_ARTICLE.FK_MENU AND T_ARTICLE.C_STATUS=1 ";
        if (!_IsParent) { if (_iMenuID > 0) sql += " AND T_ARTICLE.FK_MENU=" + _iMenuID; }
        else
        {
            string strIDs = "";
            CMS.TTV.Web.Menu.GetListMenuID(null, _iMenuID, ref strIDs);
            if (strIDs != "") strIDs = strIDs + "-1";
            if (_iMenuID >= 0) sql += " AND T_ARTICLE.FK_MENU IN (" + strIDs + ")";
        }
        sql += " AND T_ARTICLE.C_BEGIN_DATE <= GETDATE() AND T_ARTICLE.C_END_DATE >= GETDATE() ";
        if (_IsHot) sql += " AND T_ARTICLE.C_HOT=1";
        if (_IsNHot) sql += " AND T_ARTICLE.C_HOT=0";

        if (!_IsParent)
        {
            if (_SortASC) sql += " ORDER BY T_ARTICLE.C_ORDER";
            else sql += " ORDER BY T_ARTICLE.C_ORDER DESC";
        }
        else
        {
            if (_SortASC) sql += " ORDER BY T_ARTICLE.PK_ARTICLE";
            else sql += " ORDER BY T_ARTICLE.PK_ARTICLE DESC";
        }
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        if (dtNews.Rows.Count > 0)
        {
            _ArticleID = CMS.Utils.ToInteger(dtNews.Rows[0]["PK_ARTICLE"]);
            if (!_IsParent) Title = CMS.Utils.ToString(dtNews.Rows[0]["C_NAME_MENU"]);
            else Title = CMS.SqlCache.ExecuteToString("SELECT [C_NAME] FROM [T_MENU] WHERE PK_MENU=" + _iMenuID);

            int c_moi = CMS.Utils.ToInteger(dtNews.Rows[0]["C_MOI"]);
            if (c_moi == 1) imgnew = "<img src=\"" + Newwind.VQS.URL + "/images/new.gif" + "\" alt=\"new\" class=\"iconnew\" />";

        }
        else
        {
            Title = CMS.SqlCache.ExecuteToString("SELECT [C_NAME] FROM [T_MENU] WHERE PK_MENU=" + _iMenuID);
        }
        this.dlTop1News.DataSource = dtNews;
        this.dlTop1News.DataBind();

        //if (!_IsSetTitle && Title != "")
        //{
        //    //this.Page.Title = Newwind.Setting.Title + " -> " + Title;
        //}

        IsBindData = true;
    }

   
}
