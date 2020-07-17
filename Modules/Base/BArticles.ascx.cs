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

public partial class Modules_Base_BArticles : System.Web.UI.UserControl
{
    private string _Type = "";
    public string Type
    {
        set { _Type = value; }
        get { return _Type; }
    }

    private int _RepeatColumns = 1;
    public int RepeatColumns
    {
        set { _RepeatColumns = value; }
        get { return _RepeatColumns; }
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

    private int _ArticleID = -1;
    public int ArticleID
    {
        set { _ArticleID = value; }
        get { return _ArticleID; }
    }

    private bool _IsHot = false;
    public bool IsHot
    {
        set { _IsHot = value; }
        get { return _IsHot; }
    }

    private bool _IsParent = false;
    public bool IsParent
    {
        set { _IsParent = value; }
        get { return _IsParent; }
    }

    private bool _IsNHot = false;
    public bool IsNHot
    {
        set { _IsNHot = value; }
        get { return _IsNHot; }
    }

    private bool _AutoLang = false;
    public bool AutoLang
    {
        set { _AutoLang = value; }
        get { return _AutoLang; }
    }

    private bool _SortASC = false;
    public bool SortASC
    {
        set { _SortASC = value; }
        get { return _SortASC; }
    }

    private int _ArticleOrtherID = -1;
    public int ArticleOrtherID
    {
        set { _ArticleOrtherID = value; }
        get { return _ArticleOrtherID; }
    }

    public string Module_Detail = "Article";
    public string MenuTitle = "";
    private bool IsBindData = false;
    public string imgnew = "";



    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsBindData) this.Binddata();
    }

    public void Binddata()
    {
        int _iMenuID = _MenuID;
        //if (_AutoLang && _MenuID > 0)
        //{
        //    int iLangID = CMS.Lang.LangValue;
        //    if (iLangID != 1) _iMenuID = CMS.TTV.Web.Menu.GetMenuIDFromMenuID(_iMenuID, iLangID);
        //}

        string sql = "SELECT TOP " + _Count + " T_ARTICLE.*,T_MENU.C_NAME AS C_NAME_MENU FROM [T_ARTICLE],T_MENU WHERE T_MENU.PK_MENU=T_ARTICLE.FK_MENU AND T_ARTICLE.C_STATUS=1 ";
        if (!_IsParent) { if (_iMenuID > 0) sql += " AND T_ARTICLE.FK_MENU=" + _iMenuID; }
        else
        {
            string strIDs = "";
            CMS.TTV.Web.Menu.GetListMenuID(null, _iMenuID, ref strIDs);
            if (strIDs != "") strIDs = strIDs + "-1";
            if (_iMenuID >= 0) sql += " AND T_ARTICLE.FK_MENU IN (" + strIDs + ")";
        }
        if (_IsHot) sql += " AND T_ARTICLE.C_HOT=1";
        if (_IsNHot) sql += " AND T_ARTICLE.C_HOT=0";
        if (_ArticleID > 0)
        {
            if (_iMenuID == -1) sql += " AND T_ARTICLE.FK_MENU=(SELECT [FK_MENU] FROM [T_ARTICLE] WHERE [PK_ARTICLE]=" + _ArticleID + ") ";
            if (!_IsParent)
            {
                if (_SortASC) sql += " AND T_ARTICLE.C_ORDER>(SELECT C_ORDER FROM T_ARTICLE WHERE PK_ARTICLE=" + _ArticleID + ")";
                else sql += " AND T_ARTICLE.C_ORDER<(SELECT C_ORDER FROM T_ARTICLE WHERE PK_ARTICLE=" + _ArticleID + ")";
            }
            else
            {
                if (_SortASC) sql += " AND T_ARTICLE.PK_ARTICLE>" + _ArticleID;
                else sql += " AND T_ARTICLE.PK_ARTICLE<" + _ArticleID;
            }
        }
        if (_ArticleOrtherID > 0) sql += " AND T_ARTICLE.PK_ARTICLE!=" + _ArticleOrtherID;
        sql += " AND T_ARTICLE.C_BEGIN_DATE <= GETDATE() AND T_ARTICLE.C_END_DATE >= GETDATE() ";
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
            if (!_IsParent) MenuTitle = CMS.Utils.ToString(dtNews.Rows[0]["C_NAME_MENU"]);
            else MenuTitle = CMS.SqlCache.ExecuteToString("SELECT [C_NAME] FROM [T_MENU] WHERE PK_MENU=" + _iMenuID);
            int c_moi = CMS.Utils.ToInteger(dtNews.Rows[0]["C_MOI"]);
            if (c_moi == 1) imgnew = "<img src=\"" + Newwind.VQS.URL + "/images/new.gif" + "\" alt=\"new\" class=\"iconnew\" />";

        }
        this.dlBArticles.DataSource = dtNews;
        this.dlBArticles.DataKeyField = "PK_ARTICLE";
        this.dlBArticles.RepeatColumns = _RepeatColumns;
        this.dlBArticles.DataBind();

        IsBindData = true;
    }

}
