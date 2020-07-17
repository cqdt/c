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

public partial class Modules_BDS_ListNewsArticles : System.Web.UI.UserControl
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

    protected void Page_Load(object sender, EventArgs e)
    {
        this.Binddata();
    }

    public void Binddata()
    {
        string sql = "SELECT * FROM T_MENU WHERE C_PARENT=" + _MenuID + " AND C_STATUS=1 AND C_HOME=1 ORDER BY C_ORDER";
      //  int KKK = CMS.MsSql.ExecuteToInt("SELECT COUNT(PK_MENU) FROM T_MENU WHERE C_PARENT=" + _MenuID + " AND C_STATUS=1 AND C_HOME=1");
        this.dlListNewsHome.DataSource = CMS.MsSql.FillDataTable(sql);
        this.dlListNewsHome.DataKeyField = "PK_MENU";
        this.dlListNewsHome.DataBind();
    }
}
