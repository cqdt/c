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

public partial class Modules_Base_Article : System.Web.UI.UserControl
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
        set { _ArticleID = value; }
        get { return _ArticleID; }
    }

    private bool _IsSetTitle = false;
    public bool IsSetTitle
    {
        set { _IsSetTitle = value; }
        get { return _IsSetTitle; }
    }

    private bool _SortASC = false;
    public bool SortASC
    {
        set { _SortASC = value; }
        get { return _SortASC; }
    }

    private bool _AutoLang = false;
    public bool AutoLang
    {
        set { _AutoLang = value; }
        get { return _AutoLang; }
    }
      

    public int GArticleID = -1;
    public string Title = "";
    public string MenuTitle = "";
    public int MenuID = -1;
    public bool IsTitle = true;
    public bool IsHead = true;
    public bool IsImage = true;
    public int ImageWidth = 0;
    public int ImageHeigth = 0;
    private bool IsBindData = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsBindData) this.Binddata();
    }

    public void Binddata()
    {
        int _iMenuID = MenuID;
        int iLangID = CMS.Lang.LangValue;
        if (_AutoLang && _iMenuID > 0)
        {
            if (iLangID != 1) _iMenuID = CMS.TTV.Web.Menu.GetMenuIDFromMenuID(_iMenuID, iLangID);
        }

        string sql = "SELECT TOP 1 T_ARTICLE.*,T_MENU.C_NAME AS C_MENU_NAME,T_MENU.FK_LANG,T_MENU.C_PARENT FROM [T_ARTICLE],T_MENU WHERE T_MENU.PK_MENU=T_ARTICLE.FK_MENU ";
        if (_iMenuID > 0) sql += " AND T_ARTICLE.FK_MENU=" + _iMenuID;

        if (_ArticleID > 0) sql += " AND T_ARTICLE.PK_ARTICLE=" + _ArticleID;
        sql += " AND T_ARTICLE.C_BEGIN_DATE <= GETDATE() AND T_ARTICLE.C_END_DATE >= GETDATE() ";
        if (_SortASC) sql += " ORDER BY T_ARTICLE.C_ORDER";
        else sql += " ORDER BY T_ARTICLE.C_ORDER DESC";


        DataTable dtArticle = CMS.SqlCache.FillDataTable(sql);
        if (dtArticle.Rows.Count > 0)
        {
            GArticleID = CMS.Utils.ToInteger(dtArticle.Rows[0]["PK_ARTICLE"]);
            Title = dtArticle.Rows[0]["C_TITLE"].ToString();
            MenuTitle = dtArticle.Rows[0]["C_MENU_NAME"].ToString();
            MenuID = CMS.Utils.ToInteger(dtArticle.Rows[0]["FK_MENU"]);

            IsTitle = CMS.Utils.ToBoolean(dtArticle.Rows[0]["C_IS_TITLE"]);
            IsHead = CMS.Utils.ToBoolean(dtArticle.Rows[0]["C_IS_HEAD"]);
            IsImage = CMS.Utils.ToBoolean(dtArticle.Rows[0]["C_IS_IMAGE"]);
            ImageWidth = CMS.Utils.ToInteger(dtArticle.Rows[0]["C_IMAGE_WIDTH"]);
            ImageHeigth = CMS.Utils.ToInteger(dtArticle.Rows[0]["C_IMAGE_HEIGTH"]);
            int icLangID = CMS.Utils.ToInteger(dtArticle.Rows[0]["FK_LANG"]);
            int iMenuIsRead = CMS.Utils.ToInteger(dtArticle.Rows[0]["C_PARENT"]);           
            //if (icLangID != iLangID)
            //{
            //    CMS.Lang.LangValue = icLangID;
            //    Response.Redirect(Request.Url.AbsoluteUri);
            //}           
        }

        if (!_IsSetTitle)
        {
            this.Page.Title = Newwind.Setting.Title + " -> " + Title;
        }

        this.dlArticle.DataSource = dtArticle;
        this.dlArticle.DataKeyField = "PK_ARTICLE";
        this.dlArticle.DataBind();

        IsBindData = true;
    }
}
