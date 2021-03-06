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

public partial class Modules_Base_MenuPs : System.Web.UI.UserControl
{
    private int _MenuID = -1;
    public int MenuID
    {
        set { _MenuID = value; }
        get { return _MenuID; }
    }

    private bool IsBindData = false;
    public string strMenuHtml = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsBindData) this.Binddata();
    }

    public void Binddata()
    {
        if (_MenuID < 6) this.Visible = false;
        string sql = "SELECT PK_MENU,C_NAME FROM T_MENU WHERE C_STATUS=1 AND C_PARENT=" + _MenuID + " ORDER BY C_ORDER";
        DataTable dtMenus = CMS.SqlCache.FillDataTable(sql);
        if (dtMenus != null && dtMenus.Rows.Count > 0)
        {
            for (int i = 0; i < dtMenus.Rows.Count; i++)
            {
                strMenuHtml += "<a href=\"Default.aspx?ctl=Products&pID=" + dtMenus.Rows[i]["PK_MENU"] + "\">" + dtMenus.Rows[i]["C_NAME"] + "</a>&nbsp;&nbsp;";
            }
        }
        else
        {
            this.Visible = false;
        }
    }
}
