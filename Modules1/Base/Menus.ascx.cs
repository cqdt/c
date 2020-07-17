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

public partial class Modules_Base_Menus : System.Web.UI.UserControl
{
    private int _MenuID = -1;
    public int MenuID
    {
        set { _MenuID = value; }
        get { return _MenuID; }
    }

    private bool _AutoLang = false;
    public bool AutoLang
    {
        set { _AutoLang = value; }
        get { return _AutoLang; }
    }

    public string Module_Detail = "Articles";
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Binddata();
    }

    public void Binddata()
    {
        int _iMenuID = _MenuID;
        if (_AutoLang) _iMenuID = CMS.TTV.Web.Menu.GetMenuIDFromMenuID(_iMenuID);

        string sql = "SELECT * FROM [T_MENU] WHERE [C_STATUS]=1 AND C_PARENT=" + _iMenuID;
        sql += " ORDER BY [C_ORDER]";
        this.dlMenus.DataSource = CMS.SqlCache.FillDataTable(sql);
        this.dlMenus.DataKeyField = "PK_MENU" ;
        this.dlMenus.DataBind();
    }
}
