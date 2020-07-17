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

public partial class Modules_Base_Articles : System.Web.UI.UserControl
{
    public delegate void PageIndex(int index);
    public event PageIndex PageIndexChange;

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

    private int _Count = 5;
    public int Count
    {
        set { _Count = value; }
        get { return _Count; }
    }

    private string _Search = "";
    public string Search
    {
        set { _Search = value; }
        get { return _Search; }
    }

    private bool _IsPage = false;
    public bool IsPage
    {
        set { _IsPage = value; }
        get { return _IsPage; }
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

    private bool _IsParent = false;
    public bool IsParent
    {
        set { _IsParent = value; }
        get { return _IsParent; }
    }

    private bool _AutoLang = true;
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


    private int _Rows = 10;
    public int Rows
    {
        set { _Rows = value; }
        get { return _Rows; }
    }

    private int _MaxPage = 10;
    public int MaxPage
    {
        set { _MaxPage = value; }
        get { return _MaxPage; }
    }

    public int PagerID
    {
        get
        {
            int iPage = CMS.TTV.Web.Utils.GetIntFromQueryString(GetPagerID, 0);
            if (iPage < 0) iPage = 0;
            return iPage;
        }
    }
    public string GetPagerID { get { return this.ClientID.Replace("ctl00_Articles1_gvArticles_", "").Replace("ctl00_cphMain_", "") + "_trang"; } }
    public string GetURL
    {
        get
        {
            string strUrl = "";
            string strKey = "";
            string strValue = "";
            for (int i = 0; i < Request.QueryString.Count; i++)
            {
                strKey = Request.QueryString.GetKey(i);
                strValue = Request.QueryString[strKey];
                if (strKey.ToLower() == GetPagerID.ToLower()) continue;
                if (strUrl == "") strUrl = "Default.aspx?" + strKey + "=" + Server.UrlEncode(strValue);
                else strUrl += "&" + strKey + "=" + Server.UrlEncode(strValue);
            }
            return strUrl;
        }
    }

    int _index = 0;
    public int Index { get { return _index++; } }

    public string strHtmlPage = "";

    public string Title = "";
    public string Module_Detail = "Article";
    private bool IsBindData = false;
    public int Counts = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsBindData) this.Binddata();
    }

    public void Binddata()
    {
        int _iMenuID = _MenuID;
        int iLangID = CMS.Lang.LangValue;
        if (_AutoLang && _MenuID > 0)
        {
           // if (iLangID != 1) _iMenuID = CMS.TTV.Web.Menu.GetMenuIDFromMenuID(_iMenuID, iLangID);
        }

        string sql = "SELECT T_ARTICLE.*,T_MENU.C_NAME AS C_NAME_MENU,T_MENU.FK_LANG,T_MENU.C_PARENT FROM [T_ARTICLE],T_MENU WHERE T_MENU.PK_MENU=T_ARTICLE.FK_MENU AND T_ARTICLE.C_STATUS=1 ";
        if (_IsPage) sql = "SELECT TOP " + _Count + " T_ARTICLE.*,T_MENU.C_NAME AS C_NAME_MENU,T_MENU.FK_LANG,T_MENU.C_PARENT  FROM [T_ARTICLE],T_MENU WHERE T_MENU.PK_MENU=T_ARTICLE.FK_MENU AND T_ARTICLE.C_STATUS=1 ";
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
        //if (_Search != "") sql += " AND (T_ARTICLE.C_TITLE LIKE N'%" + _Search + "%' OR T_ARTICLE.C_HEAD LIKE N'%" + _Search + "%')";
        if (_Search != "") sql += " AND (T_ARTICLE.C_TITLE LIKE N'%" + _Search.Replace("'", "").Replace("\"", "") + "%' OR T_ARTICLE.C_HEAD LIKE N'%" + _Search.Replace("'", "").Replace("\"", "") + "%' OR PK_ARTICLE IN (" + SearchUnsign(_Search.Replace("'", "").Replace("\"", "")) + "))";
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
            Title = CMS.Utils.ToString(dtNews.Rows[0]["C_NAME_MENU"]);
            Counts = dtNews.Rows.Count;
        }
        int iStart = 0;
        int iEnd = 0;
        int iPage = CMS.TTV.Web.Utils.GetIntFromQueryString("trang", 0);
        if (iPage < 0) iPage = 0;
        strHtmlPage = TTV.Utils.PageMultiDataList(Counts, 1, _Rows, iPage, _MaxPage, "trang", "next", ref iStart, ref iEnd);  
        //_index = PagerID * _Rows + 1;
        //gvArticles.PageIndex = PagerID;

        

        this.gvArticles.DataSource = TTV.Utils.DTPage(dtNews, iStart, iEnd);
        this.gvArticles.DataKeyNames = new string[] { "PK_ARTICLE" };
        this.gvArticles.PageSize = _Rows;
        if (_IsPage) this.gvArticles.AllowPaging = false;
        if (Type == "VBLQ")
        {
            gvArticles.BackColor = System.Drawing.ColorTranslator.FromHtml("#eff1f3");
            gvArticles.AlternatingRowStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#e4e4e4");
            gvArticles.RowStyle.CssClass = "vblq";
        }
        this.gvArticles.DataBind();

        if (gvArticles.Rows.Count > 0) _ArticleID = CMS.Utils.ToInteger(gvArticles.DataKeys[gvArticles.Rows.Count - 1].Value);

        if (!_IsSetTitle && Title != "")
        {
            this.Page.Title = Newwind.Setting.Title + " - " + Title;
        }
       
        IsBindData = true;
    }

    public string SearchUnsign(string strSearch)
    {
        string strPK = "-1";
        string sql = "SELECT PK_ARTICLE,C_TITLE, C_HEAD FROM T_ARTICLE WHERE C_STATUS=1";
        DataTable dt = CMS.SqlCache.FillDataTable(sql);
        strSearch = TTV.Utils.ConvertStringToUnSign(strSearch);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {

                string sql1 = "SELECT PK_ARTICLE FROM T_ARTICLE WHERE '" + TTV.Utils.ConvertStringToUnSign(dt.Rows[i]["C_TITLE"].ToString()).Replace("'", " ") + "' LIKE '%" + strSearch + "%' OR '" + TTV.Utils.ConvertStringToUnSign(dt.Rows[i]["C_HEAD"].ToString()).Replace("'", " ") + "' LIKE '%" + strSearch + "%'";
                DataTable dt1 = CMS.SqlCache.FillDataTable(sql1);
                if (dt1.Rows.Count > 0)
                    strPK += "," + dt.Rows[i]["PK_ARTICLE"].ToString();

            }
        }
        return strPK;

    }
   
    public string Replace(object _obj)
    {
        string str = _obj.ToString();
        if (_Search != "")
        {
            str = CMS.TTV.Web.Utils.Replace(_Search, "<font class=\"cms_search\">" + _Search + "</font>", str);
        }
        return str;
    }
}
