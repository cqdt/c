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

public partial class Modules_Base_ListTopNews : System.Web.UI.UserControl
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


    private bool _AutoLang = false;
    public bool AutoLang
    {
        set { _AutoLang = value; }
        get { return _AutoLang; }
    }

    
    public string Title = "";
    public string Module_Detail = "Article";      
    protected void Page_Load(object sender, EventArgs e)
    {         

        this.Binddata();    
    }

    public void Binddata()
    {

        string sql = "SELECT TOP " + _Count + " * FROM [T_ARTICLE] WHERE C_STATUS=1";
        string strIDs = "";
        int _iMenuID = _MenuID;
        if (_AutoLang && _MenuID > 0)
        {
            int iLangID = CMS.Lang.LangValue;
            if (iLangID != 1) _iMenuID = CMS.TTV.Web.Menu.GetMenuIDFromMenuID(_iMenuID, iLangID);
        }
        CMS.TTV.Web.Menu.GetListMenuID(null, _iMenuID, ref strIDs);
        if (strIDs != "") strIDs = strIDs + "-1";
        if (_MenuID >= 0) sql += " AND T_ARTICLE.FK_MENU IN (" + strIDs + ")";              
               sql += " ORDER BY PK_ARTICLE DESC";

        this.dlListTopNews.DataSource = CMS.SqlCache.FillDataTable(sql);
        this.dlListTopNews.DataKeyField = "PK_ARTICLE";
        this.dlListTopNews.DataBind();
    }
}
