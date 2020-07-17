using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class Modules_Base_List_nguoi_lao_dong_xc : System.Web.UI.UserControl
{
    private string _Search = "";
    public string Search
    {
        set { _Search = value; }
        get { return _Search; }
    }
    private string _SBD = "";
    public string SBD
    {
        set { _SBD = value; }
        get { return _SBD; }
    }
    private bool IsBindData = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsBindData) this.Binddata();
    }
    public void Binddata()
    {
        string sql = "select * from T_XC where C_STATUS=1";
        if (_SBD != "") sql += " AND (T_XC.C_SBD ='" + _SBD + "')";
        else return;
        if (_Search != "") sql += "AND (T_XC.C_HO_TEN LIKE N'%" + _Search + "%' OR T_XC.C_NAME LIKE N'%" + _Search + "%')";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        this.gvArticles.DataSource = dtNews;
        this.gvArticles.DataKeyNames = new string[] { "PK_XC" };
        this.gvArticles.DataBind();
    }
}
