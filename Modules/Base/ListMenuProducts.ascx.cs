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

public partial class Modules_Base_ListMenuProducts : System.Web.UI.UserControl
{
    private int _MenuID = -1;
    public int MenuID
    {
        set { _MenuID = value; }
        get { return _MenuID; }
    }
    public string Title = "";
    public string Module_Detail = "Articles";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Binddata();    
    }
    public void Binddata()
    {

        string sql = "SELECT  * FROM [T_MENU] WHERE C_STATUS=1";
        if (_MenuID > 0) sql += " AND T_MENU.C_PARENT = " + _MenuID;
        sql += " ORDER BY C_ORDER";

        this.dlListProducts.DataSource = CMS.SqlCache.FillDataTable(sql);
        this.dlListProducts.DataKeyField = "PK_MENU";
        this.dlListProducts.DataBind();
    }
}
