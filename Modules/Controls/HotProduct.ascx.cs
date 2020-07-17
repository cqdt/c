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

public partial class Modules_Controls_HotProduct : System.Web.UI.UserControl
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

    private bool _IsHot = false;
    public bool IsHot
    {
        set { _IsHot = value; }
        get { return _IsHot; }
    }

    private int _Count = 5;
    public int Count
    {
        set { _Count = value; }
        get { return _Count; }
    }

    private bool IsBindData = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsBindData) this.Binddata();
    }

    public void Binddata()
    {
        string sql = "SELECT * FROM T_PRODUCT WHERE C_STATUS=1 ";      
        string strIDs = "";
        CMS.TTV.Web.Menu.GetListMenuID(null, _MenuID, ref strIDs);
        if (strIDs != "") strIDs = strIDs + "-1";
        if (_MenuID >= 0) sql += " AND T_PRODUCT.FK_MENU IN (" + strIDs + ")";                       
        if (_IsHot) sql += " AND C_HOT=1";
        sql += " ORDER BY PK_PRODUCT DESC";
        DataTable dt = CMS.SqlCache.FillDataTable(sql);

        this.dlProducts.DataSource = dt;
        this.dlProducts.DataKeyField = "PK_PRODUCT";
        if (dt.Rows.Count > 0) this.dlProducts.RepeatColumns = dt.Rows.Count;
        this.dlProducts.DataBind();

        IsBindData = true;
    }

}
